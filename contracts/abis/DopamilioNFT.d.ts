import { Address, AddressMap, ExtendedAddressMap, SchnorrSignature } from '@btc-vision/transaction';
import { CallResult, OPNetEvent, IOP_NETContract } from 'opnet';

// ------------------------------------------------------------------
// Event Definitions
// ------------------------------------------------------------------

// ------------------------------------------------------------------
// Call Results
// ------------------------------------------------------------------

/**
 * @description Represents the result of the tokenURI function call.
 */
export type TokenURI = CallResult<
    {
        uri: string;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the mint function call.
 */
export type Mint = CallResult<
    {
        firstTokenId: bigint;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the activateTeam function call.
 */
export type ActivateTeam = CallResult<
    {
        success: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the activateWL function call.
 */
export type ActivateWL = CallResult<
    {
        success: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the activatePublic function call.
 */
export type ActivatePublic = CallResult<
    {
        success: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the setMintPrice function call.
 */
export type SetMintPrice = CallResult<
    {
        success: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the setTreasuryAddress function call.
 */
export type SetTreasuryAddress = CallResult<
    {
        success: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getMintPrice function call.
 */
export type GetMintPrice = CallResult<
    {
        priceSats: bigint;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getPhase function call.
 */
export type GetPhase = CallResult<
    {
        phase: number;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getIsTestnet function call.
 */
export type GetIsTestnet = CallResult<
    {
        isTestnet: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getTreasuryAddress function call.
 */
export type GetTreasuryAddress = CallResult<
    {
        addr: string;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getTeamMintedTotal function call.
 */
export type GetTeamMintedTotal = CallResult<
    {
        total: bigint;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getMintedCount function call.
 */
export type GetMintedCount = CallResult<
    {
        count: bigint;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getWlStartTime function call.
 */
export type GetWlStartTime = CallResult<
    {
        startTime: bigint;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getWlDuration function call.
 */
export type GetWlDuration = CallResult<
    {
        durationSecs: bigint;
    },
    OPNetEvent<never>[]
>;

// ------------------------------------------------------------------
// IDopamilioNFT
// ------------------------------------------------------------------
export interface IDopamilioNFT extends IOP_NETContract {
    tokenURI(tokenId: bigint): Promise<TokenURI>;
    mint(amount: bigint): Promise<Mint>;
    activateTeam(): Promise<ActivateTeam>;
    activateWL(): Promise<ActivateWL>;
    activatePublic(): Promise<ActivatePublic>;
    setMintPrice(priceSats: bigint): Promise<SetMintPrice>;
    setTreasuryAddress(addr: string): Promise<SetTreasuryAddress>;
    getMintPrice(): Promise<GetMintPrice>;
    getPhase(): Promise<GetPhase>;
    getIsTestnet(): Promise<GetIsTestnet>;
    getTreasuryAddress(): Promise<GetTreasuryAddress>;
    getTeamMintedTotal(): Promise<GetTeamMintedTotal>;
    getMintedCount(addr: Address, phase: number): Promise<GetMintedCount>;
    getWlStartTime(): Promise<GetWlStartTime>;
    getWlDuration(): Promise<GetWlDuration>;
}
