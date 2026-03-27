/**
 * init-wl.ts — Initialize WL phase on deployed DopamilioNFT v6 (manual phases)
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx init-wl.ts <contractAddress>
 *
 * Calls:
 *   1. activateTeam()   — phase 0 → 1 (TEAM)
 *   2. activateWL()     — phase 1 → 2 (WL)
 * Two separate transactions. Verifies getPhase() == 2 (WL) at end.
 *
 * Note: v6 has no on-chain WL proof — WL gating is frontend-only.
 *
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

// Wallet setup
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

// ABI
const ABI: BitcoinInterfaceAbi = [
    {
        name: 'activateTeam',
        inputs:  [],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
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

    // Pre-check: contract should be in phase 0 (INACTIVE)
    const phaseSim = await (contract as any).getPhase();
    const phase = Number(phaseSim.properties?.phase ?? phaseSim);
    console.log('\nCurrent phase:', phase, '(expected 0 = INACTIVE)');
    if (phase !== 0) {
        console.warn('WARNING: Phase is not 0. activateTeam may revert if already initialized.');
    }

    // Step 1: Call activateTeam()
    console.log('\n--- Step 1: activateTeam ---');
    const teamSim = await (contract as any).activateTeam();
    if (teamSim.revert) {
        throw new Error(`activateTeam simulation reverted: ${teamSim.revert}`);
    }

    const teamReceipt = await teamSim.sendTransaction({
        signer:      wallet.keypair,
        mldsaSigner: wallet.mldsaKeypair,
        refundTo:    wallet.p2tr,
        network:     NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!teamReceipt) throw new Error('activateTeam: no receipt');
    const teamTxId = teamReceipt.transactionId ?? '';
    console.log('  OK activateTeam TX:', teamTxId);

    await waitForConfirmation(teamTxId, 'activateTeam');

    // Step 2: Call activateWL()
    console.log('\n--- Step 2: activateWL ---');
    const wlSim = await (contract as any).activateWL();
    if (wlSim.revert) {
        throw new Error(`activateWL simulation reverted: ${wlSim.revert}`);
    }

    const wlReceipt = await wlSim.sendTransaction({
        signer:      wallet.keypair,
        mldsaSigner: wallet.mldsaKeypair,
        refundTo:    wallet.p2tr,
        network:     NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!wlReceipt) throw new Error('activateWL: no receipt');
    const wlTxId = wlReceipt.transactionId ?? '';
    console.log('  OK activateWL TX:', wlTxId);

    await waitForConfirmation(wlTxId, 'activateWL');

    // Verify final phase
    const phaseAfterSim = await (contract as any).getPhase();
    const phaseAfter = Number(phaseAfterSim.properties?.phase ?? phaseAfterSim);
    console.log('\nPhase after activateWL:', phaseAfter, '(expected 2 = WL)');

    if (phaseAfter !== 2) {
        console.warn('WARNING: Expected phase 2 (WL) but got', phaseAfter);
    }

    console.log('\n=================================================================');
    console.log(' init-wl complete!');
    console.log(' Contract :', CONTRACT_ADDR);
    console.log(' Phase    :', phaseAfter, '(2=WL — WL wallets can mint)');
    console.log(' Note     : WL gating is frontend-only (no on-chain proof)');
    console.log(' Next     : run activatePublic() when WL window is over');
    console.log('=================================================================');
}

main().catch((err) => {
    console.error('init-wl failed:', err);
    process.exit(1);
});
