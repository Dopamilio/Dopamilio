/**
 * DopamilioNFT.ts
 *
 * 3,333 unique degenerates etched on Bitcoin.
 * OP-721 NFT collection on OPNet — extends OP721 base (btc-runtime 1.11.0).
 *
 * tokenURI: baseURI + '/' + tokenId + '.json'  (tokenIds are 1-based: 1 → 3333)
 *
 * Phases (mainnet): owner calls startMint() → TEAM (0s) → WL (7d) → PUBLIC
 * WL uses Merkle tree proof. Owner calls setWLRoot(root) before startMint().
 *
 * Custom storage pointers — allocated AFTER 16 base pointers
 * (14 OP721 internal + 2 ReentrancyGuard). Absolute slots 17–24.
 * Order is FIXED — never insert, only append:
 *   17  mintPrice      StoredU256  (lazy)
 *   18  startTime      StoredU256  (lazy)
 *   19  treasury       StoredString (lazy)
 *   20  teamMap        AddressMemoryMap (eager)
 *   21  wlMerkleRoot   StoredU256  (lazy)   ← Merkle root for WL verification
 *   22  mintedWlMap    AddressMemoryMap (eager)
 *   23  mintedPubMap   AddressMemoryMap (eager)
 *   24  mintedTeamMap  AddressMemoryMap (eager)
 */

import { u256 } from '@btc-vision/as-bignum/assembly';
import {
    OP721,
    OP721InitParameters,
    Blockchain,
    Address,
    Calldata,
    BytesWriter,
    Revert,
    StoredU256,
    StoredString,
    NetEvent,
    SafeMath,
    EMPTY_POINTER,
    U8_BYTE_LENGTH,
    U64_BYTE_LENGTH,
    U256_BYTE_LENGTH,
    U32_BYTE_LENGTH,
} from '@btc-vision/btc-runtime/runtime';
import { AddressMemoryMap } from '@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap';
import { keccak256, keccak256Concat } from '@btc-vision/btc-runtime/runtime';

// ── Compile-time config ──────────────────────────────────────────────────────

const IS_TESTNET:    bool = false;
const TEAM_DURATION: u64 = 600_000;      // TEST: 10 min — change to 0 for mainnet
const WL_DURATION:   u64 = 600_000;      // TEST: 10 min — change to 604_800_000 (7d) for mainnet

// ── Collection constants ─────────────────────────────────────────────────────

const BASE_URI:    string = 'https://dopamilio.vercel.app/api/metadata';
const ICON_URL:    string = 'https://dopamilio.vercel.app/icon.png';
const BANNER_URL:  string = 'https://dopamilio.vercel.app/banner.png';
const WEBSITE_URL: string = 'https://dopamilio.xyz';
const DESCRIPTION: string = '3,333 unique degenerates etched on Bitcoin. 100% on-chain. Pure dopamine.';
const TREASURY:    string = 'opt1pv5z0n6gn0n8szljp7dewl52548zyvt48pt406cl607wen22amalqfpft8p';

// ── Mint constants ────────────────────────────────────────────────────────────

const DEFAULT_MINT_PRICE: u64  = 6969;
const MAX_SUPPLY:         u256 = u256.fromU64(3333);
const MAX_MINT_TEAM:      u64  = 10;
const MAX_MINT_WL:        u64  = 3;
const MAX_MINT_PUBLIC:    u64  = 5;

// ── Phase IDs ─────────────────────────────────────────────────────────────────

const PHASE_NOT_STARTED: u8 = 0;
const PHASE_TEAM:        u8 = 1;
const PHASE_WL:          u8 = 2;
const PHASE_PUBLIC:      u8 = 3;

// ── Custom storage pointers (AFTER OP721 base's 14 internal pointers) ─────────

