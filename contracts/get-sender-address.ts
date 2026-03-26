/**
 * get-sender-address.ts — Show deployer's 32-byte OPNet sender address
 *
 * Usage (from contracts/ folder):
 *   OPNET_MNEMONIC="..." npx tsx get-sender-address.ts
 *
 * Output: the hex string to add to wl.txt so the deployer can mint during WL phase.
 */
import { networks } from '@btc-vision/bitcoin';
import { Mnemonic, MLDSASecurityLevel, AddressTypes } from '@btc-vision/transaction';

const NETWORK = networks.opnetTestnet;

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) {
    console.error('ERROR: set OPNET_MNEMONIC env var');
    process.exit(1);
}

const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2WPKH, 0);

// P2TR pubkey = 32-byte x-only tweaked pubkey (what Blockchain.tx.sender returns in-contract)
const pubkey = wallet.keypair.publicKey as Uint8Array;
// P2TR x-only pubkey: strip the 0x02/0x03 prefix byte → 32 bytes
const xOnlyPubkey = pubkey.length === 33 ? pubkey.slice(1) : pubkey;
const xOnlyHex = Buffer.from(xOnlyPubkey).toString('hex');

console.log('');
console.log('Deployer P2TR (Bitcoin addr):', wallet.p2tr);
console.log('Deployer OPNet address      :', wallet.address.toString());
console.log('');
console.log('32-byte x-only pubkey (hex) — ADD THIS LINE TO wl.txt:');
console.log(xOnlyHex);
console.log('');
console.log('Copy the hex line above and add it to contracts/wl.txt');
