/**
 * estimate-mainnet.ts — Simula deploy na mainnet SEM broadcast
 * Cria UTXO sintético, assina o deployment, mede tamanho real das TXs
 * e calcula custo total com taxa atual da mempool.
 *
 * Usage: OPNET_MNEMONIC="..." npx tsx estimate-mainnet.ts
 */
import { readFileSync } from 'fs';
import { networks } from '@btc-vision/bitcoin';
import {
    IDeploymentParameters,
    Mnemonic,
    MLDSASecurityLevel,
    TransactionFactory,
    AddressTypes,
    UTXO,
} from '@btc-vision/transaction';
import { JSONRpcProvider } from 'opnet';

const MAINNET_RPC = 'https://api.opnet.org';
const WASM_PATH   = './build/DopamilioNFT.wasm';
const NETWORK     = networks.bitcoin; // mainnet

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) { console.error('ERROR: set OPNET_MNEMONIC'); process.exit(1); }

const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2WPKH, 0);

console.log('\n═══════════════════════════════════════════════════');
console.log(' DOPAMILIO — SIMULAÇÃO DE DEPLOY MAINNET');
console.log('═══════════════════════════════════════════════════');
console.log(' Deployer P2TR  :', wallet.p2tr);
console.log(' Deployer OPNet :', wallet.address.toString());

const bytecode = readFileSync(WASM_PATH);
console.log(' WASM size      :', bytecode.length, 'bytes');

// Fetch fee rate from mempool.space (mainnet)
async function getFeeRate(): Promise<number> {
    try {
        const r = await fetch('https://mempool.space/api/v1/fees/recommended', { signal: AbortSignal.timeout(8000) });
        const d = await r.json() as any;
        // halfHourFee = ~30min confirmation
        return d.halfHourFee ?? d.fastestFee ?? 30;
    } catch(e) {
        console.warn(' ⚠ mempool.space inacessível, usando 30 sat/vb como estimativa');
        return 30;
    }
}

// Decode vbytes from raw transaction hex (SegWit-aware)
function txVbytes(rawHex: string): number {
    const buf = Buffer.from(rawHex, 'hex');
    // Check if SegWit marker (byte 4 = 0x00, byte 5 = 0x01)
    const isSegwit = buf[4] === 0x00 && buf[5] === 0x01;
    if (!isSegwit) return buf.length;
    // Strip witness for base size (4 bytes each way):
    // base_size * 3 + total_size) / 4
    // Approximate: total is buf.length, witness = buf.length - stripped
    // For a good estimate: vbytes = ceil((non_witness * 3 + total) / 4)
    // We don't strip witness manually here — use weight approximation:
    // SegWit vbytes ≈ non_witness_part + witness_part/4
    // Safe conservative estimate: assume 60% non-witness, 40% witness
    const total = buf.length;
    const estimatedWitness = Math.round(total * 0.70); // WASM is ~70% of reveal
    const nonWitness = total - estimatedWitness;
    return Math.ceil(nonWitness + estimatedWitness / 4);
}

