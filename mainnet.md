# Mainnet Switch Guide — Dopamilio

> Run `bash scripts/switch-to-mainnet.sh <CONTRACT_ADDR> <CONTRACT_P2TR> <DEPLOY_BLOCK>` to apply all frontend changes automatically.
> Then follow the manual checklist below.

---

## 1. Contract Deployment

```bash
cd contracts
npm run build        # recompile WASM with mainnet durations
npm run verify       # must print schnorr_gone=true chainErr_gone=true

# Deploy on mainnet (networks.bitcoin)
OPNET_MNEMONIC="..." npx tsx deploy.ts

# Save the output:
# CONTRACT_ADDR = opt1s...
# CONTRACT_P2TR = opt1p...   (deployer's P2TR, used as refundTo)
# DEPLOY_BLOCK  = 0x...      (block number from receipt)
```

## 2. WL Setup

```bash
# Before init-wl: collect MLDSA identity hex from all WL holders
# Each holder runs in their OP_Wallet: window.opnet.requestAccounts() → copy the 0x hex

# Edit wl.txt — replace opt1p... entries with real MLDSA hex (64 chars)
# Then regenerate Merkle tree:
cd contracts
npx tsx generate-merkle.ts

# Initialize WL on-chain:
OPNET_MNEMONIC="..." npx tsx init-wl.ts <CONTRACT_ADDR>
```

## 3. Frontend Constants (index.html — auto-applied by switch-to-mainnet.sh)

| Constant | Testnet value | Mainnet value |
|----------|--------------|---------------|
| `CONTRACT_ADDR` | `opt1sqrurzx45lsdm62q0ejjhru55kukj253a7u60xmgx` | `<new contract address>` |
| `CONTRACT_P2TR` | `opt1pv5z0n6gn0n8szljp7dewl52548zyvt48pt406cl607wen22amalqfpft8p` | `bc1pn7zlq5qmzagmnwfc9nwa9387qc6cnxwd6g2r74sl43xzvx446p7sptgpj0` |
| `RPC_URL` | `https://testnet.opnet.org` | `https://mainnet.opnet.org` |
| `NETWORK_OBJ` | `{bech32:'opt',…testnet…}` | `{bech32:'bc',…mainnet…}` |
| `OPSCAN_QUERY` | `?network=op_testnet` | `` (empty string) |
| `_DEPLOY_BLOCK` | `0x28e5` | `<block from deploy receipt>` |

## 4. NETWORK_OBJ Exact Replacement

In index.html find:
```javascript
const NETWORK_OBJ = {bech32:'opt',pubKeyHash:0x60,scriptHash:0x55,wif:0x80,
  ...networks.opnetTestnet,
  isTestnet:true};
```
Replace with:
```javascript
const NETWORK_OBJ = {bech32:'bc',pubKeyHash:0x00,scriptHash:0x05,wif:0x80,
  ...networks.bitcoin,
  isTestnet:false};
```

## 5. Contract Source — TREASURY

In `contracts/op721/DopamilioNFT.ts` change:
```typescript
const TREASURY: string = 'opt1pv5z0n6gn0n8szljp7dewl52548zyvt48pt406cl607wen22amalqfpft8p';
```
To:
```typescript
const TREASURY: string = 'bc1pn7zlq5qmzagmnwfc9nwa9387qc6cnxwd6g2r74sl43xzvx446p7sptgpj0';
```
Then `npm run build` and `npm run verify`.

## 6. vercel.json — Verify CSP

Confirm `connect-src` contains `https://mainnet.opnet.org` (already added in this PR).

## 7. Vercel Domain

Confirm `dopamilio.xyz` custom domain is linked to the Vercel project.
The CORS origin in `api/quotes.js` is already set to `https://dopamilio.xyz`.

## 8. Deploy Sequence

```bash
# 1. Apply frontend mainnet config:
bash scripts/switch-to-mainnet.sh <CONTRACT_ADDR> <CONTRACT_P2TR> <DEPLOY_BLOCK>

# 2. Commit and push:
git add index.html
git commit -m "feat: switch to mainnet — <CONTRACT_ADDR>"
git push  # Vercel auto-deploys

# 3. Verify live site at https://dopamilio.xyz
# 4. Run init-wl.ts to activate WL phase
```

## 9. Post-deploy Verification Checklist

- [ ] Wallet connects and shows `bc1...` or `opt1...` address
- [ ] Mint price shows 6,969 sats
- [ ] Phase shows TEAM (transitions to WL after 1 day)
- [ ] `/api/metadata/1` returns `"name":"Dopamilio #1"` with correct IPFS image
- [ ] No CSP errors in browser console
- [ ] Gallery loads NFT images from Pinata
- [ ] Sound button works
- [ ] OPScan link opens correct transaction (no `?network=op_testnet`)
