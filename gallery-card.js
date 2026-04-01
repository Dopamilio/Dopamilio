'use strict';
// Dopamilio — Premium Card Detail + Floating Terminal

var RARITY_COLORS_CARD = {
  Common:    { hex: '#9CA3AF', rgb: '156,163,175' },
  Uncommon:  { hex: '#4ADE80', rgb: '74,222,128'  },
  Rare:      { hex: '#60A5FA', rgb: '96,165,250'  },
  Epic:      { hex: '#A78BFA', rgb: '167,139,250' },
  Legendary: { hex: '#F59E0B', rgb: '245,158,11'  },
  Mythic:    { hex: '#F43F5E', rgb: '244,63,94'   },
};

// ─── FLOATING TERMINAL ───────────────────────────────────────────────────────
var _termTimeouts = [];

function _termClear() {
  _termTimeouts.forEach(clearTimeout);
  _termTimeouts = [];
  var el = document.getElementById('cardTerminalFloat');
  if (el) { el.innerHTML = ''; el.style.display = 'none'; }
}

function _termPlay(lines, color, rgb) {
  _termClear();
  var el = document.getElementById('cardTerminalFloat');
  if (!el) return;
  el.style.setProperty('--ctf-color', color);
  el.style.setProperty('--ctf-rgb', rgb);
  el.style.display = 'flex';

  var lineIndex = 0;
  var charIndex = 0;
  var currentSpan = null;

  // Cursor element
  var cursor = document.createElement('span');
  cursor.className = 'ctf-cursor';

  function nextChar() {
    if (lineIndex >= lines.length) {
      el.appendChild(cursor);
      return;
    }
    var line = lines[lineIndex];

    if (!currentSpan) {
      currentSpan = document.createElement('span');
      currentSpan.className = 'ctf-line';
      el.appendChild(currentSpan);
    }

    if (charIndex < line.length) {
      currentSpan.textContent += line[charIndex];
      charIndex++;
      // Speed: 6ms per char (fast, live terminal — 50% faster)
      _termTimeouts.push(setTimeout(nextChar, 6));
    } else {
      // End of line — 40ms pause before next
      charIndex = 0;
      currentSpan = null;
      lineIndex++;
      _termTimeouts.push(setTimeout(nextChar, 40));
    }
  }

  nextChar();
}

function _buildTerminalLines(nft, lore) {
  var t = nft.traits || {};
  var p = nft.traitPct || {};
  var lines = [
    '> seek --nft ' + nft.id,
    '',
    'rank: #' + nft.rank + ' / 3333',
    '',
    '"' + lore.phrase + '"',
    '',
  ];

  // Always show all 8 required traits; display "none" if missing
  var SHOW = ['Background','Classes','Eyes','Eye Brows','Cloths','Hair','Mouths','Head gear','Weapons','Specials','Acessories'];
  var traitLines = [];
  SHOW.forEach(function(k) {
    var v = t[k];
    var isNone = !v || v === 'None';
    var pct = (!isNone && p[k] != null) ? ' ' + p[k].toFixed(1) + '%' : '';
    var label = k.padEnd(12, ' ').slice(0, 12);
    var val = isNone ? 'none' : (v.length > 28 ? v.slice(0, 27) + '\u2026' : v);
    traitLines.push(label + ' ' + val + pct);
  });

  if (traitLines.length) {
    lines.push('\u2500\u2500 traits \u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500');
    traitLines.forEach(function(l) { lines.push(l); });
    lines.push('\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500');
    lines.push('');
  }

  lines.push('sats: ' + lore.satsWallet.toLocaleString());
  lines.push('role: ' + lore.role);
  lines.push('mood: ' + lore.personality);

  return lines;
}

// ─── CARD DETAIL ─────────────────────────────────────────────────────────────
function buildCardDetail(nft, lore) {
  var color = lore.rarityColor;
  var rgb   = lore.rarityRgb;

  var wrap = document.createElement('div');
  wrap.className = 'card-detail';
  wrap.style.setProperty('--rarity-color', color);
  wrap.style.setProperty('--rarity-rgb', rgb);
  wrap.dataset.tier = nft.tier;

  // Image
  var imgWrap = document.createElement('div');
  imgWrap.className = 'cd-img';
  var img = document.createElement('img');
  // Try nft_preview if available, else placeholder
  var previewIds = [1,2,3,4,5,6,14,57];
  if (window._getImgUrl && window._imgCids && window._imgCids[String(nft.id)]) {
    img.src = window._getImgUrl(nft.id);
  } else if (previewIds.indexOf(nft.id) !== -1) {
    img.src = 'nft_preview/' + nft.id + '.webp';
  } else {
    // colorized SVG placeholder with id number
    img.src = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='280' height='280'%3E%3Crect width='280' height='280' fill='%230a0c14'/%3E%3Ctext x='140' y='148' text-anchor='middle' font-family='monospace' font-size='22' fill='" + encodeURIComponent(color) + "'%3E%23" + nft.id + "%3C/text%3E%3C/svg%3E";
  }
  img.alt = 'Dopamilio #' + nft.id;
  img.width = 280;
  img.height = 280;
  imgWrap.appendChild(img);
  wrap.appendChild(imgWrap);

  // Title
  var title = document.createElement('div');
  title.className = 'cd-title';
  title.textContent = 'DOPAMILIO #' + nft.id;
  wrap.appendChild(title);

  // Stars — below title
  var _STAR_MAP = {Common:0, Uncommon:1, Rare:2, Epic:3, Legendary:4, Mythic:5};
  var litCount = _STAR_MAP[nft.tier] || 0;
  var starsDiv = document.createElement('div');
  starsDiv.style.cssText = 'text-align:center;font-size:12px;letter-spacing:3px;margin-top:2px;margin-bottom:4px;';
  var starHtml = '';
  for (var si = 0; si < 5; si++) {
    if (si < litCount) {
      starHtml += '<span style="color:' + color + ';text-shadow:0 0 6px ' + color + '">★</span>';
    } else {
      starHtml += '<span style="color:rgba(255,255,255,0.15)">★</span>';
    }
  }
  starsDiv.innerHTML = starHtml;
  wrap.appendChild(starsDiv);

  // Phrase
  var phrase = document.createElement('div');
  phrase.className = 'cd-phrase';
  phrase.textContent = '\u201c' + lore.phrase + '\u201d';
  wrap.appendChild(phrase);

  // Badges
  var badges = document.createElement('div');
  badges.className = 'cd-badges';

  var b1 = document.createElement('span');
  b1.className = 'cd-badge cd-badge-btc';
  b1.textContent = '\u20BF BITCOIN';

  var b2 = document.createElement('span');
  b2.className = 'cd-badge cd-badge-tier';
  b2.textContent = lore.rarityName;

  var b3 = document.createElement('span');
  b3.className = 'cd-badge cd-badge-rank';
  b3.textContent = '#' + nft.rank;

  badges.appendChild(b1);
  badges.appendChild(b2);
  badges.appendChild(b3);
  wrap.appendChild(badges);

  return wrap;
}

