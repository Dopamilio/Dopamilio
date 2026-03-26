/**
 * set-base-uri.ts — Update baseURI for DopamilioNFT
 * Usage: OPNET_MNEMONIC="..." npx tsx set-base-uri.ts <contractAddress> <newBaseURI>
 */
import { networks } from '@btc-vision/bitcoin';
import { ABIDataTypes, Mnemonic, MLDSASecurityLevel, AddressTypes, Address } from '@btc-vision/transaction';
import { BitcoinAbiTypes, BitcoinInterfaceAbi, getContract, JSONRpcProvider } from 'opnet';

const RPC_URL = 'https://testnet.opnet.org';
const NETWORK     = networks.opnetTestnet;

const args = process.argv.slice(2);
if (args.length < 2) {
    console.error('Usage: OPNET_MNEMONIC="..." npx tsx set-base-uri.ts <contractAddr> <newBaseURI>');
    process.exit(1);
}
const CONTRACT_ADDR = args[0];
const NEW_BASE_URI  = args[1];

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) { console.error('ERROR: set OPNET_MNEMONIC env var'); process.exit(1); }

const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2WPKH, 0);

console.log('Deployer P2TR  :', wallet.p2tr);
console.log('Contract       :', CONTRACT_ADDR);
console.log('New baseURI    :', NEW_BASE_URI);

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

const ABI: BitcoinInterfaceAbi = [
    {
        name: 'setBaseURI',
        inputs:  [{ name: 'baseURI', type: ABIDataTypes.STRING }],
        outputs: [],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'tokenURI',
        inputs:  [{ name: 'tokenId', type: ABIDataTypes.UINT256 }],
        outputs: [{ name: 'uri', type: ABIDataTypes.STRING }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'totalSupply',
        inputs:  [],
        outputs: [{ name: 'total', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
];

async function main(): Promise<void> {
    const contract = getContract(CONTRACT_ADDR, ABI, provider, NETWORK, senderAddr);

    console.log('\n--- Calling setBaseURI ---');
    const sim = await (contract as any).setBaseURI(NEW_BASE_URI);
    if (sim.revert) throw new Error(`setBaseURI reverted: ${sim.revert}`);

    const receipt = await sim.sendTransaction({
        signer: wallet.keypair, mldsaSigner: wallet.mldsaKeypair,
        refundTo: wallet.p2tr, network: NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!receipt) throw new Error('no receipt');
    console.log('  TX:', receipt.transactionId ?? '');

    console.log('\n--- Waiting 15s for indexer ---');
    await sleep(15_000);

    // Verify
    const totalRes = await (contract as any).totalSupply();
    const total = totalRes?.properties?.total ?? 0n;
    if (total > 0n) {
        const uriRes = await (contract as any).tokenURI(1n);
        console.log('  tokenURI(1):', uriRes?.properties?.uri ?? uriRes);
    }
    console.log('\n✓ setBaseURI complete');
}

main().catch(e => { console.error('Failed:', e); process.exit(1); });
