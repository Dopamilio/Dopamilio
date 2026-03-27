# Dopamilio — Project Context

## What this is
Dopamilio is an OP-721 NFT collection on Bitcoin L1 (OPNet mainnet).
3,333 supply. Mint price: 6,969 sats. WL: max 5/wallet. Public: max 3/wallet.
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
- **Address: 0xd3d2a7f92284b5d1e300675d6a944adca21a3feced25dd23e6c3565232d87d3a**
- Deployer: bc1pr0hqrfe2gl0dpaq4epx0ac7f35vgfayh09snnvv5u4nt64lx7xgqx62pd6
- Treasury: bc1pn7zlq5qmzagmnwfc9nwa9387qc6cnxwd6g2r74sl43xzvx446p7sptgpj0
- BaseURI: https://dopamilio.vercel.app/api/metadata
- Icon:    https://dopamilio.vercel.app/icon.png
- Banner:  https://dopamilio.vercel.app/banner.png
- Standard: OP-721 | Network: OPNet mainnet (Bitcoin L1)
- MAX_SUPPLY = 3333 | MINT_PRICE = 6969 sats | WL = max 5 | PUBLIC = max 3

## Contract deploy workflow (mainnet)
```bash
cd contracts
npm run build && npm run verify   # must print schnorr_gone=true chainErr_gone=true
OPNET_MNEMONIC="..." npx tsx deploy.ts --mainnet
# Save CONTRACT_ADDR + deploy block from output
OPNET_MNEMONIC="..." npx tsx activate-team.ts <addr> --mainnet
OPNET_MNEMONIC="..." npx tsx team-mint.ts <addr> 10 --mainnet
OPNET_MNEMONIC="..." npx tsx activate-wl.ts <addr> --mainnet
# After 1.5h WL window:
OPNET_MNEMONIC="..." npx tsx activate-public.ts <addr> --mainnet
# Update CONTRACT_ADDR + _DEPLOY_BLOCK in index.html, then git push
```

## Critical rules — NEVER touch
- mint() function logic
- MINT_PRICE_SATS, MAX_SUPPLY constants
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
