/**
 * team-mint.ts — Mint NFTs as deployer during TEAM phase
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx team-mint.ts <contractAddress> <amount> [--mainnet]
 *
 * Mints <amount> tokens (max 10 total across all calls in TEAM phase).
 * SECURITY: mnemonic only via env var — NEVER hardcoded.
 */
import { address as btcAddress, networks } from '@btc-vision/bitcoin';
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

// Treasury: receives the NFT payment (6969 sats per token)
const TREASURY   = IS_MAINNET
    ? 'bc1pn7zlq5qmzagmnwfc9nwa9387qc6cnxwd6g2r74sl43xzvx446p7sptgpj0'
    : 'opt1pv5z0n6gn0n8szljp7dewl52548zyvt48pt406cl607wen22amalqfpft8p';
const MINT_PRICE_SATS = 6969n;

const args = process.argv.slice(2).filter(a => !a.startsWith('--'));
if (args.length < 2) {
    console.error('Usage: OPNET_MNEMONIC="..." npx tsx team-mint.ts <contractAddress> <amount> [--mainnet]');
    process.exit(1);
}
const CONTRACT_ADDR = args[0];
const AMOUNT        = parseInt(args[1], 10);
if (isNaN(AMOUNT) || AMOUNT < 1 || AMOUNT > 10) {
    console.error('ERROR: amount must be 1–10');
    process.exit(1);
}

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
        name: 'mint',
        inputs:  [{ name: 'amount', type: ABIDataTypes.UINT64 }],
        outputs: [{ name: 'firstTokenId', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'totalSupply',
        inputs:  [],
        outputs: [{ name: 'supply', type: ABIDataTypes.UINT256 }],
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
    console.warn(`  WARNING: TX not confirmed after 15 min, proceeding anyway`);
}

async function main(): Promise<void> {
    const contract = getContract(CONTRACT_ADDR, ABI, provider, NETWORK, senderAddr);

    console.log('\nDeployer P2TR  :', wallet.p2tr);
    console.log('Deployer OPNet :', wallet.address.toString());
    console.log('Contract       :', CONTRACT_ADDR);
    console.log('Amount         :', AMOUNT);
    console.log('Treasury       :', TREASURY);

    // Pre-checks
    const phaseSim = await (contract as any).getPhase();
    const phase    = Number(phaseSim.properties?.phase ?? phaseSim);
    console.log('\nCurrent phase  :', phase, '(must be 1 = TEAM)');
    if (phase !== 1) throw new Error(`Wrong phase: ${phase}, expected 1 (TEAM)`);

    const supplySim  = await (contract as any).totalSupply();
    const supplyBefore = Number(supplySim.properties?.supply ?? 0n);
    console.log('Supply before  :', supplyBefore);

    const mintCost = MINT_PRICE_SATS * BigInt(AMOUNT);
    console.log('\nMint cost      :', mintCost.toString(), 'sats (', Number(mintCost) / 1e8, 'BTC )');

    // Convert treasury bech32 address → raw output script (PSBT requires script, not address string)
    const treasuryScript = btcAddress.toOutputScript(TREASURY, NETWORK);

    // setTransactionDetails required before simulate — contract checks outputs even on testnet (IS_TESTNET=false)
    (contract as any).setTransactionDetails({
        inputs:  [],
        outputs: [{ to: TREASURY, value: mintCost, index: 1, flags: 1 /* hasTo */ }],
    });

    console.log('\n--- Simulating mint(' + AMOUNT + ') ---');
    const sim = await (contract as any).mint(BigInt(AMOUNT));
    if (sim.revert) throw new Error(`mint simulation reverted: ${sim.revert}`);

    const firstTokenId = Number(sim.properties?.firstTokenId ?? 0n);
    console.log('  Simulation OK — firstTokenId:', firstTokenId);

    console.log('--- Sending transaction ---');
    const receipt = await sim.sendTransaction({
        signer:       wallet.keypair,
        mldsaSigner:  wallet.mldsaKeypair,
        refundTo:     wallet.p2tr,
        network:      NETWORK,
        maximumAllowedSatToSpend: mintCost + 100_000n,
        extraOutputs: [{ script: treasuryScript, value: mintCost }],
    });
    if (!receipt) throw new Error('mint: no receipt');
    const txId = receipt.transactionId ?? '';
    console.log('  TX sent:', txId);

    await waitForConfirmation(txId, 'mint');

    // Verify supply increased
    const supplyAfterSim = await (contract as any).totalSupply();
    const supplyAfter    = Number(supplyAfterSim.properties?.supply ?? 0n);
    console.log('\n=================================================================');
    console.log(' team-mint complete!');
    console.log(' Contract  :', CONTRACT_ADDR);
    console.log(' TX        :', txId);
    console.log(' Minted    :', AMOUNT, 'token(s)');
    console.log(' Token IDs :', '#' + firstTokenId, '→', '#' + (firstTokenId + AMOUNT - 1));
    console.log(' Supply    :', supplyBefore, '→', supplyAfter);
    console.log('=================================================================');
}

main().catch((err) => {
    console.error('team-mint failed:', err);
    process.exit(1);
});
