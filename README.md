# DOPAMILIO

**3,333 unique degenerates etched on Bitcoin.**
100% on-chain. Pure dopamine.

---

## THE COLLECTION

> *When the charts are red, the dopamine hits harder.*

3,333 algorithmically generated NFTs living on Bitcoin L1 via OPNet.
Not on Ethereum. Not on Solana. **On Bitcoin.**
Immutable. Censorship-resistant. Based.

| Stat | Value |
|------|-------|
| Supply | 3,333 |
| Mint Price | 6,969 sats |
| Max per wallet | 5 |
| Standard | OP-721 |
| Network | Bitcoin L1 (OPNet) |
| Contract | `opt1sqqrad2ryuul9wcl0qcrufndqsns6ezqwtgpaznda` |

---

## RARITY

| Tier | Supply | Odds |
|------|--------|------|
| MYTHIC | 10 | 0.3% |
| LEGENDARY | 58 | 1.7% |
| EPIC | 210 | 6.3% |
| RARE | 420 | 12.6% |
| UNCOMMON | 969 | 29.1% |
| COMMON | 1,666 | 50.0% |

11 traits. 1 winner. Your serotonin depends on it.

---

## MINT

**[dopamilio.vercel.app](https://dopamilio.vercel.app)**

Connect OPWallet → set amount → mint.
That's it. No roadmap. No Discord drama. No promises.
Just 3,333 degenerates etched on the hardest money ever created.

---

## TECH STACK

- **Contract** — AssemblyScript compiled to WASM, deployed on OPNet Bitcoin L1
- **Standard** — OP-721 (Bitcoin-native NFT standard)
- **Metadata** — Served via Vercel serverless API
- **Images** — Pinata IPFS (permanent)
- **Frontend** — Single-file HTML/CSS/JS, no frameworks, no bloat

---

## STRUCTURE

```
contracts/
  op721/DopamilioNFT.ts   — contract source
  build/DopamilioNFT.wasm — compiled bytecode
  deploy.ts               — deployment script
  setup-v2.ts             — post-deploy setup

api/
  nft.js                  — metadata endpoint (/api/metadata/:id)
  attrs.json              — trait data for all 3,333 tokens

index.html                — the entire mint site
```

---

## DEPLOY

```bash
# Contract
cd contracts
npm run build && npm run verify
OPNET_MNEMONIC="..." npx tsx deploy.ts

# Frontend
git push   # auto-deploys to Vercel
```

---

## LICENSE

Do whatever you want. It's on Bitcoin. It's permanent. You can't stop it.

---

*Built on OPNet — Bitcoin-native smart contracts.*
