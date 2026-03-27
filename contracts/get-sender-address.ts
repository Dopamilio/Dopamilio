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

const IS_MAINNET = process.argv.includes('--mainnet');
const NETWORK    = IS_MAINNET ? networks.bitcoin : networks.opnetTestnet;

const mnemonic = process.env.OPNET_MNEMONIC;
if (!mnemonic) {
    console.error('ERROR: set OPNET_MNEMONIC env var');
    process.exit(1);
}

const mnemonicObj = new Mnemonic(mnemonic!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const wallet      = mnemonicObj.deriveOPWallet(AddressTypes.P2TR, 0);

// P2TR pubkey = 32-byte x-only tweaked pubkey (what Blockchain.tx.sender returns in-contract)
const pubkey = wallet.keypair.publicKey as Uint8Array;
// OPNet identity = wallet.address (32 bytes) — this is what Blockchain.tx.sender returns
const opnetAddr = wallet.address.toString(); // "0x<64hex>"
const addrHex = opnetAddr.replace(/^0x/, '');

console.log('');
console.log('Deployer P2TR (Bitcoin addr):', wallet.p2tr);
console.log('Deployer OPNet identity     :', opnetAddr);
console.log('');
console.log('ADD THIS LINE TO contracts/wl.txt:');
console.log(addrHex);
console.log('');
console.log('Copy the hex line above and add it to contracts/wl.txt');
