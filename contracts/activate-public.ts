/**
 * activate-public.ts — Transition DopamilioNFT to PUBLIC phase
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx activate-public.ts <contractAddress>
 *
 * Calls:
 *   activatePublic() — phase 2 (WL) → 3 (PUBLIC)
 *
 * Run this after the 1.5h WL window has passed.
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
    console.error('Usage: OPNET_MNEMONIC="..." npx tsx activate-public.ts <contractAddress> [--mainnet]');
    process.exit(1);
}
const CONTRACT_ADDR = args[0];

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) {
    console.error('ERROR: set OPNET_MNEMONIC env var');
    process.exit(1);
}

const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2TR, 0);

function bytesToHex(b: Uint8Array): string {
    return Array.from(b).map(x => x.toString(16).padStart(2, '0')).join('');
}

const senderAddr = Address.fromString(
    wallet.address.toString(),
    bytesToHex(wallet.keypair.publicKey as Uint8Array),
);

const ABI: BitcoinInterfaceAbi = [
    {
        name: 'activatePublic',
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

    console.log('\nDeployer P2TR  :', wallet.p2tr);
    console.log('Deployer OPNet :', wallet.address.toString());
    console.log('Contract       :', CONTRACT_ADDR);

    // Pre-check: must be in phase 2 (WL)
    const phaseSim = await (contract as any).getPhase();
    const phase = Number(phaseSim.properties?.phase ?? phaseSim);
    console.log('\nCurrent phase:', phase, '(must be 2 = WL)');
    if (phase !== 2) {
        throw new Error(`Cannot activate PUBLIC: current phase is ${phase}, expected 2 (WL)`);
    }

    console.log('\n--- activatePublic ---');
    const sim = await (contract as any).activatePublic();
    if (sim.revert) throw new Error(`activatePublic simulation reverted: ${sim.revert}`);

    const receipt = await sim.sendTransaction({
        signer:      wallet.keypair,
        mldsaSigner: wallet.mldsaKeypair,
        refundTo:    wallet.p2tr,
        network:     NETWORK,
        feeRate:     5,
        maximumAllowedSatToSpend: 4_200n,
    });
    if (!receipt) throw new Error('activatePublic: no receipt');
    const txId = receipt.transactionId ?? '';
    console.log('  OK activatePublic TX:', txId);

    await waitForConfirmation(txId, 'activatePublic');

    const phaseAfterSim = await (contract as any).getPhase();
    const phaseAfter = Number(phaseAfterSim.properties?.phase ?? phaseAfterSim);
    console.log('\nPhase after activatePublic:', phaseAfter, '(expected 3 = PUBLIC)');

    console.log('\n=================================================================');
    console.log(' activate-public complete!');
    console.log(' Contract :', CONTRACT_ADDR);
    console.log(' Phase    :', phaseAfter, '(3=PUBLIC — open to all wallets, max 3)');
    console.log('=================================================================');
}

main().catch((err) => {
    console.error('activate-public failed:', err);
    process.exit(1);
});
