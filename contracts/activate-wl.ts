/**
 * activate-wl.ts — Activate WL phase on DopamilioNFT
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx activate-wl.ts <contractAddress> [--mainnet]
 *
 * Calls:
 *   activateWL() — phase 1 (TEAM) → 2 (WL)
 *   Stores on-chain medianTimestamp → wlStartTime (used by frontend for 1.5h countdown)
 *
 * Run this AFTER verifying deployer mints in TEAM phase.
 * After 1.5h WL window, run activate-public.ts.
 * SECURITY: mnemonic only via env var — NEVER hardcoded.
 */
import { networks } from '@btc-vision/bitcoin';
import {
    Mnemonic,
    MLDSASecurityLevel,
    AddressTypes,
    Address,
} from '@btc-vision/transaction';
import { ABIDataTypes, BitcoinAbiTypes, BitcoinInterfaceAbi, getContract, JSONRpcProvider } from 'opnet';

const IS_MAINNET = process.argv.includes('--mainnet');
const RPC_URL    = IS_MAINNET ? 'https://mainnet.opnet.org' : 'https://testnet.opnet.org';
const NETWORK    = IS_MAINNET ? networks.bitcoin : networks.opnetTestnet;

const args = process.argv.slice(2).filter(a => !a.startsWith('--'));
if (args.length < 1) {
    console.error('Usage: OPNET_MNEMONIC="..." npx tsx activate-wl.ts <contractAddress> [--mainnet]');
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

function bytesToHex(b: Uint8Array): string {
    return Array.from(b).map(x => x.toString(16).padStart(2, '0')).join('');
}

const senderAddr = Address.fromString(
    wallet.address.toString(),
    bytesToHex(wallet.keypair.publicKey as Uint8Array),
);

const ABI: BitcoinInterfaceAbi = [
    {
        name: 'activateWL',
        inputs:  [],
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
        name: 'getWlStartTime',
        inputs:  [],
        outputs: [{ name: 'startTime', type: ABIDataTypes.UINT64 }],
        type: BitcoinAbiTypes.Function,
    },
];

const provider = new JSONRpcProvider({ url: RPC_URL, network: NETWORK });

async function sleep(ms: number): Promise<void> {
    return new Promise(r => setTimeout(r, ms));
}

async function waitForConfirmation(txId: string, label: string): Promise<void> {
    console.log(`  Waiting for ${label} TX to confirm...`);
    for (let i = 0; i < 30; i++) {
        await sleep(30_000);
        try {
            const tx = await (provider as any).getTransaction(txId);
            if (tx && tx.blockNumber) {
                console.log(`  Confirmed at block ${tx.blockNumber}`);
                return;
            }
        } catch (_) {}
        console.log(`  Still pending... (attempt ${i + 1}/30)`);
    }
    console.warn(`  WARNING: ${label} TX not confirmed after 15 min, proceeding anyway`);
}

async function main(): Promise<void> {
    const contract = getContract(CONTRACT_ADDR, ABI, provider, NETWORK, senderAddr);

    console.log('\nNetwork        :', IS_MAINNET ? 'MAINNET' : 'testnet');
    console.log('Deployer P2TR  :', wallet.p2tr);
    console.log('Deployer OPNet :', wallet.address.toString());
    console.log('Contract       :', CONTRACT_ADDR);

    // Pre-check: must be in phase 1 (TEAM)
    const phaseSim = await (contract as any).getPhase();
    const phase = Number(phaseSim.properties?.phase ?? phaseSim);
    console.log('\nCurrent phase:', phase, '(must be 1 = TEAM)');
    if (phase !== 1) {
        throw new Error(`Cannot activate WL: current phase is ${phase}, expected 1 (TEAM)`);
    }

    console.log('\n--- activateWL ---');
    const sim = await (contract as any).activateWL();
    if (sim.revert) throw new Error(`activateWL simulation reverted: ${sim.revert}`);

    const receipt = await sim.sendTransaction({
        signer:      wallet.keypair,
        mldsaSigner: wallet.mldsaKeypair,
        refundTo:    wallet.p2tr,
        network:     NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!receipt) throw new Error('activateWL: no receipt');
    const txId = receipt.transactionId ?? '';
    console.log('  OK activateWL TX:', txId);

    await waitForConfirmation(txId, 'activateWL');

    const phaseAfterSim = await (contract as any).getPhase();
    const phaseAfter = Number(phaseAfterSim.properties?.phase ?? phaseAfterSim);

    const wlStartSim  = await (contract as any).getWlStartTime();
    const wlStartTime = Number(wlStartSim.properties?.startTime ?? 0n);
    const wlEndTime   = wlStartTime + 5400;

    console.log('\nPhase after activateWL:', phaseAfter, '(expected 2 = WL)');
    console.log('WL start time  :', wlStartTime, wlStartTime > 0 ? '✓' : '⚠ WARNING: 0');
    console.log('WL end time    :', wlEndTime, '→', wlStartTime > 0 ? new Date(wlEndTime * 1000).toISOString() : 'N/A');

    console.log('\n=================================================================');
    console.log(' activate-wl complete!');
    console.log(' Network  :', IS_MAINNET ? 'MAINNET' : 'testnet');
    console.log(' Contract :', CONTRACT_ADDR);
    console.log(' Phase    :', phaseAfter, '(2=WL — open to all wallets, max 5 per wallet)');
    console.log(' WL ends  :', wlStartTime > 0 ? new Date(wlEndTime * 1000).toISOString() : 'N/A');
    console.log('');
    console.log(' Next steps:');
    console.log('   1. Frontend will auto-detect WL phase and show 1.5h countdown');
    console.log('   2. After 1.5h, run: npx tsx activate-public.ts', CONTRACT_ADDR, IS_MAINNET ? '--mainnet' : '');
    console.log('=================================================================');
}

main().catch((err) => {
    console.error('activate-wl failed:', err);
    process.exit(1);
});
