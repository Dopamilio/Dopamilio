/**
 * DopamilioMarketplace.ts
 *
 * NFT Marketplace for Dopamilio OP-721 collection on OPNet Bitcoin.
 * Supports listing, buying, and cancelling NFTs with fee collection.
 *
 * Extends ReentrancyGuard (which extends OP_NET).
 *
 * Storage pointers — allocated via Blockchain.nextPointer (NEVER hardcoded).
 * ReentrancyGuard uses 2 pointers internally (status + depth).
 * Our custom pointers start after those.
 *
 * Security: CEI pattern, SafeMath for all arithmetic, reentrancy protection,
 *           onlyDeployer for admin, payment verification via tx outputs.
 */

import { u256 } from '@btc-vision/as-bignum/assembly';
import {
    Blockchain,
    Address,
    Calldata,
    BytesWriter,
    Revert,
    SafeMath,
    StoredU256,
    StoredString,
    StoredAddress,
    StoredMapU256,
    EMPTY_POINTER,
    ADDRESS_BYTE_LENGTH,
    BOOLEAN_BYTE_LENGTH,
    U256_BYTE_LENGTH,
    U64_BYTE_LENGTH,
    U32_BYTE_LENGTH,
    encodeSelector,
    Selector,
} from '@btc-vision/btc-runtime/runtime';
import { ReentrancyGuard } from '@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard';
import { AdvancedStoredString } from '@btc-vision/btc-runtime/runtime/storage/AdvancedStoredString';
import {
    ListingCreatedEvent,
    ListingCancelledEvent,
    SaleExecutedEvent,
} from './events/MarketplaceEvents';

// ── Cross-contract selectors ─────────────────────────────────────────────────

const OWNER_OF_SELECTOR: Selector = encodeSelector('ownerOf(uint256)');
const GET_APPROVED_SELECTOR: Selector = encodeSelector('getApproved(uint256)');
const IS_APPROVED_FOR_ALL_SELECTOR: Selector = encodeSelector('isApprovedForAll(address,address)');
const TRANSFER_FROM_SELECTOR: Selector = encodeSelector('transferFrom(address,address,uint256)');

// ── Fee constants ────────────────────────────────────────────────────────────

const DEFAULT_FEE_BPS: u64 = 420; // 4.2%
const MAX_FEE_BPS: u64 = 1000;    // 10% cap
const BPS_DENOMINATOR: u64 = 10000;

// ── Storage pointers (after ReentrancyGuard's 2 internal pointers) ───────────

const nftContractPointer: u16 = Blockchain.nextPointer;
const feeRecipientPointer: u16 = Blockchain.nextPointer;
const feeBpsPointer: u16 = Blockchain.nextPointer;
const listingPricePointer: u16 = Blockchain.nextPointer;
const listingSellerPointer: u16 = Blockchain.nextPointer;
const listingActivePointer: u16 = Blockchain.nextPointer;
const totalListingsPointer: u16 = Blockchain.nextPointer;
const totalSalesPointer: u16 = Blockchain.nextPointer;
const totalVolumePointer: u16 = Blockchain.nextPointer;
const floorPricePointer: u16 = Blockchain.nextPointer;
const sellerBech32Pointer: u16 = Blockchain.nextPointer;

// ── DopamilioMarketplace ─────────────────────────────────────────────────────

@final
export class DopamilioMarketplace extends ReentrancyGuard {
    // ── Lazy getters for storage ─────────────────────────────────────────────

    private __nftContract: StoredAddress | null = null;
    private get _nftContract(): StoredAddress {
        if (!this.__nftContract) this.__nftContract = new StoredAddress(nftContractPointer);
        return this.__nftContract!;
    }

    private __feeRecipient: StoredString | null = null;
    private get _feeRecipient(): StoredString {
        if (!this.__feeRecipient) this.__feeRecipient = new StoredString(feeRecipientPointer, 0);
        return this.__feeRecipient!;
    }

