# Dopamilio — Project Context

## What this is
Dopamilio is an OP-721 NFT collection on Bitcoin L1 (OPNet testnet).
3,333 supply. Mint price: 6,969 sats. Max 5 per wallet.
Live at: https://dopamilio.vercel.app

## Folder structure
```
dopamilio/
├── index.html           ← the entire site (HTML/CSS/JS, single file)
├── vercel.json          ← Vercel config + cache headers
├── gallery-lore.js      ← lore engine (loaded by index.html)
├── gallery-card.js      ← card terminal renderer (loaded by index.html)
├── api/
│   ├── nft.js           ← metadata serverless endpoint
│   └── attrs.json       ← compact attributes for all 3333 NFTs
├── memes_mlg/           ← MLG webp sticker images + audio
├── nft_preview/         ← preview webp images
├── fonts/               ← woff2 font files
├── contracts/           ← AssemblyScript OP-721 contract
│   ├── op721/           ← DopamilioNFT.ts source
│   ├── build/           ← compiled DopamilioNFT.wasm
│   ├── abis/            ← ABI JSON/TS files
│   ├── deploy.ts        ← deploy script
│   └── setup-v2.ts      ← post-deploy verification
└── progress_images.json ← Pinata CID map for all 3333 tokens
```

## Deploy
```bash
git add . && git push   # Vercel auto-deploys on push
# or manual:
vercel deploy --prod --yes
```

## Contract
- **Address (CURRENT): opt1sqqrad2ryuul9wcl0qcrufndqsns6ezqwtgpaznda**
- Funding TX: bca5ecfc82f0170f5c561b0a514024de357ce526bcdc6e2d3ba1d5317ca6531c
- Reveal TX:  4f48cb557fa1c76b94d559976ee7807c632c3f62c7138a8b1b09898a2dc3e405
- BaseURI: https://dopamilio.vercel.app/api/metadata
- Icon:    https://dopamilio.vercel.app/icon.png
- Banner:  https://dopamilio.vercel.app/banner.png
- Standard: OP-721 | Network: OPNet testnet (Bitcoin L1)
- MAX_SUPPLY = 3333 | MINT_PRICE = 6969 sats | MAX_MINT_PUBLIC = 5

## Contract deploy workflow
```bash
cd contracts
npm run build && npm run verify   # must print schnorr_gone=true chainErr_gone=true
OPNET_MNEMONIC="..." npx tsx deploy.ts
OPNET_MNEMONIC="..." npx tsx setup-v2.ts <addr>
# Update CONTRACT_ADDR in index.html, then git push
```

## Critical rules — NEVER touch
- mint() function logic
- MINT_PRICE_SATS, MAX_MINT_PUBLIC, MAX_SUPPLY constants
- CONTRACT_ADDR in index.html
- Any wallet/RPC/OPNet connection logic
- Any ABI references

## Rarity tiers
| Tier       | Ranks      | Count | Color     |
|------------|------------|-------|-----------|
| Mythic     | 1–10       | 10    | #f43f5e   |
| Legendary  | 11–68      | 58    | #c8a84b   |
| Epic       | 69–278     | 210   | #b44aff   |
| Rare       | 279–698    | 420   | #4488ff   |
| Uncommon   | 699–1667   | 969   | #00ff41   |
| Common     | 1668–3333  | 1666  | #888888   |

## Key JS functions in index.html
- `_dopaGet(id)` → returns {rank, tier, tierIdx, traits, traitPct} for NFT id
- `openNftDetail(id)` → opens the gallery modal
- `_setSoldOut(flag)` → controls sold-out overlay
- `updateProg(n)` → updates mint progress bar

## Metadata
- Images: Pinata IPFS — https://chocolate-decisive-silverfish-606.mypinata.cloud/ipfs/{CID}
- CID map: progress_images.json (per-token, 3333 entries)
- API: /api/metadata/:id → nft.js reads attrs.json + progress_images.json, returns full JSON
- 'Acessories' typo is INTENTIONAL — never correct it

## Important notes
- Metadata and images folders are local only — NOT in repo, NOT deployed
- All 3333 rarity scores are pre-computed and embedded in index.html
