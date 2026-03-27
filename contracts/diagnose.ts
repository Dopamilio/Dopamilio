import { networks } from '@btc-vision/bitcoin';
import { ABIDataTypes, Mnemonic, MLDSASecurityLevel, AddressTypes, Address } from '@btc-vision/transaction';
import { BitcoinAbiTypes, getContract, JSONRpcProvider } from 'opnet';

const IS_MAINNET = process.argv.includes('--mainnet');
const NETWORK    = IS_MAINNET ? networks.bitcoin : networks.opnetTestnet;
const RPC_URL    = IS_MAINNET ? 'https://mainnet.opnet.org' : 'https://testnet.opnet.org';
const mn = new Mnemonic(process.env.OPNET_MNEMONIC!, '', NETWORK, MLDSASecurityLevel.LEVEL1);
const w  = mn.deriveOPWallet(AddressTypes.P2TR, 0);
const hex = (b: Uint8Array) => Array.from(b).map(x => x.toString(16).padStart(2,'0')).join('');
const sender = Address.fromString(w.address.toString(), hex(w.keypair.publicKey as Uint8Array));
const provider = new JSONRpcProvider({ url: RPC_URL, network: NETWORK });

const CONTRACT_ARG = process.argv.find(a => a.startsWith('bc1') || a.startsWith('opt1')) || '';
if (!CONTRACT_ARG) { console.error('Usage: OPNET_MNEMONIC="..." npx tsx diagnose.ts <contractAddr> [--mainnet]'); process.exit(1); }

const ABI = [
    { name:'getPhase',      inputs:[], outputs:[{name:'phase',     type:ABIDataTypes.UINT8}],   type: BitcoinAbiTypes.Function },
    { name:'getStartTime',  inputs:[], outputs:[{name:'startTime', type:ABIDataTypes.UINT256}],  type: BitcoinAbiTypes.Function },
    { name:'getIsTestnet',  inputs:[], outputs:[{name:'isTestnet', type:ABIDataTypes.BOOL}],     type: BitcoinAbiTypes.Function },
    { name:'getWlDuration', inputs:[], outputs:[{name:'dur',       type:ABIDataTypes.UINT64}],   type: BitcoinAbiTypes.Function },
];

const c = getContract(CONTRACT_ARG, ABI, provider, NETWORK, sender);

async function main() {
    const [ph, st, rt, it, wd] = await Promise.all([
        (c as any).getPhase(),
        (c as any).getStartTime(),
        (c as any).getWLRoot(),
        (c as any).getIsTestnet(),
        (c as any).getWlDuration(),
    ]);

    const phase     = Number(ph.properties?.phase ?? ph);
    const startTime = BigInt(st.properties?.startTime ?? 0n);
    const root      = BigInt(rt.properties?.root ?? 0n).toString(16).padStart(64, '0');
    const isTestnet = Boolean(it.properties?.isTestnet ?? it);
    const wlDur     = BigInt(wd.properties?.dur ?? 0n);
    const nowSecs   = BigInt(Math.floor(Date.now() / 1000));
    const elapsed   = startTime > 0n ? nowSecs - startTime : 0n;

    console.log('Phase       :', phase, '(0=NOT_STARTED 1=TEAM 2=WL 3=PUBLIC)');
    console.log('StartTime   :', startTime.toString(), '(unix secs)');
    console.log('WL Root     :', root);
    console.log('IsTestnet   :', isTestnet);
    console.log('WL Duration :', wlDur.toString(), 'secs =', (Number(wlDur) / 86400).toFixed(1), 'days');
    console.log('Now (JS)    :', nowSecs.toString());
    console.log('Elapsed     :', elapsed.toString(), 'secs =', (Number(elapsed) / 3600).toFixed(1), 'hours');
    if (startTime > 0n) {
        console.log('WL ends at  :', (startTime + wlDur).toString());
        console.log('WL active?  :', elapsed < wlDur ? 'YES' : 'NO — already PUBLIC');
    }
}

main().catch(e => { console.error(e?.message ?? e); process.exit(1); });
