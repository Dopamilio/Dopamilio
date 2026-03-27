/**
 * DopamilioNFT.ts  v8
 *
 * 3,333 unique degenerates etched on Bitcoin.
 * OP-721 NFT collection on OPNet — extends OP721 base (btc-runtime 1.11.0).
 *
 * tokenURI: baseURI + '/' + tokenId + '.json'  (tokenIds are 1-based: 1 → 3333)
 *
 * Phases: deployer calls activateTeam() → activateWL() → activatePublic()
 * WL and PUBLIC are both open to anyone — no address gating.
 *
 * Changes v8 vs v7:
 *   - NEW:  activateWL() now stores Blockchain.block.medianTimestamp in slot 23 (wlStartTime)
 *   - NEW:  getWlStartTime() view — returns wlStartTime (u64); 0 = WL not yet activated
 *   - NEW:  getWlDuration() view  — returns WL_DURATION_SECS (5400 = 1.5 hours)
 *   - FIX:  setTreasuryAddress() accepts both 'opt1' (testnet) and 'bc1p' (mainnet) prefixes
 *
 * All audit fixes from v7 are preserved:
 *   - CRITICAL: CEI — counters updated BEFORE _mint() loop (reentrancy fix)
 *   - HIGH:     mint() uses zero-guard for price, consistent with getMintPrice()
 *   - MEDIUM:   _getPhase() validates bounds before u64→u8 cast
 *   - LOW:      setTreasuryAddress validates recognized prefixes and min length
 *
 * Custom storage pointers — allocated AFTER 16 base pointers
 * (14 OP721 internal + 2 ReentrancyGuard). Absolute slots 17–23.
 * Order is FIXED — never insert, only append:
 *   17  mintPrice         StoredU256   (lazy)
 *   18  currentPhase      StoredU256   (lazy)
 *   19  treasury          StoredString (lazy)
 *   20  mintedWlMap       AddressMemoryMap (eager)
 *   21  mintedPubMap      AddressMemoryMap (eager)
 *   22  teamMintedTotal   StoredU256   (lazy)
 *   23  wlStartTime       StoredU256   (lazy) — medianTimestamp of activateWL tx block
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

// ── Compile-time config ──────────────────────────────────────────────────────

const IS_TESTNET: bool = false;

// ── Collection constants ─────────────────────────────────────────────────────

const BASE_URI:    string = 'https://dopamilio.xyz/api/metadata';
const ICON_URL:    string = 'https://dopamilio.xyz/icon.png';
const BANNER_URL:  string = 'https://dopamilio.xyz/banner.png';
const WEBSITE_URL: string = 'https://dopamilio.xyz';
const DESCRIPTION: string = '3,333 unique degenerates etched on Bitcoin. 100% on-chain. Pure dopamine.';
const TREASURY:    string = 'opt1pv5z0n6gn0n8szljp7dewl52548zyvt48pt406cl607wen22amalqfpft8p';

// ── Mint constants ────────────────────────────────────────────────────────────

const DEFAULT_MINT_PRICE: u64 = 6969;
const MAX_SUPPLY:         u256 = u256.fromU64(3333);
const MAX_MINT_TEAM:      u64  = 10;
const MAX_MINT_WL:        u64  = 5;
const MAX_MINT_PUBLIC:    u64  = 3;

// ── WL timing ─────────────────────────────────────────────────────────────────

const WL_DURATION_SECS: u64 = 5400; // 1.5 hours

// ── Phase IDs ─────────────────────────────────────────────────────────────────

const PHASE_NOT_STARTED: u8 = 0;
const PHASE_TEAM:        u8 = 1;
const PHASE_WL:          u8 = 2;
const PHASE_PUBLIC:      u8 = 3;

// ── Custom storage pointers (AFTER OP721 base's 16 internal pointers) ─────────

const mintPricePointer:       u16 = Blockchain.nextPointer;  // slot 17
const currentPhasePointer:    u16 = Blockchain.nextPointer;  // slot 18
const treasuryPointer:        u16 = Blockchain.nextPointer;  // slot 19
const mintedWlPointer:        u16 = Blockchain.nextPointer;  // slot 20
const mintedPubPointer:       u16 = Blockchain.nextPointer;  // slot 21
const teamMintedTotalPointer: u16 = Blockchain.nextPointer;  // slot 22
const wlStartTimePointer:     u16 = Blockchain.nextPointer;  // slot 23

// ── Events ────────────────────────────────────────────────────────────────────

@final
class PhaseActivatedEvent extends NetEvent {
    constructor(phase: u8) {
        const data = new BytesWriter(U8_BYTE_LENGTH);
        data.writeU8(phase);
        super('PhaseActivated', data);
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

// ── DopamilioNFT ─────────────────────────────────────────────────────────────

@final
export class DopamilioNFT extends OP721 {

    // ── Lazy getters for custom StoredU256 / StoredString ─────────────────────

    private __mintPrice: StoredU256 | null = null;
    private get _mintPrice(): StoredU256 {
        if (!this.__mintPrice) this.__mintPrice = new StoredU256(mintPricePointer, EMPTY_POINTER);
        return this.__mintPrice!;
    }

    private __currentPhase: StoredU256 | null = null;
    private get _currentPhase(): StoredU256 {
        if (!this.__currentPhase) this.__currentPhase = new StoredU256(currentPhasePointer, EMPTY_POINTER);
        return this.__currentPhase!;
    }

    private __treasury: StoredString | null = null;
    private get _treasury(): StoredString {
        if (!this.__treasury) this.__treasury = new StoredString(treasuryPointer, 0);
        return this.__treasury!;
    }

    private __teamMintedTotal: StoredU256 | null = null;
    private get _teamMintedTotal(): StoredU256 {
        if (!this.__teamMintedTotal) this.__teamMintedTotal = new StoredU256(teamMintedTotalPointer, EMPTY_POINTER);
        return this.__teamMintedTotal!;
    }

    private __wlStartTime: StoredU256 | null = null;
    private get _wlStartTime(): StoredU256 {
        if (!this.__wlStartTime) this.__wlStartTime = new StoredU256(wlStartTimePointer, EMPTY_POINTER);
        return this.__wlStartTime!;
    }

    // ── Eager AddressMemoryMaps ───────────────────────────────────────────────

    private readonly _mintedWlMap:  AddressMemoryMap = new AddressMemoryMap(mintedWlPointer);
    private readonly _mintedPubMap: AddressMemoryMap = new AddressMemoryMap(mintedPubPointer);

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
        // _nextTokenId initialized to u256.One by OP721.instantiate() — tokens start at #1
    }

    public onUpdate(_calldata: Calldata): void {}

    // ── tokenURI override ─────────────────────────────────────────────────────

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

    // ── mint(amount) ──────────────────────────────────────────────────────────

    @method(
        { name: 'amount', type: ABIDataTypes.UINT64 },
    )
    @returns({ name: 'firstTokenId', type: ABIDataTypes.UINT256 })
    public mint(calldata: Calldata): BytesWriter {
        const sender = Blockchain.tx.sender;
        const origin = Blockchain.tx.origin;

        if (!sender.equals(origin)) {
            throw new Revert('DopamilioNFT: direct calls only');
        }

        const amount = calldata.readU64();
        if (amount === 0) throw new Revert('DopamilioNFT: amount must be > 0');
        if (amount > 10)  throw new Revert('DopamilioNFT: max 10 per tx');

        const phase = this._getPhase();

        // ── Checks ────────────────────────────────────────────────────────────
        if (phase === PHASE_NOT_STARTED) throw new Revert('DopamilioNFT: mint not started');

        let prevTeam: u64 = 0;
        let prevWl:   u64 = 0;
        let prevPub:  u64 = 0;

        if (phase === PHASE_TEAM) {
            if (!Blockchain.contractDeployer.equals(sender)) {
                throw new Revert('DopamilioNFT: team phase — deployer only');
            }
            prevTeam = this._teamMintedTotal.value.toU64();
            if (SafeMath.add64(prevTeam, amount) > MAX_MINT_TEAM) {
                throw new Revert('DopamilioNFT: team cap exceeded (max 10 total)');
            }
        } else if (phase === PHASE_WL) {
            prevWl = this._mintedWlMap.get(sender).toU64();
            if (SafeMath.add64(prevWl, amount) > MAX_MINT_WL)
                throw new Revert('DopamilioNFT: WL cap exceeded (max 5 per wallet)');
        } else {
            prevPub = this._mintedPubMap.get(sender).toU64();
            if (SafeMath.add64(prevPub, amount) > MAX_MINT_PUBLIC)
                throw new Revert('DopamilioNFT: public cap exceeded (max 3 per wallet)');
        }

        // ── Supply check ──────────────────────────────────────────────────────
        const firstTokenId = this._nextTokenId.value;
        if (SafeMath.add(firstTokenId, u256.fromU64(amount)) > SafeMath.add(MAX_SUPPLY, u256.One)) {
            throw new Revert('DopamilioNFT: supply exhausted');
        }

        // ── Payment check (HIGH fix: use zero-guard for price) ────────────────
        const priceVal  = this._mintPrice.value;
        const unitPrice: u64 = priceVal.isZero() ? DEFAULT_MINT_PRICE : priceVal.toU64();
        const required: u64  = SafeMath.mul64(unitPrice, amount);
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

        // ── Effects BEFORE interactions (CRITICAL CEI fix) ────────────────────
        this._nextTokenId.value = SafeMath.add(firstTokenId, u256.fromU64(amount));

        if (phase === PHASE_TEAM) {
            this._teamMintedTotal.value = u256.fromU64(SafeMath.add64(prevTeam, amount));
        } else if (phase === PHASE_WL) {
            this._mintedWlMap.set(sender, u256.fromU64(SafeMath.add64(prevWl, amount)));
        } else {
            this._mintedPubMap.set(sender, u256.fromU64(SafeMath.add64(prevPub, amount)));
        }

        // ── Interactions: mint each token via OP721 base ──────────────────────
        for (let i: u64 = 0; i < amount; i++) {
            const tokenId = SafeMath.add(firstTokenId, u256.fromU64(i));
            this._mint(sender, tokenId);
        }

        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(firstTokenId);
        return result;
    }

    // ── Admin: activateTeam ───────────────────────────────────────────────────

    @method()
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public activateTeam(_calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        if (this._currentPhase.value.toU64() !== 0) throw new Revert('DopamilioNFT: phase already started');
        this._currentPhase.value = u256.fromU64(1);
        Blockchain.emit(new PhaseActivatedEvent(PHASE_TEAM));
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // ── Admin: activateWL ─────────────────────────────────────────────────────

    @method()
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public activateWL(_calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        if (this._currentPhase.value.toU64() !== 1) throw new Revert('DopamilioNFT: must be in TEAM phase');
        this._currentPhase.value = u256.fromU64(2);
        // Store block medianTimestamp so frontend can display real-time 1.5h countdown
        this._wlStartTime.value = u256.fromU64(Blockchain.block.medianTimestamp);
        Blockchain.emit(new PhaseActivatedEvent(PHASE_WL));
        const result = new BytesWriter(1);
        result.writeBoolean(true);
        return result;
    }

    // ── Admin: activatePublic ─────────────────────────────────────────────────

    @method()
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public activatePublic(_calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        if (this._currentPhase.value.toU64() !== 2) throw new Revert('DopamilioNFT: must be in WL phase');
        this._currentPhase.value = u256.fromU64(3);
        Blockchain.emit(new PhaseActivatedEvent(PHASE_PUBLIC));
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

    // ── Admin: setTreasuryAddress (accepts opt1 testnet OR bc1p mainnet) ───────

    @method({ name: 'addr', type: ABIDataTypes.STRING })
    @returns({ name: 'success', type: ABIDataTypes.BOOL })
    public setTreasuryAddress(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);
        const addr = calldata.readStringWithLength();
        if (addr.length < 10) throw new Revert('DopamilioNFT: address too short');
        if (!addr.startsWith('opt1') && !addr.startsWith('bc1p')) {
            throw new Revert('DopamilioNFT: address must start with opt1 or bc1p');
        }
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
    @returns({ name: 'total', type: ABIDataTypes.UINT256 })
    public getTeamMintedTotal(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._teamMintedTotal.value);
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

    @view
    @returns({ name: 'startTime', type: ABIDataTypes.UINT64 })
    public getWlStartTime(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U64_BYTE_LENGTH);
        result.writeU64(this._wlStartTime.value.toU64());
        return result;
    }

    @view
    @returns({ name: 'durationSecs', type: ABIDataTypes.UINT64 })
    public getWlDuration(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U64_BYTE_LENGTH);
        result.writeU64(WL_DURATION_SECS);
        return result;
    }

    // ── Internal: current phase (MEDIUM fix: bounds check before cast) ─────────

    private _getPhase(): u8 {
        const v = this._currentPhase.value.toU64();
        if (v > 3) throw new Revert('DopamilioNFT: invalid phase state');
        return v as u8;
    }

    // ── Internal: payment to treasury ────────────────────────────────────────

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
}
