/**
 * init-wl.ts — Initialize WL phase on deployed DopamilioNFT (new contract)
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx init-wl.ts <contractAddress>
 *
 * Reads wl.txt and calls initMint(wlAddresses[]) — a single transaction that:
 *   1. Sets all WL addresses on-chain
 *   2. Activates the TEAM→WL phase clock
 *
 * Only opt1p... bech32m addresses are passed as WL.
 * The deployer wallet is added to TEAM automatically in onDeployment().
 *
 * SECURITY: mnemonic only via env var — NEVER hardcoded.
 */
import { readFileSync } from 'fs';
import { resolve } from 'path';
import { networks } from '@btc-vision/bitcoin';
import {
    Mnemonic,
    MLDSASecurityLevel,
    AddressTypes,
    Address,
} from '@btc-vision/transaction';
import { ABIDataTypes, BitcoinAbiTypes, BitcoinInterfaceAbi, getContract, JSONRpcProvider } from 'opnet';
import { bech32m } from 'bech32';

const RPC_URL = 'https://testnet.opnet.org';
const NETWORK  = networks.opnetTestnet;

const args = process.argv.slice(2);
if (args.length < 1) {
    console.error('Usage: OPNET_MNEMONIC="..." npx tsx init-wl.ts <contractAddress>');
    process.exit(1);
}
const CONTRACT_ADDR = args[0];

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) {
    console.error('ERROR: set OPNET_MNEMONIC env var');
    process.exit(1);
}

// ─── Parse wl.txt ──────────────────────────────────────────────────────────
// Only opt1p... bech32m addresses are WL entries (deployer hex is TEAM, handled in contract)
const wlFile = resolve(__dirname, 'wl.txt');
const wlLines: string[] = readFileSync(wlFile, 'utf8')
    .split('\n')
    .map(l => l.trim())
    .filter(l => l && !l.startsWith('#'));

const opt1pAddresses = wlLines.filter(l => l.startsWith('opt1p'));
if (opt1pAddresses.length === 0) {
    console.error('ERROR: no opt1p addresses found in wl.txt');
    process.exit(1);
}

// Decode bech32m opt1p → 32-byte x-only pubkey → BigInt
function opt1pToBigInt(addr: string): bigint {
    const decoded = bech32m.decode(addr);
    // witness program: first byte is version (1), rest is the 32-byte pubkey
    const words = bech32m.fromWords(decoded.words.slice(1)); // skip witness version
    if (words.length !== 32) {
        throw new Error(`Invalid opt1p address (expected 32 bytes, got ${words.length}): ${addr}`);
    }
    const hex = Buffer.from(words).toString('hex');
    return BigInt('0x' + hex);
}

const wlBigInts: bigint[] = opt1pAddresses.map((addr, i) => {
    try {
        const bi = opt1pToBigInt(addr);
        console.log(`WL[${i}] ${addr} → 0x${bi.toString(16).padStart(64, '0')}`);
        return bi;
    } catch (e: any) {
        console.error(`ERROR decoding WL address ${addr}: ${e.message}`);
        process.exit(1);
    }
});

// ─── Wallet setup ───────────────────────────────────────────────────────────
const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2WPKH, 0);

function bytesToHex(b: Uint8Array): string {
    return Array.from(b).map(x => x.toString(16).padStart(2, '0')).join('');
}

const senderAddr = Address.fromString(
    wallet.address.toString(),
    bytesToHex(wallet.keypair.publicKey as Uint8Array),
);

console.log('\nDeployer P2TR  :', wallet.p2tr);
console.log('Deployer OPNet :', wallet.address.toString());
console.log('Contract       :', CONTRACT_ADDR);
console.log(`WL count       : ${wlBigInts.length} addresses`);

// ─── ABI ────────────────────────────────────────────────────────────────────
const ABI: BitcoinInterfaceAbi = [
    {
        name: 'initMint',
        inputs:  [{ name: 'wlAddresses', type: ABIDataTypes.ARRAY_OF_UINT256 }],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getPhase',
        inputs:  [],
        outputs: [{ name: 'phase', type: ABIDataTypes.UINT8 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'isWhitelisted',
        inputs:  [{ name: 'addr', type: ABIDataTypes.ADDRESS }],
        outputs: [{ name: 'ok', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
];

// ─── Main ────────────────────────────────────────────────────────────────────
const provider = new JSONRpcProvider({ url: RPC_URL, network: NETWORK });

async function sleep(ms: number): Promise<void> {
    return new Promise(r => setTimeout(r, ms));
}

async function main(): Promise<void> {
    const contract = getContract(CONTRACT_ADDR, ABI, provider, NETWORK, senderAddr);

    // Pre-check: contract should be in phase 0 (INACTIVE)
    const phaseSim = await (contract as any).getPhase();
    const phase = Number(phaseSim.properties?.phase ?? phaseSim);
    console.log('\nCurrent phase:', phase, '(expected 0 = INACTIVE)');
    if (phase !== 0) {
        console.warn('WARNING: Phase is not 0. initMint may revert if already initialized.');
    }

    // Call initMint(wlAddresses[])
    console.log('\n--- Calling initMint ---');
    const sim = await (contract as any).initMint(wlBigInts);
    if (sim.revert) {
        throw new Error(`initMint simulation reverted: ${sim.revert}`);
    }

    const receipt = await sim.sendTransaction({
        signer:      wallet.keypair,
        mldsaSigner: wallet.mldsaKeypair,
        refundTo:    wallet.p2tr,
        network:     NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!receipt) throw new Error('initMint: no receipt');
    console.log('  OK initMint TX:', receipt.transactionId ?? '');

    // Wait for indexer
    console.log('  Waiting 15s for indexer...');
    await sleep(15_000);

    // Verify phase moved to TEAM (1)
    const phaseAfterSim = await (contract as any).getPhase();
    const phaseAfter = Number(phaseAfterSim.properties?.phase ?? phaseAfterSim);
    console.log('Phase after initMint:', phaseAfter, '(expected 1 = TEAM)');

    console.log('\n=================================================================');
    console.log(' initMint complete!');
    console.log(' Contract :', CONTRACT_ADDR);
    console.log(` WL count : ${wlBigInts.length} addresses set on-chain`);
    console.log(' Phase    :', phaseAfter, '(1=TEAM 15min → 2=WL 1day → 3=PUBLIC)');
    console.log(' Next: update CONTRACT_ADDR + CONTRACT_P2TR in index.html, then git push');
    console.log('=================================================================');
}

main().catch((err) => {
    console.error('init-wl failed:', err);
    process.exit(1);
});
