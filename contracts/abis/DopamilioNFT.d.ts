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
 * @description Represents the result of the startMint function call.
 */
export type StartMint = CallResult<
    {
        success: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the setWLRoot function call.
 */
export type SetWLRoot = CallResult<
    {
        success: boolean;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the addToTeamList function call.
 */
export type AddToTeamList = CallResult<
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
 * @description Represents the result of the getStartTime function call.
 */
export type GetStartTime = CallResult<
    {
        startTime: bigint;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getTeamDuration function call.
 */
export type GetTeamDuration = CallResult<
    {
        teamDuration: bigint;
    },
    OPNetEvent<never>[]
>;

/**
 * @description Represents the result of the getWlDuration function call.
 */
export type GetWlDuration = CallResult<
    {
        wlDuration: bigint;
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
 * @description Represents the result of the getWLRoot function call.
 */
export type GetWLRoot = CallResult<
    {
        wlRoot: bigint;
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

// ------------------------------------------------------------------
// IDopamilioNFT
// ------------------------------------------------------------------
export interface IDopamilioNFT extends IOP_NETContract {
    tokenURI(tokenId: bigint): Promise<TokenURI>;
    mint(amount: bigint, proof: bigint[]): Promise<Mint>;
    startMint(): Promise<StartMint>;
    setWLRoot(root: bigint): Promise<SetWLRoot>;
    addToTeamList(addr: Address): Promise<AddToTeamList>;
    setMintPrice(priceSats: bigint): Promise<SetMintPrice>;
    setTreasuryAddress(addr: string): Promise<SetTreasuryAddress>;
    getMintPrice(): Promise<GetMintPrice>;
    getPhase(): Promise<GetPhase>;
    getStartTime(): Promise<GetStartTime>;
    getTeamDuration(): Promise<GetTeamDuration>;
    getWlDuration(): Promise<GetWlDuration>;
    getIsTestnet(): Promise<GetIsTestnet>;
    getTreasuryAddress(): Promise<GetTreasuryAddress>;
    getWLRoot(): Promise<GetWLRoot>;
    getMintedCount(addr: Address, phase: number): Promise<GetMintedCount>;
}
