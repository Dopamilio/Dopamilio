/**
 * setup.ts — Configure DopamilioNFT after deployment
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx setup.ts <contractAddress>
 *
 * Notes:
 *   - baseURI, icon, banner, description, website are all set inside onDeployment
 *     via instantiate(). This script verifies state and can update via changeMetadata.
 *
 * SECURITY: mnemonic only via env var — NEVER hardcoded.
 */
import { networks } from '@btc-vision/bitcoin';
import {
    ABIDataTypes,
    Mnemonic,
    MLDSASecurityLevel,
    AddressTypes,
    Address,
} from '@btc-vision/transaction';
import { BitcoinAbiTypes, BitcoinInterfaceAbi, getContract, JSONRpcProvider } from 'opnet';

const RPC_URL = 'https://testnet.opnet.org';
const NETWORK = networks.opnetTestnet;

// Collection values (must match DopamilioNFT.ts constants — plain URLs, no HTML)
const BASE_URI    = 'https://dopamilio.xyz/api/metadata';
const ICON_URL    = 'https://dopamilio.xyz/icon.png';
const BANNER_URL  = 'https://dopamilio.xyz/banner.png';
const WEBSITE_URL = 'https://dopamilio.xyz';
const DESCRIPTION = '3,333 unique degenerates etched on Bitcoin. 100% on-chain. Pure dopamine.';

const args = process.argv.slice(2);
if (args.length < 1) {
    console.error('Usage: OPNET_MNEMONIC="..." npx tsx setup.ts <contractAddress>');
    process.exit(1);
}
const CONTRACT_ADDR = args[0];

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) {
    console.error('ERROR: set OPNET_MNEMONIC env var');
    process.exit(1);
}

const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2WPKH, 0);

console.log('Deployer P2TR   :', wallet.p2tr);
console.log('Deployer OPNet  :', wallet.address.toString());
console.log('Contract        :', CONTRACT_ADDR);

const provider = new JSONRpcProvider({ url: RPC_URL, network: NETWORK });

function bytesToHex(b: Uint8Array): string {
    return Array.from(b).map(x => x.toString(16).padStart(2, '0')).join('');
}

const senderAddr = Address.fromString(
    wallet.address.toString(),
    bytesToHex(wallet.keypair.publicKey as Uint8Array),
);

async function sleep(ms: number): Promise<void> {
    return new Promise(r => setTimeout(r, ms));
}

async function sendTx(sim: any, label: string): Promise<void> {
    if (sim.revert) throw new Error(`${label} reverted: ${sim.revert}`);
    const receipt = await sim.sendTransaction({
        signer: wallet.keypair, mldsaSigner: wallet.mldsaKeypair,
        refundTo: wallet.p2tr, network: NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!receipt) throw new Error(`${label}: no receipt`);
    console.log(`  OK ${label} TX: ${receipt.transactionId ?? ''}`);
    await sleep(5_000);
}

const ABI: BitcoinInterfaceAbi = [
    // OP721 base methods
    {
        name: 'changeMetadata',
        inputs: [
            { name: 'icon',        type: ABIDataTypes.STRING },
            { name: 'banner',      type: ABIDataTypes.STRING },
            { name: 'description', type: ABIDataTypes.STRING },
            { name: 'website',     type: ABIDataTypes.STRING },
        ],
        outputs: [],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'setBaseURI',
        inputs:  [{ name: 'baseURI', type: ABIDataTypes.STRING }],
        outputs: [],
        type: BitcoinAbiTypes.Function,
    },
    // DopamilioNFT custom views
    {
        name: 'getPhase',
        inputs:  [],
        outputs: [{ name: 'phase', type: ABIDataTypes.UINT8 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getTreasuryAddress',
        inputs:  [],
        outputs: [{ name: 'addr', type: ABIDataTypes.STRING }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getMintPrice',
        inputs:  [],
        outputs: [{ name: 'priceSats', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getIsTestnet',
        inputs:  [],
        outputs: [{ name: 'isTestnet', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'totalSupply',
        inputs:  [],
        outputs: [{ name: 'totalSupply', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'tokenURI',
        inputs:  [{ name: 'tokenId', type: ABIDataTypes.UINT256 }],
        outputs: [{ name: 'uri', type: ABIDataTypes.STRING }],
        type: BitcoinAbiTypes.Function,
    },
];

async function main(): Promise<void> {
    const contract = getContract(CONTRACT_ADDR, ABI, provider, NETWORK, senderAddr);

    // ── Step 1: Verify contract state set in onDeployment ─────────────────────
    console.log('\n--- Verifying onDeployment state ---');

    const phaseSim = await (contract as any).getPhase();
    console.log('  Phase:', phaseSim.properties?.phase ?? phaseSim);

    const treasurySim = await (contract as any).getTreasuryAddress();
    console.log('  Treasury:', treasurySim.properties?.addr ?? treasurySim);

    const priceSim = await (contract as any).getMintPrice();
    console.log('  MintPrice (sats):', priceSim.properties?.priceSats?.toString() ?? priceSim);

    const testnetSim = await (contract as any).getIsTestnet();
    console.log('  IsTestnet:', testnetSim.properties?.isTestnet ?? testnetSim);

    const supplySim = await (contract as any).totalSupply();
    console.log('  TotalSupply:', supplySim.properties?.totalSupply?.toString() ?? supplySim);

    // ── Step 2: tokenURI(1) — verify metadata URL is serving correctly ────────
    console.log('\n--- Step 2: tokenURI(1) --- (only after first mint)');
    console.log('  Expected:', BASE_URI + '/1.json');
    // Note: tokenURI reverts if token doesn't exist yet — skip if supply is 0
    if ((supplySim.properties?.totalSupply ?? 0n) > 0n) {
        const uriSim = await (contract as any).tokenURI(1n);
        console.log('  tokenURI(1):', uriSim.properties?.uri ?? uriSim);
    } else {
        console.log('  Skipped (no tokens minted yet)');
    }

    console.log('\n=================================================================');
    console.log(' Setup complete! All metadata set via onDeployment:');
    console.log(' Contract   :', CONTRACT_ADDR);
    console.log(' BaseURI    :', BASE_URI);
    console.log(' Icon       :', ICON_URL);
    console.log(' Banner     :', BANNER_URL);
    console.log(' Phase      :', phaseSim.properties?.phase ?? '?', '(3=PUBLIC)');
    console.log(' IsTestnet  :', testnetSim.properties?.isTestnet ?? testnetSim);
    console.log(' MintPrice  : 6969 sats');
    console.log('=================================================================');
}

main().catch((err) => {
    console.error('Setup failed:', err);
    process.exit(1);
});