const mintPricePointer:     u16 = Blockchain.nextPointer;
const startTimePointer:     u16 = Blockchain.nextPointer;
const treasuryPointer:      u16 = Blockchain.nextPointer;
const teamMapPointer:       u16 = Blockchain.nextPointer;
const wlMerkleRootPointer:  u16 = Blockchain.nextPointer;  // slot 21
const mintedWlPointer:      u16 = Blockchain.nextPointer;
const mintedPubPointer:     u16 = Blockchain.nextPointer;
const mintedTeamPointer:    u16 = Blockchain.nextPointer;

// ── Events ────────────────────────────────────────────────────────────────────

@final
class MintStartedEvent extends NetEvent {
    constructor(startTime: u256) {
        const data = new BytesWriter(U256_BYTE_LENGTH);
        data.writeU256(startTime);
        super('MintStarted', data);
    }
}

@final
class TreasuryUpdatedEvent extends NetEvent {
    constructor(addr: string) {
        const b = new BytesWriter(U32_BYTE_LENGTH + addr.length);
        b.writeStringWithLength(addr);
        super('TreasuryUpdated', b);
    }
}

@final
class WLRootSetEvent extends NetEvent {
    constructor(root: u256) {
        const data = new BytesWriter(U256_BYTE_LENGTH);
        data.writeU256(root);
        super('WLRootSet', data);
    }
}

// ── DopamilioNFT ─────────────────────────────────────────────────────────────

@final
export class DopamilioNFT extends OP721 {

    // ── Lazy getters for custom StoredU256 / StoredString ─────────────────────

    private __mintPrice: StoredU256 | null = null;
    private get _mintPrice(): StoredU256 {
        if (!this.__mintPrice) this.__mintPrice = new StoredU256(mintPricePointer, EMPTY_POINTER);
        return this.__mintPrice!;
    }

    private __startTime: StoredU256 | null = null;
    private get _startTime(): StoredU256 {
        if (!this.__startTime) this.__startTime = new StoredU256(startTimePointer, EMPTY_POINTER);
        return this.__startTime!;
    }

    private __treasury: StoredString | null = null;
    private get _treasury(): StoredString {
        if (!this.__treasury) this.__treasury = new StoredString(treasuryPointer, 0);
        return this.__treasury!;
    }

    private __wlRoot: StoredU256 | null = null;
    private get _wlRoot(): StoredU256 {
        if (!this.__wlRoot) this.__wlRoot = new StoredU256(wlMerkleRootPointer, EMPTY_POINTER);
        return this.__wlRoot!;
    }

    // ── Eager AddressMemoryMaps (safe in constructor — no encodePointer) ──────

    private readonly _teamMap:       AddressMemoryMap = new AddressMemoryMap(teamMapPointer);
    private readonly _mintedWlMap:   AddressMemoryMap = new AddressMemoryMap(mintedWlPointer);
    private readonly _mintedPubMap:  AddressMemoryMap = new AddressMemoryMap(mintedPubPointer);
    private readonly _mintedTeamMap: AddressMemoryMap = new AddressMemoryMap(mintedTeamPointer);

    public constructor() {
        super();
    }

    // ── Deployment ────────────────────────────────────────────────────────────

    public override onDeployment(_calldata: Calldata): void {
        this.instantiate(
            new OP721InitParameters(
                'Dopamilio',
                'DOPAMINE',
                BASE_URI,
                MAX_SUPPLY,
                BANNER_URL,
                ICON_URL,
                WEBSITE_URL,
                DESCRIPTION,
            ),
            true,
        );

        this._mintPrice.value = u256.fromU64(DEFAULT_MINT_PRICE);
        this._treasury.value  = TREASURY;
    }

    public onUpdate(_calldata: Calldata): void {}

    // ── tokenURI override (append /id.json to base) ───────────────────────────

