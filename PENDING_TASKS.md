# Pending Tasks — Dopamilio (próximo agente)

> Atualizado em 2026-03-26. Tudo abaixo ainda está pendente.
> Repo: github.com/Dopamilio/Dopamilio — push para main = deploy automático Vercel.
> Working dir: C:/Users/peluc/dopamilio/
> Arquivo principal: index.html (single-file site, ~480KB)

---

## O QUE JÁ FOI FEITO (não refazer)
- Contract roast messages: "NGMI anon — ur not on the list..." e "greedy anon — 3 is enough..."
- Phase buttons: pointer-events:none (read-only)
- Livebar ticker: race condition corrigida com _tickerLastRender + wait de 28s
- Sniper image: trocado para ./memes_mlg/quickscope.png
- Sniper audio: playbackRate=2.5
- TX hash: fallback receipt?.transactionId || receipt?.hash || receipt?.txid || ''
- Wallet 0x display: placeholder "opt1..XXXX"
- Marketplace bottom bar: bottom:var(--ticker-h,33px)
- Mobile: canvas/scanlines/crt desativados, sniper centralizado, touch-action

---

## PENDENTE 1 — Wallet display 0x → opt1 real (MAIS URGENTE)

**Problema:** `window.opnet.requestAccounts()` retorna `0x898b4580...` (hex 64 chars = 32 bytes MLDSA identity) em vez de endereço bech32. O display atual mostra `opt1..e214` (placeholder incorreto).

**Fix necessário:** Implementar encoder bech32m inline no JS para converter 0x hex → `opt1...` real.

Network: `bech32:'opt'`, witness version=1 (P2TR-like), 32-byte payload.

```javascript
// Adicionar esta função no index.html (antes da função doConnect):
function _hexToOpnet(hex) {
  hex = hex.replace(/^0x/,'');
  if (hex.length !== 64) return hex;
  var bytes = [];
  for (var i=0;i<64;i+=2) bytes.push(parseInt(hex.substr(i,2),16));
  var ALPHABET='qpzry9x8gf2tvdw0s3jn54khce6mua7l';
  var BECH32M_CONST=0x2bc830a3;
  function poly(v){var c=1;for(var i=0;i<v.length;i++){var d=c>>25;c=((c&0x1ffffff)<<5)^v[i];if(d&1)c^=0x3b6a57b2;if(d&2)c^=0x26508e6d;if(d&4)c^=0x1ea119fa;if(d&8)c^=0x3d4233dd;if(d&16)c^=0x2a1462b3;}return c;}
  function hrpExp(hrp){var r=[];for(var i=0;i<hrp.length;i++)r.push(hrp.charCodeAt(i)>>5);r.push(0);for(var i=0;i<hrp.length;i++)r.push(hrp.charCodeAt(i)&31);return r;}
  function conv(data,from,to,pad){var acc=0,bits=0,ret=[],maxv=(1<<to)-1;for(var i=0;i<data.length;i++){acc=(acc<<from)|data[i];bits+=from;while(bits>=to){bits-=to;ret.push((acc>>bits)&maxv);}}if(pad&&bits)ret.push((acc<<(to-bits))&maxv);return ret;}
  var hrp='opt';
  var data=[1].concat(conv(bytes,8,5,true));
  var values=hrpExp(hrp).concat(data).concat([0,0,0,0,0,0]);
  var mod=poly(values)^BECH32M_CONST;
  var cs=[];for(var i=0;i<6;i++)cs.push((mod>>(5*(5-i)))&31);
  var enc='';for(var i=0;i<data.length;i++)enc+=ALPHABET[data[i]];
  for(var i=0;i<6;i++)enc+=ALPHABET[cs[i]];
  return hrp+'1'+enc;
}
```

Depois no `doConnect()`, substituir:
```javascript
// ATUAL (linha ~2525):
const _addrDisp=walletAddr.startsWith('0x')?('opt1..'+walletAddr.slice(-6)):walletAddr;
const disp  = _addrDisp.slice(0,10)+'...'+_addrDisp.slice(-5);

// CORRETO:
const _addrDisp=walletAddr.startsWith('0x')?_hexToOpnet(walletAddr):walletAddr;
const disp  = _addrDisp.slice(0,10)+'...'+_addrDisp.slice(-5);
```

---

## PENDENTE 2 — Mobile: testes e ajustes finos

**Base já feita:** canvas/scanlines/crt desativados em mobile, touch-action.

**O que ainda pode estar quebrando no mobile:**
- Sticker physics (animStickers) ainda roda em mobile — desativar:
  Encontrar onde `animStickers` / `requestAnimationFrame(animStickers)` é chamado e adicionar check `if(window.innerWidth<=720)return;` no início da função
- Matrix rain (bg-canvas) pode ainda inicializar — adicionar `if(window.innerWidth<=720)return;` no início do callback do bg-canvas (linha ~2243)
- Nav overflow em telas muito pequenas — verificar se `.center-nav` e `.nav-right` ficam sobrepostos
- Mint card: verificar se o card de mint fica usável (botão MINT NOW visível acima da livebar)
- Testar: sniper overlay não cobre botões críticos em mobile
- Gallery modal: verificar se `.nft-detail-card` fecha corretamente no mobile

**Regras:** não quebrar desktop, apenas condicionais `if(isMobile)` ou CSS `@media`.

---

## PENDENTE 3 — Contrato: recompilar WASM com roast messages

Os roast messages foram alterados no `.ts` mas o WASM deployado ainda tem as mensagens antigas.
O contrato ATUAL deployado em testnet é `opt1sqrurzx45lsdm62q0ejjhru55kukj253a7u60xmgx`.

Para aplicar os roasts:
```bash
cd C:/Users/peluc/dopamilio/contracts
npm run build
# Verificar que compila sem erros
# DEPOIS: deploy novo contrato + init-wl novamente (testnet)
# OU aguardar mainnet deploy onde tudo será refeito do zero
```

**Nota:** Os roast messages só aparecem quando o contrato for re-deployado. No contrato atual deployado, as mensagens ainda são "DopamilioNFT: not in whitelist" etc. Para testnet isso é baixa prioridade. Para mainnet será feito no deploy final.

---

## REGRAS CRÍTICAS (nunca violar)
- NÃO alterar: `mint()`, `CONTRACT_ADDR`, ABI, lógica de signing, `doMint()` (exceto display)
- NÃO subir mnemonic em nenhum arquivo
- NÃO mudar `MINT_PRICE_SATS`, `MAX_SUPPLY`, `MAX_MINT`
- Commit e push para `main` após cada fix (Vercel auto-deploy)
- Working dir sempre: `C:/Users/peluc/dopamilio/`
- Git remote: `github.com/Dopamilio/Dopamilio`
