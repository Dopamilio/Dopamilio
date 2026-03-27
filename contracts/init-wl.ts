/**
 * init-wl.ts — Initialize WL phase on deployed DopamilioNFT (manual phases)
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx init-wl.ts <contractAddress>
 *
 * Reads wl-root.txt (64-char hex Merkle root) and calls:
 *   1. setWLRoot(root)  — stores the Merkle root on-chain
 *   2. activateTeam()   — phase 0 → 1 (TEAM)
 *   3. activateWL()     — phase 1 → 2 (WL)
 * Three separate transactions. Verifies getPhase() == 2 (WL) at end.
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

// Read wl-root.txt — 64-char hex Merkle root
const rootFile = resolve(__dirname, 'wl-root.txt');
const rootHex  = readFileSync(rootFile, 'utf8').trim().replace(/^0x/i, '');
if (rootHex.length !== 64) {
    console.error(`ERROR: wl-root.txt must contain a 64-char hex string, got ${rootHex.length} chars`);
    process.exit(1);
}
const rootBigInt = BigInt('0x' + rootHex);

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
console.log('WL Merkle Root :', '0x' + rootHex);

// ABI
const ABI: BitcoinInterfaceAbi = [
    {
        name: 'setWLRoot',
        inputs:  [{ name: 'root', type: ABIDataTypes.UINT256 }],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'activateTeam',
        inputs:  [{ name: '_unused', type: ABIDataTypes.BOOL }],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'activateWL',
        inputs:  [{ name: '_unused', type: ABIDataTypes.BOOL }],
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
        name: 'getWLRoot',
        inputs:  [],
        outputs: [{ name: 'root', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
];

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
        console.warn('WARNING: Phase is not 0. activateTeam may revert if already initialized.');
    }

    // Step 1: Call setWLRoot(rootBigInt)
    console.log('\n--- Step 1: setWLRoot ---');
    const rootSim = await (contract as any).setWLRoot(rootBigInt);
    if (rootSim.revert) {
        throw new Error(`setWLRoot simulation reverted: ${rootSim.revert}`);
    }

    const rootReceipt = await rootSim.sendTransaction({
        signer:      wallet.keypair,
        mldsaSigner: wallet.mldsaKeypair,
        refundTo:    wallet.p2tr,
        network:     NETWORK,
        maximumAllowedSatToSpend: 100_000n,
    });
    if (!rootReceipt) throw new Error('setWLRoot: no receipt');
    console.log('  OK setWLRoot TX:', rootReceipt.transactionId ?? '');

    // Wait for indexer
    console.log('  Waiting 12s for indexer...');
    await sleep(12_000);

    // Step 2: Call activateTeam()
    console.log('\n--- Step 2: activateTeam ---');
    const teamSim = await (contract as any).activateTeam(false);
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
    console.log('  OK activateTeam TX:', teamReceipt.transactionId ?? '');

    // Wait for indexer
    console.log('  Waiting 12s for indexer...');
    await sleep(12_000);

    // Step 3: Call activateWL()
    console.log('\n--- Step 3: activateWL ---');
    const wlSim = await (contract as any).activateWL(false);
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
    console.log('  OK activateWL TX:', wlReceipt.transactionId ?? '');

    // Wait for indexer
    console.log('  Waiting 15s for indexer...');
    await sleep(15_000);

    // Verify phase moved to WL (2)
    const phaseAfterSim = await (contract as any).getPhase();
    const phaseAfter = Number(phaseAfterSim.properties?.phase ?? phaseAfterSim);
    console.log('Phase after activateWL:', phaseAfter, '(expected 2 = WL)');

    if (phaseAfter !== 2) {
        console.warn('WARNING: Expected phase 2 (WL) but got', phaseAfter);
    }

    // Verify WL root stored
    const rootVerifySim = await (contract as any).getWLRoot();
    const storedRoot = rootVerifySim.properties?.root ?? 0n;
    const storedRootHex = storedRoot.toString(16).padStart(64, '0');
    console.log('Stored WL root:', '0x' + storedRootHex);
    console.log('Root match    :', storedRootHex === rootHex ? 'YES' : 'NO — MISMATCH!');

    console.log('\n=================================================================');
    console.log(' init-wl complete!');
    console.log(' Contract :', CONTRACT_ADDR);
    console.log(' WL root  : 0x' + rootHex);
    console.log(' Phase    :', phaseAfter, '(2=WL — ready for whitelist minting)');
    console.log(' Next: run activatePublic() when WL window is over');
    console.log('=================================================================');
}

main().catch((err) => {
    console.error('init-wl failed:', err);
    process.exit(1);
});