    @view
    @method({ name: 'tokenId', type: ABIDataTypes.UINT256 })
    @returns({ name: 'uri', type: ABIDataTypes.STRING })
    public override tokenURI(calldata: Calldata): BytesWriter {
        const tokenId = calldata.readU256();
        if (!this._exists(tokenId)) throw new Revert('DopamilioNFT: nonexistent token');
        const uri = this.baseURI + '/' + tokenId.toString() + '.json';
        const w = new BytesWriter(U32_BYTE_LENGTH + uri.length);
        w.writeStringWithLength(uri);
        return w;
    }

    // ── mint(amount, proof) ───────────────────────────────────────────────────

    @method(
        { name: 'amount', type: ABIDataTypes.UINT64 },
        { name: 'proof',  type: ABIDataTypes.ARRAY_OF_UINT256 },
    )
    @returns({ name: 'firstTokenId', type: ABIDataTypes.UINT256 })
    public mint(calldata: Calldata): BytesWriter {
        const sender = Blockchain.tx.sender;

        // Direct wallet calls only — reject contract-to-contract
        if (!sender.equals(Blockchain.tx.origin)) {
            throw new Revert('DopamilioNFT: direct calls only');
        }

        const amount = calldata.readU64();
        if (amount === 0) throw new Revert('DopamilioNFT: amount must be > 0');
        if (amount > 10)  throw new Revert('DopamilioNFT: max 10 per tx');

        const phase = this._getPhase();

        // ── Phase + wallet cap checks ──────────────────────────────────────────
        if (!IS_TESTNET) {
            if (phase === PHASE_NOT_STARTED) throw new Revert('DopamilioNFT: mint not started');

            if (phase === PHASE_TEAM) {
                if (this._teamMap.get(sender).isZero()) throw new Revert('DopamilioNFT: not in team list');
                const minted = this._mintedTeamMap.get(sender).toU64();
                if (SafeMath.add64(minted, amount) > MAX_MINT_TEAM)
                    throw new Revert('DopamilioNFT: team cap exceeded');
                // proof not consumed in team phase — leftover bytes ignored
            } else if (phase === PHASE_WL) {
                // Read and verify merkle proof
                const proof = calldata.readU256Array();
                if (!this._verifyMerkleProof(sender, proof)) {
                    throw new Revert('NGMI anon — ur not on the list, go touch grass');
                }
                const minted = this._mintedWlMap.get(sender).toU64();
                if (SafeMath.add64(minted, amount) > MAX_MINT_WL)
                    throw new Revert('greedy anon — 3 is enough, u already minted ur bag');
            } else {
                // PUBLIC — no proof needed
                const minted = this._mintedPubMap.get(sender).toU64();
                if (SafeMath.add64(minted, amount) > MAX_MINT_PUBLIC)
                    throw new Revert('DopamilioNFT: public cap exceeded');
            }
        }

        // ── Supply check ──────────────────────────────────────────────────────
        const firstTokenId = this._nextTokenId.value;
        if (SafeMath.add(firstTokenId, u256.fromU64(amount)) > SafeMath.add(MAX_SUPPLY, u256.One)) {
            throw new Revert('DopamilioNFT: supply exhausted');
        }

        // ── Payment check ─────────────────────────────────────────────────────
        const required: u64 = SafeMath.mul64(this._mintPrice.value.toU64(), amount);
        if (!IS_TESTNET || Blockchain.tx.outputs.length > 0) {
            if (!IS_TESTNET && Blockchain.tx.outputs.length === 0) {
                throw new Revert('DopamilioNFT: missing outputs');
            }
            const treasury = this._treasury.value;
            if (treasury.length === 0) throw new Revert('DopamilioNFT: treasury not set');
            if (this._getPaymentToTreasury() < required) {
                throw new Revert('DopamilioNFT: insufficient payment');
            }
        }

        // ── Mint each token via OP721 base ────────────────────────────────────
        for (let i: u64 = 0; i < amount; i++) {
            const tokenId = SafeMath.add(firstTokenId, u256.fromU64(i));
            this._mint(sender, tokenId);
        }

        this._nextTokenId.value = SafeMath.add(firstTokenId, u256.fromU64(amount));

        // ── Update per-phase minted counters ──────────────────────────────────
        if (!IS_TESTNET) {
            if (phase === PHASE_TEAM) {
                const prev = this._mintedTeamMap.get(sender).toU64();
                this._mintedTeamMap.set(sender, u256.fromU64(SafeMath.add64(prev, amount)));
            } else if (phase === PHASE_WL) {
                const prev = this._mintedWlMap.get(sender).toU64();
                this._mintedWlMap.set(sender, u256.fromU64(SafeMath.add64(prev, amount)));
            } else {
                const prev = this._mintedPubMap.get(sender).toU64();
                this._mintedPubMap.set(sender, u256.fromU64(SafeMath.add64(prev, amount)));
            }
        }

        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(firstTokenId);
        return result;
    }

