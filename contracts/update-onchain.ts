/**
 * update-onchain.ts — Update icon, banner and baseURI on-chain
 *
 * OP721 base's changeMetadata is decorated as @method('changeMetadata') with no parameter
 * annotations, so its on-chain selector is sha256('changeMetadata()')[0:4] = 0x4b1dd8fb.
 * We must build the calldata manually (selector + 4 length-prefixed UTF-8 strings) and call
 * provider.call() directly — using getContract with 4 STRING inputs would produce the wrong
 * selector 0x2d8cbbc1 = changeMetadata(string,string,string,string).
 *
 * Usage: OPNET_MNEMONIC="..." npx tsx update-onchain.ts <contractAddr>
 */
import { networks } from '@btc-vision/bitcoin';
import {
    ABICoder,
    BinaryWriter,
    Mnemonic,
    MLDSASecurityLevel,
    AddressTypes,
    Address,
    ABIDataTypes,
} from '@btc-vision/transaction';
import { BitcoinAbiTypes, BitcoinInterfaceAbi, getContract, JSONRpcProvider } from 'opnet';

const TESTNET_RPC = 'https://testnet.opnet.org';
const NETWORK     = networks.opnetTestnet;

const ICON_URL    = 'https://dopamilio-mint.vercel.app/icon.png';
const BANNER_URL  = 'https://dopamilio-mint.vercel.app/banner.png';
const BASE_URI    = 'https://dopamilio-mint.vercel.app/api/metadata';
const DESCRIPTION = '3,333 unique degenerates etched on Bitcoin. 100% on-chain. Pure dopamine.';
const WEBSITE_URL = 'https://dopamilio.xyz';

const args = process.argv.slice(2);
if (args.length < 1) { console.error('Usage: OPNET_MNEMONIC="..." npx tsx update-onchain.ts <contractAddr>'); process.exit(1); }
const CONTRACT_ADDR = args[0];

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) { console.error('ERROR: set OPNET_MNEMONIC env var'); process.exit(1); }

const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2WPKH, 0);
const provider    = new JSONRpcProvider({ url: TESTNET_RPC, network: NETWORK });

function bytesToHex(b: Uint8Array): string {
    return Array.from(b).map(x => x.toString(16).padStart(2, '0')).join('');
}
const senderAddr = Address.fromString(
    wallet.address.toString(),
    bytesToHex(wallet.keypair.publicKey as Uint8Array),
);

async function sleep(ms: number): Promise<void> { return new Promise(r => setTimeout(r, ms)); }

async function sendTx(sim: any, label: string): Promise<void> {
    if (sim.revert) throw new Error(`${label} reverted: ${sim.revert}`);
    const receipt = await sim.sendTransaction({
        signer: wallet.keypair, mldsaSigner: wallet.mldsaKeypair,
        refundTo: wallet.p2tr, network: NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!receipt) throw new Error(`${label}: no receipt`);
    console.log(`  OK ${label}: ${receipt.transactionId ?? ''}`);
    await sleep(5_000);
}

// setBaseURI ABI — normal, inputs declared correctly
const SETURI_ABI: BitcoinInterfaceAbi = [
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
];

async function main(): Promise<void> {
    const abiCoder = new ABICoder();

    // ── 1. changeMetadata via raw calldata ──────────────────────────────────────
    // On-chain selector = sha256('changeMetadata()')[0:4] = 0x4b1dd8fb = 1260247291
    console.log('\n--- 1. changeMetadata (icon + banner → Vercel) ---');

    const selectorHex = abiCoder.encodeSelector('changeMetadata()');
    const selectorNum = Number('0x' + selectorHex);
    console.log(`  selector: 0x${selectorHex} (${selectorNum})`);

    const writer = new BinaryWriter();
    writer.writeSelector(selectorNum);
    writer.writeStringWithLength(ICON_URL);
    writer.writeStringWithLength(BANNER_URL);
    writer.writeStringWithLength(DESCRIPTION);
    writer.writeStringWithLength(WEBSITE_URL);
    const calldata = writer.getBuffer();

    const metaSim = await provider.call(CONTRACT_ADDR, calldata, senderAddr);
    if ('error' in metaSim) throw new Error(`changeMetadata error: ${(metaSim as any).error}`);
    if ((metaSim as any).revert) throw new Error(`changeMetadata reverted: ${(metaSim as any).revert}`);

    // Set required fields on the CallResult for sendTransaction to work
    const contractAddrObj = await provider.getPublicKeyInfo(CONTRACT_ADDR, true);
    if (!contractAddrObj) throw new Error('Contract not found on network');
    const p2op = contractAddrObj.p2op(NETWORK);

    (metaSim as any).setTo(p2op, contractAddrObj);
    (metaSim as any).setCalldata(calldata);
    (metaSim as any).setFromAddress(senderAddr);

    // Gas estimation (mirrors Contract.ts logic)
    const gasParams  = await provider.gasParameters();
    const gasPerSat  = gasParams.gasPerSat;
    const rawGas     = (metaSim as any).estimatedGas ?? 0n;
    const exactGas   = (rawGas * gasPerSat) / 1_000_000_000_000n;
    const boosted    = (exactGas * 100n) / 85n;   // +15%
    const finalGas   = boosted > 297n ? boosted : 297n;
    (metaSim as any).setGasEstimation(finalGas, 0n);
    (metaSim as any).setBitcoinFee(gasParams.bitcoin);

    await sendTx(metaSim, 'changeMetadata');

    // ── 2. setBaseURI via getContract (ABI correct) ─────────────────────────────
    console.log('\n--- 2. setBaseURI → Vercel API endpoint ---');
    const contract = getContract(CONTRACT_ADDR, SETURI_ABI, provider, NETWORK, senderAddr);
    const uriSim   = await (contract as any).setBaseURI(BASE_URI);
    await sendTx(uriSim, 'setBaseURI');

    console.log('\n--- Waiting 30s for indexer ---');
    await sleep(30_000);

    console.log('\n--- Verify tokenURI(1) ---');
    const uriRes = await (contract as any).tokenURI(1n);
    console.log('  tokenURI(1):', uriRes?.properties?.uri ?? uriRes);

    console.log('\n=== Done ===');
    console.log('  Icon   :', ICON_URL);
    console.log('  Banner :', BANNER_URL);
    console.log('  BaseURI:', BASE_URI);
}

main().catch(e => { console.error('Failed:', e); process.exit(1); });