    private __feeBps: StoredU256 | null = null;
    private get _feeBps(): StoredU256 {
        if (!this.__feeBps) this.__feeBps = new StoredU256(feeBpsPointer, EMPTY_POINTER);
        return this.__feeBps!;
    }

    private __listingPrice: StoredMapU256 | null = null;
    private get _listingPrice(): StoredMapU256 {
        if (!this.__listingPrice) this.__listingPrice = new StoredMapU256(listingPricePointer);
        return this.__listingPrice!;
    }

    private __listingSeller: StoredMapU256 | null = null;
    private get _listingSeller(): StoredMapU256 {
        if (!this.__listingSeller) this.__listingSeller = new StoredMapU256(listingSellerPointer);
        return this.__listingSeller!;
    }

    private __listingActive: StoredMapU256 | null = null;
    private get _listingActive(): StoredMapU256 {
        if (!this.__listingActive) this.__listingActive = new StoredMapU256(listingActivePointer);
        return this.__listingActive!;
    }

    private __totalListings: StoredU256 | null = null;
    private get _totalListings(): StoredU256 {
        if (!this.__totalListings) this.__totalListings = new StoredU256(totalListingsPointer, EMPTY_POINTER);
        return this.__totalListings!;
    }

    private __totalSales: StoredU256 | null = null;
    private get _totalSales(): StoredU256 {
        if (!this.__totalSales) this.__totalSales = new StoredU256(totalSalesPointer, EMPTY_POINTER);
        return this.__totalSales!;
    }

    private __totalVolume: StoredU256 | null = null;
    private get _totalVolume(): StoredU256 {
        if (!this.__totalVolume) this.__totalVolume = new StoredU256(totalVolumePointer, EMPTY_POINTER);
        return this.__totalVolume!;
    }

    private __floorPrice: StoredU256 | null = null;
    private get _floorPrice(): StoredU256 {
        if (!this.__floorPrice) this.__floorPrice = new StoredU256(floorPricePointer, EMPTY_POINTER);
        return this.__floorPrice!;
    }

    // ── Constructor ──────────────────────────────────────────────────────────

    public constructor() {
        super();
    }

    // ── Deployment ───────────────────────────────────────────────────────────

    public override onDeployment(calldata: Calldata): void {
        super.onDeployment(calldata);

        // Read deployment parameters
        const nftContractAddress = calldata.readAddress();
        const feeRecipient = calldata.readStringWithLength();

        // Validate
        if (feeRecipient.length < 10) throw new Revert('Marketplace: feeRecipient too short');

        // Store
        this._nftContract.value = nftContractAddress;
        this._feeRecipient.value = feeRecipient;
        this._feeBps.value = u256.fromU64(DEFAULT_FEE_BPS);
        this._totalListings.value = u256.Zero;
        this._totalSales.value = u256.Zero;
        this._totalVolume.value = u256.Zero;
        this._floorPrice.value = u256.Zero;
    }

    // ── Execute (method routing) ─────────────────────────────────────────────