    // ── Internal: Merkle proof verification ───────────────────────────────────

    private _verifyMerkleProof(addr: Address, proof: u256[]): bool {
        const root = this._wlRoot.value;
        if (root.isZero()) return false;

        // leaf = keccak256(keccak256(addr_bytes_32))
        // addr extends Uint8Array (32 bytes) — passed directly
        let current = keccak256(keccak256(addr));

        for (let i: i32 = 0; i < proof.length; i++) {
            const nodeBytes = this._u256ToBytes32(proof[i]);
            if (this._cmpBytes32(current, nodeBytes) <= 0) {
                current = keccak256Concat(current, nodeBytes);
            } else {
                current = keccak256Concat(nodeBytes, current);
            }
        }

        return u256.fromUint8ArrayBE(current) == root;
    }

    // ── Helpers ───────────────────────────────────────────────────────────────

    private _u256ToBytes32(v: u256): Uint8Array {
        const w = new BytesWriter(U256_BYTE_LENGTH);
        w.writeU256(v);
        return w.getBuffer();
    }

    private _cmpBytes32(a: Uint8Array, b: Uint8Array): i32 {
        for (let i: i32 = 0; i < 32; i++) {
            if (a[i] < b[i]) return -1;
            if (a[i] > b[i]) return 1;
        }
        return 0;
    }

    // ── Internal: current phase ───────────────────────────────────────────────

    private _getPhase(): u8 {
        if (IS_TESTNET) return PHASE_PUBLIC;
        const start = this._startTime.value.toU64();
        if (start === 0) return PHASE_NOT_STARTED;
        const now     = Blockchain.block.medianTimestamp;
        const elapsed = now > start ? now - start : 0;
        if (elapsed < TEAM_DURATION)              return PHASE_TEAM;
        if (elapsed < TEAM_DURATION + WL_DURATION) return PHASE_WL;
        return PHASE_PUBLIC;
    }

    // ── Internal: sum of BTC sent to treasury in tx outputs ──────────────────

    private _getPaymentToTreasury(): u64 {
        const outputs  = Blockchain.tx.outputs;
        const treasury = this._treasury.value;
        let total: u64 = 0;
        for (let i: i32 = 0; i < outputs.length; i++) {
            const out = outputs[i];
            if (!out.to) continue;
            if (out.to === treasury) total = SafeMath.add64(total, out.value);
        }
        return total;
    }

    // ── Admin: startMint ──────────────────────────────────────────────────────

