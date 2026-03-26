// api/proof.js — Merkle WL proof endpoint
// Route: /api/proof?addr=<opt1p...>
// Returns: { proof: ["0x<hex>", ...] } or 404 if not in whitelist

const path = require('path');
const fs   = require('fs');

let _proofs = null;

function loadProofs() {
  if (_proofs) return;
  const p = path.join(process.cwd(), 'api', 'wl-proofs.json');
  if (!fs.existsSync(p)) {
    _proofs = {};
    return;
  }
  _proofs = JSON.parse(fs.readFileSync(p, 'utf8'));
}

module.exports = function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Cache-Control', 'public, max-age=300');

  try {
    loadProofs();
    const addr = String(req.query.addr || '').trim();
    if (!addr) {
      return res.status(400).json({ error: 'Missing addr param' });
    }

    if (Object.prototype.hasOwnProperty.call(_proofs, addr)) {
      return res.status(200).json({ proof: _proofs[addr] });
    }

    return res.status(404).json({ error: 'Address not in whitelist' });
  } catch (e) {
    return res.status(500).json({ error: 'Internal error' });
  }
};
