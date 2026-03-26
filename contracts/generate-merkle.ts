/**
 * generate-merkle.ts — Build Merkle tree from wl.txt and output root + proofs
 *
 * Usage (from contracts/ folder):
 *   npx tsx generate-merkle.ts [path/to/wl.txt]
 *
 * Input  : wl.txt (or arg) — one address per line
 *          Lines starting with # or empty lines are ignored.
 *          Formats accepted:
 *            opt1p...  (bech32m, P2TR, 32-byte x-only pubkey)
 *            64-char hex  (x-only pubkey directly)
 *
 * Output : wl-root.txt          — 32-byte root as hex (set on-chain via setWLRoot)
 *          ../api/wl-proofs.json — { "opt1p..." or "0x<hex>": ["0x<u256>", ...] }
 *
 * Leaf formula: keccak256(keccak256(addr_32bytes))  — double-hash, Ethereum-compatible
 * Node formula: keccak256(sorted_concat(left, right)) — sorted-pair, same as OpenZeppelin
 */

import { readFileSync, writeFileSync } from 'fs';
import { resolve } from 'path';
import { bech32m } from 'bech32';
import { keccak_256 } from '@noble/hashes/sha3.js';

// ── helpers ──────────────────────────────────────────────────────────────────

function keccak(data: Uint8Array): Buffer {
    return Buffer.from(keccak_256(data));
}

function hashLeaf(addr32: Buffer): Buffer {
    return keccak(keccak(addr32));
}

function hashPair(a: Buffer, b: Buffer): Buffer {
    // sorted concat — deterministic regardless of insertion order
    if (Buffer.compare(a, b) <= 0) {
        return keccak(Buffer.concat([a, b]));
    } else {
        return keccak(Buffer.concat([b, a]));
    }
}

// Decode an address line → 32-byte Buffer
function decodeAddress(line: string): { raw: string; bytes: Buffer } {
    const trimmed = line.trim();

    if (trimmed.startsWith('opt1p') || trimmed.startsWith('opt1P')) {
        // bech32m P2TR — decode to get 32-byte x-only pubkey
        const decoded = bech32m.decode(trimmed, 100);
        const words   = bech32m.fromWords(decoded.words);
        // words[0] is the witness version byte; words[1:] are the 32 payload bytes
        if (words.length < 33) throw new Error(`Short bech32m decode for ${trimmed}: got ${words.length} bytes`);
        return { raw: trimmed, bytes: Buffer.from(words.slice(1)) };
    }

    if (/^[0-9a-fA-F]{64}$/.test(trimmed)) {
        return { raw: trimmed, bytes: Buffer.from(trimmed, 'hex') };
    }

    throw new Error(`Unknown address format: ${trimmed}`);
}

// ── build tree ───────────────────────────────────────────────────────────────

interface Leaf {
    raw:   string;  // original address string (key in proofs JSON)
    bytes: Buffer;  // 32-byte pubkey
    hash:  Buffer;  // keccak256(keccak256(bytes))
}

