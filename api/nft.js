// api/nft.js — Dopamilio NFT metadata endpoint
// Route: /api/metadata/:id (via vercel.json rewrite) → /api/nft?id=:id
// Strips trailing .json suffix if present (tokenURI appends /N.json)
const path = require('path');
const fs   = require('fs');

const PINATA = 'ipfs://';
const DESCRIPTION = '3,333 unique degenerates etched on Bitcoin. 100% on-chain. Pure dopamine.';
const TRAIT_TYPES = ['Background','Classes','Eyes','Eye Brows','Cloths','Hair','Mouths','Head gear','Specials','Weapons','Acessories'];

// Per-IP rate limit: max 60 requests per 60s per serverless instance
const _ipMap = new Map();
const IP_WINDOW_MS = 60_000;
const IP_MAX_REQS  = 60;
function _isRateLimited(ip) {
  const now = Date.now();
  const e = _ipMap.get(ip);
  if (!e || now - e.t > IP_WINDOW_MS) { _ipMap.set(ip, { n: 1, t: now }); return false; }
  if (e.n >= IP_MAX_REQS) return true;
  e.n++;
  return false;
}

let _imgs  = null;
let _attrs = null;

function loadData() {
  if (_imgs && _attrs) return;
  _imgs  = JSON.parse(fs.readFileSync(path.join(process.cwd(), 'progress_images.json'), 'utf8'));
  _attrs = JSON.parse(fs.readFileSync(path.join(process.cwd(), 'api', 'attrs.json'), 'utf8'));
}

module.exports = function handler(req, res) {
  // Rate limit check
  const ip = ((req.headers['x-forwarded-for'] || '') + '').split(',')[0].trim() || 'unknown';
  if (_isRateLimited(ip)) {
    return res.status(429).json({ error: 'RATE_LIMITED' });
  }
  try {
    loadData();
    // Strip .json suffix if present, then parse
    const raw = String(req.query.id || '').replace(/\.json$/i, '');
    const id  = parseInt(raw, 10);
    if (!id || id < 1 || id > 3333) {
      return res.status(404).json({ error: 'Token not found' });
    }

    const cid  = _imgs[String(id)];
    const vals = _attrs[String(id)];
    if (!cid || !vals) {
      return res.status(404).json({ error: 'Token data missing' });
    }

    const attributes = TRAIT_TYPES.map((t, i) => ({
      trait_type: t,
      value: vals[i] || 'None'
    }));

    res.setHeader('Content-Type', 'application/json');
    res.setHeader('Cache-Control', 'public, max-age=31536000, immutable');
    res.setHeader('Access-Control-Allow-Origin', '*');
    return res.status(200).json({
      name:        'Dopamilio #' + id,
      description: DESCRIPTION,
      symbol:      'DOPAMILIO',
      image:       PINATA + cid,
      attributes
    });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};