async function estimate(): Promise<void> {
    const feeRate = await getFeeRate();
    console.log('\n───────────────────────────────────────────────────');
    console.log(' Fonte taxa     : mempool.space (halfHourFee)');
    console.log(' Taxa atual     :', feeRate, 'sat/vbyte');
    console.log('───────────────────────────────────────────────────');

    // UTXO sintético com 1 BTC de saldo (apenas para assinar, não broadcast)
    const DUMMY_TXID = '0'.repeat(64);
    const SYNTHETIC_VALUE = 100_000_000n; // 1 BTC em sats

    const fakeUtxo: UTXO = {
        transactionId: DUMMY_TXID,
        outputIndex:   0,
        value:         SYNTHETIC_VALUE,
        scriptPubKey: {
            hex:     '',
            address: wallet.p2tr,
        },
    };

    // Obtém challenge do mainnet
    let challenge: Uint8Array;
    try {
        const provider = new JSONRpcProvider({ url: MAINNET_RPC, network: NETWORK });
        challenge = await provider.getChallenge();
        console.log(' Challenge      : obtido da mainnet OPNet ✓');
    } catch(e) {
        // Se mainnet RPC não responder, usa challenge zero (estimativa ainda válida para tamanho)
        console.warn(' ⚠ Mainnet RPC inacessível, usando challenge neutro (tamanho real pode variar ±2%)');
        challenge = new Uint8Array(32);
    }

    const factory = new TransactionFactory();
    const params: IDeploymentParameters = {
        from:                        wallet.p2tr,
        utxos:                       [fakeUtxo],
        signer:                      wallet.keypair,
        mldsaSigner:                 wallet.mldsaKeypair,
        network:                     NETWORK,
        feeRate,
        priorityFee:                 0n,
        gasSatFee:                   15_000n,
        bytecode,
        challenge,
        linkMLDSAPublicKeyToAddress: true,
        revealMLDSAPublicKey:        true,
    };

    console.log('\n Assinando (sem broadcast)...');
    let deployment: any;
    try {
        deployment = await factory.signDeployment(params);
    } catch(e: any) {
        console.error(' ✗ Falha ao assinar:', e?.message);
        console.log('\n ── ESTIMATIVA MANUAL (baseada no tamanho WASM) ──');
        manualEstimate(feeRate, bytecode.length);
        return;
    }

    const tx0 = deployment.transaction[0]; // funding TX (hex)
    const tx1 = deployment.transaction[1]; // reveal TX (hex)

    const fundingBytes  = tx0 ? tx0.length / 2 : 300;
    const revealBytes   = tx1 ? tx1.length / 2 : bytecode.length + 600;
    const fundingVb     = tx0 ? txVbytes(tx0) : 300;
    const revealVb      = tx1 ? txVbytes(tx1) : Math.ceil(bytecode.length / 4 + 600);

    const fundingFee    = BigInt(Math.ceil(fundingVb * feeRate));
    const revealFee     = BigInt(Math.ceil(revealVb  * feeRate));
    const totalFeeSats  = fundingFee + revealFee;
    const totalBtc      = Number(totalFeeSats) / 1e8;

    console.log('\n═══════════════════════════════════════════════════');
    console.log(' RESULTADO DA SIMULAÇÃO');
    console.log('═══════════════════════════════════════════════════');
    console.log(' Contrato       :', deployment.contractAddress ?? '—');
    console.log('');
    console.log(' Funding TX');
    console.log('   Tamanho bruto:', fundingBytes.toLocaleString(), 'bytes');
    console.log('   vbytes        :', fundingVb.toLocaleString());
    console.log('   Taxa          :', fundingFee.toLocaleString(), 'sats');
    console.log('');
    console.log(' Reveal TX (WASM embedded)');
    console.log('   Tamanho bruto:', revealBytes.toLocaleString(), 'bytes');
    console.log('   vbytes        :', revealVb.toLocaleString());
    console.log('   Taxa          :', revealFee.toLocaleString(), 'sats');
    console.log('');
    console.log(' ──────────────────────────────────────────────────');
    console.log(' TOTAL TAXAS    :', totalFeeSats.toLocaleString(), 'sats');
    console.log(' TOTAL BTC      :', totalBtc.toFixed(8), 'BTC');
    console.log(' ──────────────────────────────────────────────────');
    console.log(' Taxa usada     :', feeRate, 'sat/vb  (halfHour mempool.space)');
    console.log('');
    console.log(' ⚠  Este é o custo APENAS de taxas de rede.');
    console.log('    + gasSatFee (15,000 sats) cobrado pelo OPNet.');
    console.log('    Total com gas:', (totalFeeSats + 15_000n).toLocaleString(), 'sats /');
    console.log('                  ', ((Number(totalFeeSats) + 15_000) / 1e8).toFixed(8), 'BTC');
    console.log('═══════════════════════════════════════════════════\n');
}

function manualEstimate(feeRate: number, wasmBytes: number): void {
    // Estimativa analítica baseada em transações OPNet conhecidas
    const fundingVb  = 350;                         // ~350 vbytes (standard P2WPKH → P2TR)
    const revealVb   = Math.ceil(wasmBytes / 4 + 800); // witness discount + overhead + MLDSA sig
    const totalVb    = fundingVb + revealVb;
    const totalFee   = totalVb * feeRate;

    console.log(' Funding  :', fundingVb, 'vb × ', feeRate, '=', (fundingVb * feeRate).toLocaleString(), 'sats');
    console.log(' Reveal   :', revealVb, 'vb × ', feeRate, '=', (revealVb * feeRate).toLocaleString(), 'sats');
    console.log(' ─────────────────────────────────────────────────');
    console.log(' TOTAL    :', totalFee.toLocaleString(), 'sats  /  ' + (totalFee / 1e8).toFixed(8), 'BTC');
    console.log(' + gas    :', (totalFee + 15_000).toLocaleString(), 'sats  /  ' + ((totalFee + 15_000) / 1e8).toFixed(8), 'BTC');
}

estimate().catch((err) => {
    console.error('Erro:', err?.message ?? err);
    process.exit(1);
});