function buildMerkleTree(leaves: Leaf[]): {
    root:   Buffer;
    proofs: Map<string, Buffer[]>;
} {
    if (leaves.length === 0) throw new Error('Empty whitelist');
    if (leaves.length === 1) {
        // Single leaf — root = leaf hash, proof = []
        const proofs = new Map<string, Buffer[]>();
        proofs.set(leaves[0].raw, []);
        return { root: leaves[0].hash, proofs };
    }

    // Layer 0 = leaves (sorted by hash for determinism)
    let layer: Buffer[] = leaves.map(l => l.hash);
    const leafIndex      = new Map<string, number>(); // hash hex → index in layer
    for (let i = 0; i < layer.length; i++) {
        leafIndex.set(layer[i].toString('hex'), i);
    }

    // Map leaf raw address → proof path (accumulated through layers)
    const proofMap = new Map<string, Buffer[]>();
    for (const leaf of leaves) {
        proofMap.set(leaf.raw, []);
    }

    // Map hash hex → original raw address (to look up proof paths)
    const hashToRaw = new Map<string, string>();
    for (const leaf of leaves) {
        hashToRaw.set(leaf.hash.toString('hex'), leaf.raw);
    }

    while (layer.length > 1) {
        const nextLayer: Buffer[] = [];

        for (let i = 0; i < layer.length; i += 2) {
            const left  = layer[i];
            const right = i + 1 < layer.length ? layer[i + 1] : layer[i]; // duplicate if odd

            const parent = hashPair(left, right);
            nextLayer.push(parent);

            // Accumulate sibling proofs
            const leftRaw  = hashToRaw.get(left.toString('hex'));
            const rightRaw = i + 1 < layer.length ? hashToRaw.get(right.toString('hex')) : leftRaw;

            if (leftRaw !== undefined) {
                // sibling of left is right (but only if not duplicated)
                if (i + 1 < layer.length) {
                    proofMap.get(leftRaw)!.push(right);
                }
                hashToRaw.set(parent.toString('hex'), leftRaw);
            }
            if (rightRaw !== undefined && i + 1 < layer.length && rightRaw !== leftRaw) {
                proofMap.get(rightRaw)!.push(left);
                // The right leaf's "parent representative" is the left
                // (hashToRaw for parent already set above — prefer left's raw for the next layer traversal)
            }
        }

        // Rebuild hashToRaw for the new layer.
        // For each pair, the parent's raw address = left leaf's raw address.
        // We need to preserve path for every leaf up.  Reconstruct fully:
        const nextHashToRaw = new Map<string, string>();
        for (let i = 0; i < layer.length; i += 2) {
            const left   = layer[i];
            const right  = i + 1 < layer.length ? layer[i + 1] : layer[i];
            const parent = nextLayer[Math.floor(i / 2)];
            // Assign the left leaf's raw to the parent (arbitrary — we just need ONE valid path)
            const raw = hashToRaw.get(left.toString('hex'));
            if (raw !== undefined) nextHashToRaw.set(parent.toString('hex'), raw);
        }
        hashToRaw.clear();
        for (const [k, v] of nextHashToRaw) hashToRaw.set(k, v);

        layer = nextLayer;
    }

    return { root: layer[0], proofs: proofMap };
}

// ── encode proof for JSON ─────────────────────────────────────────────────────

// Each proof node is a 32-byte Buffer → encode as "0x<hex64>" (u256 big-endian)
function encodeProofNode(buf: Buffer): string {
    return '0x' + buf.toString('hex');
}

// ── main ─────────────────────────────────────────────────────────────────────

const inputFile  = process.argv[2] ? resolve(process.argv[2]) : resolve(__dirname, 'wl.txt');
const rootFile   = resolve(__dirname, 'wl-root.txt');
const proofsFile = resolve(__dirname, '../api/wl-proofs.json');

console.log('Reading:', inputFile);
const raw = readFileSync(inputFile, 'utf8');
const lines = raw
    .split('\n')
    .map(l => l.trim())
    .filter(l => l.length > 0 && !l.startsWith('#'));

console.log(`Addresses in file: ${lines.length}`);

const leaves: Leaf[] = [];
const seen = new Set<string>();

for (const line of lines) {
    try {
        const { raw: rawAddr, bytes } = decodeAddress(line);
        const hexKey = bytes.toString('hex');
        if (seen.has(hexKey)) {
            console.warn(`  DUPLICATE skipped: ${line}`);
            continue;
        }
        seen.add(hexKey);
        leaves.push({ raw: rawAddr, bytes, hash: hashLeaf(bytes) });
    } catch (e: any) {
        console.warn(`  SKIP (${e.message}): ${line}`);
    }
}

console.log(`Valid unique addresses: ${leaves.length}`);
if (leaves.length === 0) {
    console.error('ERROR: no valid addresses found');
    process.exit(1);
}

const { root, proofs } = buildMerkleTree(leaves);

// Write root
writeFileSync(rootFile, root.toString('hex'), 'utf8');
console.log('\nMerkle root:', root.toString('hex'));
console.log('Written to:', rootFile);

// Write proofs JSON: { "<xonly_hex_32bytes>": ["0x<hex>", ...] }
// Keyed by 64-char hex (x-only pubkey) for easy frontend lookup via walletPubKey
const proofsJson: Record<string, string[]> = {};
for (const leaf of leaves) {
    const hexKey = leaf.bytes.toString('hex'); // 64-char x-only pubkey
    const nodes  = proofs.get(leaf.raw)!;
    proofsJson[hexKey] = nodes.map(encodeProofNode);
}
writeFileSync(proofsFile, JSON.stringify(proofsJson, null, 2), 'utf8');
console.log('Proofs written to:', proofsFile);
console.log('\nDone! Next steps:');
console.log('  1. Deploy the new contract: OPNET_MNEMONIC="..." npx tsx deploy.ts');
console.log('  2. Set WL root + start mint: OPNET_MNEMONIC="..." npx tsx init-wl.ts <contractAddr>');
