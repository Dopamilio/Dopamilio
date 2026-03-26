/**
 * DopamilioNFT.ts
 *
 * 3,333 unique degenerates etched on Bitcoin.
 * OP-721 NFT collection on OPNet — extends OP721 base (btc-runtime 1.11.0).
 *
 * tokenURI: baseURI + '/' + tokenId + '.json'  (tokenIds are 1-based: 1 → 3333)
 *
 * Phases: TEAM (15 min, deployer only) → WL (1 hour, Merkle proof) → PUBLIC
 * WL: setWLRoot(root) then startMint() — two separate admin transactions.
 * WL proof: double-keccak256 leaf, sorted-pair nodes (Merkle tree).
 *
 * Deployer bypass: deployer can mint in ANY phase, only supply check applies.
 *
 * Custom storage pointers — allocated AFTER 16 base pointers
 * (14 OP721 internal + 2 ReentrancyGuard). Absolute slots 17–22.
 * Order is FIXED — never insert, only append:
 *   17  mintPrice      StoredU256  (lazy)
 *   18  startTime      StoredU256  (lazy)
 *   19  treasury       StoredString (lazy)
 *   20  wlMerkleRoot   StoredU256  (lazy)
 *   21  mintedWlMap    AddressMemoryMap (eager)
 *   22  mintedPubMap   AddressMemoryMap (eager)
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
import { keccak256 } from '@btc-vision/btc-runtime/runtime/hashing/keccak256';

// Compile-time config

const IS_TESTNET:    bool = false;
const TEAM_DURATION: u64 = 900_000;      // 15 minutes in ms
const WL_DURATION:   u64 = 3_600_000;   // 1 hour in ms

// Collection constants

const BASE_URI:    string = 'https://dopamilio.xyz/api/metadata';
const ICON_URL:    string = 'https://dopamilio.xyz/icon.png';
const BANNER_URL:  string = 'https://dopamilio.xyz/banner.png';
const WEBSITE_URL: string = 'https://dopamilio.xyz';
const DESCRIPTION: string = '3,333 unique degenerates etched on Bitcoin. 100% on-chain. Pure dopamine.';
const TREASURY:    string = 'opt1pv5z0n6gn0n8szljp7dewl52548zyvt48pt406cl607wen22amalqfpft8p';

// Mint constants

const DEFAULT_MINT_PRICE: u64  = 6969;
const MAX_SUPPLY:         u256 = u256.fromU64(3333);
const MAX_MINT_WL:        u64  = 3;
const MAX_MINT_PUBLIC:    u64  = 5;

// Phase IDs

const PHASE_NOT_STARTED: u8 = 0;
const PHASE_TEAM:        u8 = 1;
const PHASE_WL:          u8 = 2;
const PHASE_PUBLIC:      u8 = 3;

// Custom storage pointers (AFTER OP721 base's 16 internal pointers)

const mintPricePointer:    u16 = Blockchain.nextPointer;  // slot 17
const startTimePointer:    u16 = Blockchain.nextPointer;  // slot 18
const treasuryPointer:     u16 = Blockchain.nextPointer;  // slot 19
const wlMerkleRootPointer: u16 = Blockchain.nextPointer;  // slot 20
const mintedWlPointer:     u16 = Blockchain.nextPointer;  // slot 21
const mintedPubPointer:    u16 = Blockchain.nextPointer;  // slot 22

// Events

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

// DopamilioNFT

@final
export class DopamilioNFT extends OP721 {

    // Lazy getters for custom StoredU256 / StoredString

    private __mintPrice: StoredU256 | null = null;
    private get _mintPrice(): StoredU256 {
        if (!this.__mintPrice) this.__mintPrice = new StoredU256(mintPricePointer, EMPTY_POINTER);
        return this.__mintPrice as StoredU256;
    }

    private __startTime: StoredU256 | null = null;
    private get _startTime(): StoredU256 {
        if (!this.__startTime) this.__startTime = new StoredU256(startTimePointer, EMPTY_POINTER);
        return this.__startTime as StoredU256;
    }

    private __treasury: StoredString | null = null;
    private get _treasury(): StoredString {
        if (!this.__treasury) this.__treasury = new StoredString(treasuryPointer, 0);
        return this.__treasury as StoredString;
    }

    private __wlMerkleRoot: StoredU256 | null = null;
    private get _wlMerkleRoot(): StoredU256 {
        if (!this.__wlMerkleRoot) this.__wlMerkleRoot = new StoredU256(wlMerkleRootPointer, EMPTY_POINTER);
        return this.__wlMerkleRoot as StoredU256;
    }

    // Eager AddressMemoryMaps

    private readonly _mintedWlMap:  AddressMemoryMap = new AddressMemoryMap(mintedWlPointer);
    private readonly _mintedPubMap: AddressMemoryMap = new AddressMemoryMap(mintedPubPointer);

    public constructor() {
        super();
    }

    // Deployment

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

    // tokenURI override (append /id.json to base)

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

    // mint(amount, proof) — proof is empty array for TEAM/PUBLIC phases

    @method(
        { name: 'amount', type: ABIDataTypes.UINT64 },
        { name: 'proof', type: ABIDataTypes.ARRAY_OF_UINT256 },
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

        // Read proof array (may be empty for non-WL phases)
        const proof = calldata.readU256Array();

        const phase = this._getPhase();
        const isDeployer = sender.equals(Blockchain.contractDeployer);

        // Deployer bypass: skip phase/cap checks, only supply is enforced
        if (!isDeployer) {
            // Phase + wallet cap checks for non-deployers
            if (phase === PHASE_NOT_STARTED) throw new Revert('DopamilioNFT: mint not started');

            if (phase === PHASE_TEAM) {
                throw new Revert('DopamilioNFT: team phase \u2014 not open yet');

            } else if (phase === PHASE_WL) {
                // Verify Merkle proof
                if (!this._verifyMerkleProof(sender, proof)) {
                    throw new Revert('DopamilioNFT: invalid WL proof');
                }
                const minted = this._mintedWlMap.get(sender).toU64();
                if (SafeMath.add64(minted, amount) > MAX_MINT_WL) {
                    throw new Revert('DopamilioNFT: WL cap exceeded');
                }

            } else {
                // PUBLIC
                const minted = this._mintedPubMap.get(sender).toU64();
                if (SafeMath.add64(minted, amount) > MAX_MINT_PUBLIC) {
                    throw new Revert('DopamilioNFT: max mint exceeded');
                }
            }
        }

        // Supply check
        const firstTokenId = this._nextTokenId.value;
        if (SafeMath.add(firstTokenId, u256.fromU64(amount)) > SafeMath.add(MAX_SUPPLY, u256.One)) {
            throw new Revert('DopamilioNFT: MAX_SUPPLY reached');
        }

        // Payment check — deployer bypass: skip payment (team allocation)
        if (!isDeployer) {
            if (!IS_TESTNET || Blockchain.tx.outputs.length > 0) {
                if (!IS_TESTNET && Blockchain.tx.outputs.length === 0) {
                    throw new Revert('DopamilioNFT: missing outputs');
                }
                const treasury = this._treasury.value;
                if (treasury.length === 0) throw new Revert('DopamilioNFT: treasury not set');
                const required: u64 = SafeMath.mul64(this._mintPrice.value.toU64(), amount);
                if (this._getPaymentToTreasury() < required) {
                    throw new Revert('DopamilioNFT: insufficient funds');
                }
            }
        }

        // Mint each token via OP721 base
        for (let i: u64 = 0; i < amount; i++) {
            const tokenId = SafeMath.add(firstTokenId, u256.fromU64(i));
            this._mint(sender, tokenId);
        }

        this._nextTokenId.value = SafeMath.add(firstTokenId, u256.fromU64(amount));

        // Update per-phase minted counters (deployer doesn't track, no phase cap)
        if (!isDeployer) {
            if (phase === PHASE_WL) {
                const prev = this._mintedWlMap.get(sender).toU64();
                this._mintedWlMap.set(sender, u256.fromU64(SafeMath.add64(prev, amount)));
            } else if (phase === PHASE_PUBLIC) {
                const prev = this._mintedPubMap.get(sender).toU64();
                this._mintedPubMap.set(sender, u256.fromU64(SafeMath.add64(prev, amount)));
            }
        }

        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(firstTokenId);
        return result;
    }

    // Admin: setWLRoot — store Merkle root for WL verification

    @method({ name: 'root', type: ABIDataTypes.UINT256 })
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public setWLRoot(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        const root = calldata.readU256();
        this._wlMerkleRoot.value = root;
        Blockchain.emit(new WLRootSetEvent(root));
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // Admin: startMint — activate the phase clock

    @method()
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public startMint(_calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        if (!this._startTime.value.isZero()) throw new Revert('DopamilioNFT: already started');
        const ts = u256.fromU64(Blockchain.block.medianTimestamp);
        this._startTime.value = ts;
        Blockchain.emit(new MintStartedEvent(ts));
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // Admin: setMintPrice

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

    // Admin: setTreasuryAddress

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

    // Views

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
    @returns({ name: 'root', type: ABIDataTypes.UINT256 })
    public getWLRoot(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._wlMerkleRoot.value);
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
        if (phase === 2)      count = this._mintedWlMap.get(addr);
        else if (phase === 3) count = this._mintedPubMap.get(addr);
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(count);
        return result;
    }

    // Internal: current phase

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

    // Internal: sum of BTC sent to treasury in tx outputs

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

    // Internal: verify Merkle proof for WL
    // Leaf = keccak256(keccak256(senderAddr_32bytes)) — double hash
    // Node = sorted-pair: if proof[i] <= current: keccak256(concat(proof[i], current))
    //                     else keccak256(concat(current, proof[i]))

    private _verifyMerkleProof(sender: Address, proof: u256[]): bool {
        const root = this._wlMerkleRoot.value;
        if (root.isZero()) return false;

        // Serialize sender address to 32 bytes
        const addrWriter = new BytesWriter(U256_BYTE_LENGTH);
        addrWriter.writeAddress(sender);
        const addrBytes = addrWriter.getBuffer();

        // Compute leaf = keccak256(keccak256(addrBytes))
        const innerHash = keccak256(addrBytes);
        const leafHash  = keccak256(innerHash);

        // Load leaf hash into u256 (big-endian from 32-byte hash)
        let current = u256.fromBytes(leafHash, true);

        // Walk the proof path
        for (let i: i32 = 0; i < proof.length; i++) {
            const proofNode = proof[i];
            let combined = new Uint8Array(64);

            if (u256.le(proofNode, current)) {
                // proof[i] <= current: keccak256(concat(proof[i], current))
                const nodeWriter = new BytesWriter(U256_BYTE_LENGTH);
                nodeWriter.writeU256(proofNode);
                const nodeBytes = nodeWriter.getBuffer();

                const currWriter = new BytesWriter(U256_BYTE_LENGTH);
                currWriter.writeU256(current);
                const currBytes = currWriter.getBuffer();

                combined.set(nodeBytes, 0);
                combined.set(currBytes, 32);
            } else {
                // current < proof[i]: keccak256(concat(current, proof[i]))
                const currWriter = new BytesWriter(U256_BYTE_LENGTH);
                currWriter.writeU256(current);
                const currBytes = currWriter.getBuffer();

                const nodeWriter = new BytesWriter(U256_BYTE_LENGTH);
                nodeWriter.writeU256(proofNode);
                const nodeBytes = nodeWriter.getBuffer();

                combined.set(currBytes, 0);
                combined.set(nodeBytes, 32);
            }

            const hashResult = keccak256(combined);
            current = u256.fromBytes(hashResult, true);
        }

        return u256.eq(current, root);
    }

}