// ─── CARD MODAL ──────────────────────────────────────────────────────────────
var CardModal = (function() {
  var _escHandler = null;

  function open(id) {
    var nftData = (typeof _dopaGet === 'function') ? _dopaGet(id) : null;
    if (!nftData) return;
    nftData.id = id;

    var lore = (window.DopamilioLore && window.DopamilioLore.generateCharacterLore)
      ? window.DopamilioLore.generateCharacterLore(nftData)
      : { phrase: '...', role: '...', satsWallet: 0, personality: '...', rarityColor: '#9CA3AF', rarityRgb: '156,163,175', rarityName: (nftData.tier || 'Common').toUpperCase(), animDuration: '4s' };

    // Clear wrap
    var wrap = document.getElementById('cardDetailWrap');
    if (!wrap) return;
    wrap.innerHTML = '';

    // Build card
    var cardEl = buildCardDetail(nftData, lore);
    wrap.appendChild(cardEl);

    // Show overlay
    var overlay = document.getElementById('cardModal');
    overlay.style.display = 'flex';

    // Mobile: add flip back panel + tap handler (skip terminal)
    if (window.innerWidth <= 768) {
      var flipBack = document.createElement('div');
      flipBack.className = 'cd-flip-back';
      var _fb = function(cls, txt) { var d = document.createElement('div'); d.className = cls; d.textContent = txt; return d; };
      flipBack.appendChild(_fb('cd-flip-title', 'LORE'));
      flipBack.appendChild(_fb('cd-flip-phrase', lore.phrase || '...'));
      flipBack.appendChild(_fb('cd-flip-role', lore.role || ''));
      flipBack.appendChild(_fb('cd-flip-sats', lore.satsWallet ? lore.satsWallet.toLocaleString() + ' SATS' : ''));
      flipBack.appendChild(_fb('cd-flip-personality', lore.personality || ''));
      flipBack.appendChild(_fb('cd-flip-hint', 'TAP TO FLIP BACK'));
      cardEl.appendChild(flipBack);
      // Front hint
      var frontHint = document.createElement('div');
      frontHint.className = 'cd-front-hint';
      frontHint.textContent = 'TAP CARD TO SEE LORE';
      cardEl.appendChild(frontHint);
      // Tap to flip
      cardEl.addEventListener('click', function(e) {
        e.stopPropagation();
        cardEl.classList.toggle('cd-flipped');
      });
    } else {
      // Desktop: Terminal (150ms delay)
      setTimeout(function() {
        var lines = _buildTerminalLines(nftData, lore);
        _termPlay(lines, lore.rarityColor, lore.rarityRgb);
      }, 150);
    }

    // Escape
    if (_escHandler) document.removeEventListener('keydown', _escHandler);
    _escHandler = function(e) { if (e.key === 'Escape') close(); };
    document.addEventListener('keydown', _escHandler);

    // Close button
    var closeBtn = document.getElementById('cardModalClose');
    if (closeBtn) closeBtn.onclick = close;

    // Click outside card closes
    overlay.onclick = function(e) {
      if (e.target === overlay) close();
    };
  }

  function close() {
    var overlay = document.getElementById('cardModal');
    if (overlay) overlay.style.display = 'none';
    _termClear();
    var wrap = document.getElementById('cardDetailWrap');
    if (wrap) wrap.innerHTML = '';
    if (_escHandler) { document.removeEventListener('keydown', _escHandler); _escHandler = null; }
    if (typeof closeNftDetail === 'function') closeNftDetail();
  }

  return { open: open, close: close };
})();

window.addEventListener('orientationchange', function() {
  var overlay = document.getElementById('cardModal');
  if (overlay && overlay.style.display === 'flex') {
    var card = overlay.querySelector('[style*="width"]');
    if (card) card.style.width = 'min(360px, calc(100vw - 20px))';
  }
});

window.DopamilioCardModal = CardModal;