    @method()
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public startMint(_calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        if (IS_TESTNET) throw new Revert('DopamilioNFT: use testnet mode');
        if (!this._startTime.value.isZero()) throw new Revert('DopamilioNFT: already started');
        const ts = u256.fromU64(Blockchain.block.medianTimestamp);
        this._startTime.value = ts;
        Blockchain.emit(new MintStartedEvent(ts));
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // ── Admin: setWLRoot (call BEFORE startMint) ──────────────────────────────

    @method({ name: 'root', type: ABIDataTypes.UINT256 })
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public setWLRoot(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        const root = calldata.readU256();
        if (root.isZero()) throw new Revert('DopamilioNFT: root cannot be zero');
        this._wlRoot.value = root;
        Blockchain.emit(new WLRootSetEvent(root));
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // ── Admin: addToTeamList ──────────────────────────────────────────────────

    @method({ name: 'addr', type: ABIDataTypes.ADDRESS })
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public addToTeamList(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        const addr = calldata.readAddress();
        if (addr.equals(Address.zero())) throw new Revert('DopamilioNFT: zero address');
        this._teamMap.set(addr, u256.One);
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // ── Admin: setMintPrice ───────────────────────────────────────────────────

    @method({ name: 'priceSats', type: ABIDataTypes.UINT256 })
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public setMintPrice(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        const price = calldata.readU256();
        if (price.isZero()) throw new Revert('DopamilioNFT: price must be > 0');
        this._mintPrice.value = price;
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // ── Admin: setTreasuryAddress ─────────────────────────────────────────────

    @method({ name: 'addr', type: ABIDataTypes.STRING })
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public setTreasuryAddress(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        const addr = calldata.readStringWithLength();
        if (addr.length === 0) throw new Revert('DopamilioNFT: empty address');
        this._treasury.value = addr;
        Blockchain.emit(new TreasuryUpdatedEvent(addr));
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // ── Views ─────────────────────────────────────────────────────────────────

    @view
    @returns({ name: 'priceSats', type: ABIDataTypes.UINT256 })
    public getMintPrice(_calldata: Calldata): BytesWriter {
        const price = this._mintPrice.value.isZero()
            ? u256.fromU64(DEFAULT_MINT_PRICE)
            : this._mintPrice.value;
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(price);
        return result;
    }

    @view
    @returns({ name: 'phase', type: ABIDataTypes.UINT8 })
    public getPhase(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U8_BYTE_LENGTH);
        result.writeU8(this._getPhase());
        return result;
    }

    @view
    @returns({ name: 'startTime', type: ABIDataTypes.UINT256 })
    public getStartTime(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._startTime.value);
        return result;
    }

    @view
    @returns({ name: 'teamDuration', type: ABIDataTypes.UINT64 })
    public getTeamDuration(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U64_BYTE_LENGTH);
        result.writeU64(TEAM_DURATION);
        return result;
    }

    @view
    @returns({ name: 'wlDuration', type: ABIDataTypes.UINT64 })
    public getWlDuration(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U64_BYTE_LENGTH);
        result.writeU64(WL_DURATION);
        return result;
    }

    @view
    @returns({ name: 'isTestnet', type: ABIDataTypes.BOOL })
    public getIsTestnet(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(1);
        result.writeBoolean(IS_TESTNET);
        return result;
    }

    @view
    @returns({ name: 'addr', type: ABIDataTypes.STRING })
    public getTreasuryAddress(_calldata: Calldata): BytesWriter {
        const addr = this._treasury.value;
        const result = new BytesWriter(U32_BYTE_LENGTH + addr.length);
        result.writeStringWithLength(addr);
        return result;
    }

    @view
    @returns({ name: 'wlRoot', type: ABIDataTypes.UINT256 })
    public getWLRoot(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._wlRoot.value);
        return result;
    }

    @view
    @method(
        { name: 'addr',  type: ABIDataTypes.ADDRESS },
        { name: 'phase', type: ABIDataTypes.UINT8 },
    )
    @returns({ name: 'count', type: ABIDataTypes.UINT256 })
    public getMintedCount(calldata: Calldata): BytesWriter {
        const addr  = calldata.readAddress();
        const phase = calldata.readU8();
        let count = u256.Zero;
        if (phase === 1)      count = this._mintedTeamMap.get(addr);
        else if (phase === 2) count = this._mintedWlMap.get(addr);
        else if (phase === 3) count = this._mintedPubMap.get(addr);
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(count);
        return result;
    }
}