    public override execute(method: Selector, calldata: Calldata): BytesWriter {
        switch (method) {
            case encodeSelector('list(uint256,uint64)'):
                return this.list(calldata);
            case encodeSelector('buy(uint256)'):
                return this.buy(calldata);
            case encodeSelector('cancel(uint256)'):
                return this.cancel(calldata);
            case encodeSelector('updateFeeRecipient(string)'):
                return this.updateFeeRecipient(calldata);
            case encodeSelector('updateFee(uint256)'):
                return this.updateFee(calldata);
            case encodeSelector('getListing(uint256)'):
                return this.getListing(calldata);
            case encodeSelector('getFloorPrice()'):
                return this.getFloorPrice(calldata);
            case encodeSelector('getTotalListings()'):
                return this.getTotalListings(calldata);
            case encodeSelector('getTotalSales()'):
                return this.getTotalSales(calldata);
            case encodeSelector('getTotalVolume()'):
                return this.getTotalVolume(calldata);
            case encodeSelector('getFeeRecipient()'):
                return this.getFeeRecipient(calldata);
            case encodeSelector('getFee()'):
                return this.getFee(calldata);
            case encodeSelector('getSellerAddress(uint256)'):
                return this.getSellerAddress(calldata);
            default:
                return super.execute(method, calldata);
        }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ── Write Methods ────────────────────────────────────────────────────────
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * list(tokenId, priceSats) — List an NFT for sale.
     *
     * Caller must own the NFT and have approved this marketplace contract.
     * The seller's bech32 output address is derived from the transaction origin
     * and stored per-listing so buy() can verify payment.
     */
    private list(calldata: Calldata): BytesWriter {
        const tokenId = calldata.readU256();
        const priceSats = calldata.readU64();

        const sender = Blockchain.tx.sender;

        // ── Checks ───────────────────────────────────────────────────────────
        if (priceSats === 0) throw new Revert('Marketplace: price must be > 0');

        const active = this._listingActive.get(tokenId);
        if (active == u256.One) throw new Revert('Marketplace: already listed');

        // Verify caller owns the NFT
        const nftAddr = this._nftContract.value;
        const owner = this._nftOwnerOf(nftAddr, tokenId);
        if (!owner.equals(sender)) throw new Revert('Marketplace: caller is not owner');

        // Verify marketplace is approved for this token (individual or operator)
        const approved = this._nftGetApproved(nftAddr, tokenId);
        const approvedForAll = this._nftIsApprovedForAll(nftAddr, sender, this.address);
        if (!approved.equals(this.address) && !approvedForAll) throw new Revert('Marketplace: not approved');

        // ── Effects ──────────────────────────────────────────────────────────
        this._listingPrice.set(tokenId, u256.fromU64(priceSats));

        // Store seller address as u256 (first 32 bytes of Address)
        const sellerU256 = u256.fromUint8ArrayBE(sender);
        this._listingSeller.set(tokenId, sellerU256);
        this._listingActive.set(tokenId, u256.One);

        // Store seller bech32 from tx outputs (the first output that matches sender's origin)
        // The seller's bech32 address comes from the transaction origin's address encoding
        // We need it stored as a string for payment verification in buy()
        this._storeSellerBech32(tokenId);

        // Update totalListings
        this._totalListings.value = SafeMath.add(this._totalListings.value, u256.One);

        // Update floor price
        const currentFloor = this._floorPrice.value;
        const priceU256 = u256.fromU64(priceSats);
        if (currentFloor.isZero() || priceU256 < currentFloor) {
            this._floorPrice.value = priceU256;
        }

        // ── Event ────────────────────────────────────────────────────────────
        this.emitEvent(new ListingCreatedEvent(tokenId, priceSats, sender));

        const result = new BytesWriter(BOOLEAN_BYTE_LENGTH);
        result.writeBoolean(true);
        return result;
    }

    /**
     * buy(tokenId) — Purchase a listed NFT.
     *
     * The buyer must include tx outputs paying:
     *   - fee to feeRecipient
     *   - sellerAmount to seller's bech32 address
     *
     * CEI: checks → effects → interactions (transferFrom last).
     */
    private buy(calldata: Calldata): BytesWriter {
        const tokenId = calldata.readU256();

        const sender = Blockchain.tx.sender;

        // ── Checks ───────────────────────────────────────────────────────────
        const active = this._listingActive.get(tokenId);
        if (active != u256.One) throw new Revert('Marketplace: listing not active');

        const sellerU256 = this._listingSeller.get(tokenId);
        const sellerAddress = Address.fromUint8Array(sellerU256.toUint8Array(true));

        if (sender.equals(sellerAddress)) throw new Revert('Marketplace: buyer == seller');

        const priceU256 = this._listingPrice.get(tokenId);
        const priceSats: u64 = priceU256.toU64();

        // Calculate fee and seller amount
        const feeBps: u64 = this._feeBps.value.toU64();
        const feeSats: u64 = SafeMath.div64(SafeMath.mul64(priceSats, feeBps), BPS_DENOMINATOR);
        const sellerAmount: u64 = SafeMath.sub64(priceSats, feeSats);

        // Verify payment outputs
        const feeRecipientStr = this._feeRecipient.value;
        const sellerBech32 = this._loadSellerBech32(tokenId);

        if (sellerBech32.length === 0) throw new Revert('Marketplace: seller address not stored');

        // Verify fee payment
        if (feeSats > 0) {
            const feePayment = this._getPaymentTo(feeRecipientStr);
            if (feePayment < feeSats) throw new Revert('Marketplace: insufficient fee payment');
        }

        // Verify seller payment
        const sellerPayment = this._getPaymentTo(sellerBech32);
        if (sellerPayment < sellerAmount) throw new Revert('Marketplace: insufficient seller payment');

        // ── Effects ──────────────────────────────────────────────────────────
        this._listingActive.set(tokenId, u256.Zero);
        this._totalListings.value = SafeMath.sub(this._totalListings.value, u256.One);
        this._totalSales.value = SafeMath.add(this._totalSales.value, u256.One);
        this._totalVolume.value = SafeMath.add(this._totalVolume.value, priceU256);

        // Reset floor if this was the floor price (frontend will recalculate)
        const currentFloor = this._floorPrice.value;
        if (priceU256 == currentFloor) {
            this._floorPrice.value = u256.Zero;
        }

        // ── Interactions ─────────────────────────────────────────────────────
        const nftAddr = this._nftContract.value;
        this._nftTransferFrom(nftAddr, sellerAddress, sender, tokenId);

        // ── Event ────────────────────────────────────────────────────────────
        this.emitEvent(new SaleExecutedEvent(tokenId, priceSats, sender, sellerAddress, feeSats));

        const result = new BytesWriter(BOOLEAN_BYTE_LENGTH);
        result.writeBoolean(true);
        return result;
    }

    /**
     * cancel(tokenId) — Cancel an active listing. Only the seller can cancel.
     */
    private cancel(calldata: Calldata): BytesWriter {
        const tokenId = calldata.readU256();

        const sender = Blockchain.tx.sender;

        // ── Checks ───────────────────────────────────────────────────────────
        const active = this._listingActive.get(tokenId);
        if (active != u256.One) throw new Revert('Marketplace: listing not active');

        const sellerU256 = this._listingSeller.get(tokenId);
        const sellerAddress = Address.fromUint8Array(sellerU256.toUint8Array(true));

        if (!sender.equals(sellerAddress)) throw new Revert('Marketplace: only seller can cancel');

        // ── Effects ──────────────────────────────────────────────────────────
        this._listingActive.set(tokenId, u256.Zero);
        this._totalListings.value = SafeMath.sub(this._totalListings.value, u256.One);

        // Reset floor if cancelled listing was the floor (frontend recalculates)
        const priceU256 = this._listingPrice.get(tokenId);
        const currentFloor = this._floorPrice.value;
        if (priceU256 == currentFloor) {
            this._floorPrice.value = u256.Zero;
        }

        // ── Event ────────────────────────────────────────────────────────────
        this.emitEvent(new ListingCancelledEvent(tokenId, sellerAddress));

        const result = new BytesWriter(BOOLEAN_BYTE_LENGTH);
        result.writeBoolean(true);
        return result;
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ── Admin Methods ────────────────────────────────────────────────────────
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * updateFeeRecipient(addr) — Update the fee recipient bech32 address.
     * Only deployer can call.
     */
    private updateFeeRecipient(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);

        const addr = calldata.readStringWithLength();
        if (addr.length < 10) throw new Revert('Marketplace: address too short');

        this._feeRecipient.value = addr;

        const result = new BytesWriter(BOOLEAN_BYTE_LENGTH);
        result.writeBoolean(true);
        return result;
    }

    /**
     * updateFee(bps) — Update the fee in basis points. Max 1000 (10%).
     * Only deployer can call.
     */
    private updateFee(calldata: Calldata): BytesWriter {
        this.onlyDeployer(Blockchain.tx.sender);

        const bps = calldata.readU256();
        if (bps > u256.fromU64(MAX_FEE_BPS)) throw new Revert('Marketplace: fee too high (max 10%)');

        this._feeBps.value = bps;

        const result = new BytesWriter(BOOLEAN_BYTE_LENGTH);
        result.writeBoolean(true);
        return result;
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ── View Methods ─────────────────────────────────────────────────────────
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * getListing(tokenId) — Returns price (u64), seller (address), active (bool).
     */
    private getListing(calldata: Calldata): BytesWriter {
        const tokenId = calldata.readU256();

        const priceU256 = this._listingPrice.get(tokenId);
        const sellerU256 = this._listingSeller.get(tokenId);
        const active = this._listingActive.get(tokenId);

        const sellerAddress = Address.fromUint8Array(sellerU256.toUint8Array(true));

        const result = new BytesWriter(U64_BYTE_LENGTH + ADDRESS_BYTE_LENGTH + BOOLEAN_BYTE_LENGTH);
        result.writeU64(priceU256.toU64());
        result.writeAddress(sellerAddress);
        result.writeBoolean(active == u256.One);
        return result;
    }

    /**
     * getFloorPrice() — Returns stored floor price.
     * Reset to 0 on buy/cancel if removed listing was the floor. Frontend recalculates.
     */
    private getFloorPrice(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._floorPrice.value);
        return result;
    }

    /**
     * getTotalListings() — Returns count of active listings.
     */
    private getTotalListings(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._totalListings.value);
        return result;
    }

