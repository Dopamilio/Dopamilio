```
██████╗  ██████╗ ██████╗  █████╗ ███╗   ███╗██╗██╗     ██╗ ██████╗
██╔══██╗██╔═══██╗██╔══██╗██╔══██╗████╗ ████║██║██║     ██║██╔═══██╗
██║  ██║██║   ██║██████╔╝███████║██╔████╔██║██║██║     ██║██║   ██║
██║  ██║██║   ██║██╔═══╝ ██╔══██║██║╚██╔╝██║██║██║     ██║██║   ██║
██████╔╝╚██████╔╝██║     ██║  ██║██║ ╚═╝ ██║██║███████╗██║╚██████╔╝
╚═════╝  ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚═╝ ╚═════╝
```

> *3,333 unique degenerates. Etched on Bitcoin. Fueled by dopamine.*

[![Bitcoin](https://img.shields.io/badge/Bitcoin-L1-orange?style=flat-square&logo=bitcoin)](https://bitcoin.org)
[![OPNet](https://img.shields.io/badge/OPNet-OP--721-green?style=flat-square)](https://opnet.org)
[![Supply](https://img.shields.io/badge/Supply-3%2C333-red?style=flat-square)](https://dopamilio.xyz)
[![Price](https://img.shields.io/badge/Mint-6%2C969_sats-yellow?style=flat-square)](https://dopamilio.xyz)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue?style=flat-square)](LICENSE)

---

```
dopamilio@bitcoin:~/$ whoami
> a degen. a trader. a meme. an nft on bitcoin.

dopamilio@bitcoin:~/$ cat manifesto.txt
> not on ethereum. not on solana. ON BITCOIN.
> immutable. censorship-resistant. permanently cooked.
> 3,333 souls addicted to the loop.
> click. flip. profit. repeat.
```

---

## THE COLLECTION

When the charts are red, the dopamine hits harder.

Born in the trenches. Wired for infinite grind. These mfs live for one thing: the next hit.

| Stat | Value |
|------|-------|
| Supply | 3,333 |
| Mint Price | 6,969 sats |
| Max per wallet | 5 (WL: 3) |
| Standard | OP-721 |
| Network | Bitcoin L1 (OPNet) |
| Mint | [dopamilio.xyz](https://dopamilio.xyz) |

---

## RARITY

```
MYTHIC     ░░░░░░░░░░   10   (0.30%)   — touched by satoshi
LEGENDARY  ░░░░░░░░░░   58   (1.74%)   — called the top. was right.
EPIC       ░░░░░░░░░░  210   (6.30%)   — different type of degen
RARE       ░░░░░░░░░░  420  (12.60%)   — been in the trenches
UNCOMMON   ░░░░░░░░░░  969  (29.07%)   — eyes open when others panic sold
COMMON     ░░░░░░░░░░ 1666  (49.99%)   — gm. still here.
```

---

## TECH STACK

```
Bitcoin L1              ← the only chain that matters
OPNet                   ← smart contracts on bitcoin. yes really.
OP-721                  ← NFT standard. not ERC-721. cope.
AssemblyScript → WASM   ← compiled to run on bitcoin nodes
Vercel                  ← frontend. single html file. based.
Pinata IPFS             ← images. immutable. forever.
```

---

## CONTRACT

```
Standard  : OP-721
Phases    : TEAM (1d) → WL (1.5h) → PUBLIC (∞ until sold out)
WL        : Merkle tree — 3 per wallet
Public    : 5 per wallet
```

---

## REPO STRUCTURE

```
dopamilio/
├── index.html               ← the ENTIRE site. one file. 500KB of pure addiction.
├── gallery-card.js          ← card detail terminal renderer
├── gallery-lore.js          ← lore engine — 1000+ unique phrases
├── vercel.json              ← deploy config + CSP headers
├── mainnet.md               ← mainnet switch guide (read before launching)
├── scripts/
│   └── switch-to-mainnet.sh ← one command to rule them all
├── api/
│   ├── nft.js               ← metadata endpoint /api/metadata/:id
│   ├── quotes.js            ← livebar market data (Twelve Data)
│   ├── proof.js             ← WL merkle proof endpoint
│   └── attrs.json           ← trait data for all 3,333 tokens
├── contracts/
│   ├── op721/DopamilioNFT.ts   ← the contract. do not touch mint().
│   ├── build/DopamilioNFT.wasm ← compiled. don't touch this either.
│   ├── deploy.ts            ← deploy script
│   ├── init-wl.ts           ← initialize WL phase on-chain
│   ├── generate-merkle.ts   ← generate WL merkle tree
│   └── setup-v2.ts          ← post-deploy verification
├── memes_mlg/               ← the culture. do NOT remove.
├── nft_preview/             ← preview images (sample only)
├── fonts/                   ← woff2 fonts. cached forever.
└── progress_images.json     ← Pinata CID map for all 3,333 tokens
```

---

## DEPLOY

```bash
# Frontend — auto-deploys on push
git push   # that's it. vercel handles the rest.

# Contract (mainnet)
cd contracts
npm run build && npm run verify
OPNET_MNEMONIC="..." npx tsx deploy.ts

# Switch frontend to mainnet
bash scripts/switch-to-mainnet.sh <CONTRACT_ADDR> <CONTRACT_P2TR> <DEPLOY_BLOCK>
git add index.html vercel.json && git push
```

---

## RULES

```
✓  mint() is sacred. never touch it.
✓  MINT_PRICE_SATS = 6969. forever.
✓  MAX_SUPPLY = 3333. not 3334.
✓  'Acessories' typo is intentional. it stays.
✗  no mnemonic in any file. ever.
✗  no mainnet deploy without reading mainnet.md first
```

---

```
dopamilio@bitcoin:~/$ uptime
> since the genesis block. still running.

dopamilio@bitcoin:~/$ exit
> you can't. the dopamine won't let you.
```

---

*Built on OPNet. Permanent on Bitcoin. Yours forever.*