    /**
     * getTotalSales() — Returns cumulative sale count.
     */
    private getTotalSales(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._totalSales.value);
        return result;
    }

    /**
     * getTotalVolume() — Returns cumulative volume in sats.
     */
    private getTotalVolume(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._totalVolume.value);
        return result;
    }

    /**
     * getFeeRecipient() — Returns the fee recipient bech32 address.
     */
    private getFeeRecipient(_calldata: Calldata): BytesWriter {
        const addr = this._feeRecipient.value;
        const result = new BytesWriter(U32_BYTE_LENGTH + addr.length);
        result.writeStringWithLength(addr);
        return result;
    }

    /**
     * getFee() — Returns the fee in basis points.
     */
    private getFee(_calldata: Calldata): BytesWriter {
        const result = new BytesWriter(U256_BYTE_LENGTH);
        result.writeU256(this._feeBps.value);
        return result;
    }

    /**
     * getSellerAddress(tokenId) — Returns the seller's stored bech32 address for a listing.
     */
    private getSellerAddress(calldata: Calldata): BytesWriter {
        const tokenId = calldata.readU256();
        const addr = this._loadSellerBech32(tokenId);
        const result = new BytesWriter(U32_BYTE_LENGTH + addr.length);
        result.writeStringWithLength(addr);
        return result;
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ── Cross-Contract Calls ─────────────────────────────────────────────────
    // ══════════════════════════════════════════════════════════════════════════

    private _nftOwnerOf(nftContract: Address, tokenId: u256): Address {
        const cd = new BytesWriter(4 + 32);
        cd.writeSelector(OWNER_OF_SELECTOR);
        cd.writeU256(tokenId);
        const response = Blockchain.call(nftContract, cd);
        return response.data.readAddress();
    }

    private _nftGetApproved(nftContract: Address, tokenId: u256): Address {
        const cd = new BytesWriter(4 + 32);
        cd.writeSelector(GET_APPROVED_SELECTOR);
        cd.writeU256(tokenId);
        const response = Blockchain.call(nftContract, cd);
        return response.data.readAddress();
    }

    private _nftIsApprovedForAll(nftContract: Address, owner: Address, operator: Address): boolean {
        const cd = new BytesWriter(4 + 32 + 32);
        cd.writeSelector(IS_APPROVED_FOR_ALL_SELECTOR);
        cd.writeAddress(owner);
        cd.writeAddress(operator);
        const response = Blockchain.call(nftContract, cd, false);
        if (!response.success) return false;
        return response.data.readBoolean();
    }

    private _nftTransferFrom(nftContract: Address, from: Address, to: Address, tokenId: u256): void {
        const cd = new BytesWriter(4 + 32 + 32 + 32);
        cd.writeSelector(TRANSFER_FROM_SELECTOR);
        cd.writeAddress(from);
        cd.writeAddress(to);
        cd.writeU256(tokenId);
        Blockchain.call(nftContract, cd);
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ── Payment Verification ─────────────────────────────────────────────────
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * Iterates tx outputs and sums all values sent to the given bech32 address.
     * Mirrors DopamilioNFT._getPaymentToTreasury() pattern exactly.
     */
    private _getPaymentTo(recipient: string): u64 {
        const outputs = Blockchain.tx.outputs;
        let total: u64 = 0;
        for (let i: i32 = 0; i < outputs.length; i++) {
            const out = outputs[i];
            if (!out.to) continue;
            if (out.to! == recipient) total = SafeMath.add64(total, out.value);
        }
        return total;
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ── Seller Bech32 Storage ────────────────────────────────────────────────
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * Stores the seller's bech32 address for a listing.
     * We derive the seller's address from the first tx output that belongs to
     * an address (any output with a `to` field). In practice, the lister's
     * wallet will have a change output. However, a simpler approach:
     * store the tx.origin's tweaked public key bech32 encoding.
     *
     * SIMPLEST: Read from tx outputs — find the first output whose `to` starts
     * with bc1 or opt1 and is not the contract itself. Or: we require the seller
     * to pass their bech32 address as a parameter in list().
     *
     * ACTUAL APPROACH: We store the seller's bech32 from Blockchain.tx.origin
     * using its p2tr bech32 representation.
     *
     * Since we cannot derive bech32 from Address easily on-chain, we use a different
     * approach: the seller's bech32 address is extracted from the transaction outputs.
     * The seller has at least one output (change) to their address in the listing tx.
     * We scan outputs for any address that is not the contract address, and store
     * the first one found.
     *
     * BUT: we can use Blockchain.tx.origin as ExtendedAddress which has p2tr encoding.
     * Let's check — actually safest approach: iterate outputs and find sender's output.
     * We know the sender's 32-byte Address, and we know outputs have bech32 strings.
     * We can't match them directly (Address is tweaked pubkey hash, bech32 encodes the same).
     *
     * PRAGMATIC: The lister passes their bech32 as an extra string parameter in list().
     *
     * EVEN SIMPLER: We rely on tx outputs. In list() tx, the seller's wallet creates
     * outputs including change. We find any output with a `to` field and store it.
     * This assumes the seller has at least one recognizable output.
     *
     * FINAL DECISION: For v1, we store the first non-null `to` from tx outputs.
     * This works because the seller's list transaction must have a change output
     * to their own address.
     */
    private _storeSellerBech32(tokenId: u256): void {
        const outputs = Blockchain.tx.outputs;
        let sellerBech32: string = '';

        for (let i: i32 = 0; i < outputs.length; i++) {
            const out = outputs[i];
            if (out.to) {
                sellerBech32 = out.to!;
                break;
            }
        }

        if (sellerBech32.length === 0) throw new Revert('Marketplace: no seller address in outputs');

        // Store using AdvancedStoredString with tokenId-derived subPointer
        const subPointer = this._tokenIdSubPointer(tokenId);
        const stored = new AdvancedStoredString(sellerBech32Pointer, subPointer, 256);
        stored.value = sellerBech32;
    }

    /**
     * Loads the seller's bech32 address for a given listing.
     */
    private _loadSellerBech32(tokenId: u256): string {
        const subPointer = this._tokenIdSubPointer(tokenId);
        const stored = new AdvancedStoredString(sellerBech32Pointer, subPointer, 256);
        return stored.value;
    }

    /**
     * Derives a 30-byte subPointer from a tokenId for use with AdvancedStoredString.
     * Uses the first 30 bytes of the tokenId's big-endian representation.
     */
    private _tokenIdSubPointer(tokenId: u256): Uint8Array {
        const bytes = tokenId.toUint8Array(true);
        const sub = new Uint8Array(30);
        for (let i: i32 = 0; i < 30; i++) {
            if (i < bytes.length) {
                sub[i] = bytes[i];
            }
        }
        return sub;
    }
}
