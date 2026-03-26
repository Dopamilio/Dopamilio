/**
 * api/quotes.js — Vercel Serverless Function
 * Fetches live equity quotes from Twelve Data for the Dopamilio livebar.
 * Set TWELVE_DATA_KEY in Vercel Environment Variables.
 *
 * Symbols fetched (free-tier compatible):
 *   NVDA, MSFT, TSLA, MSTR  → direct stocks (NYSE/NASDAQ)
 *   SPY                      → proxy for SPX (S&P 500 ETF)
 *   XAU/USD                  → GOLD (forex pair)
 *   UUP                      → proxy for DXY (USD Index ETF)
 *
 * BTC is fetched client-side via Binance (no key needed).
 */

// In-memory throttle: prevents exhausting the 800 req/day free-tier limit
// Each serverless instance caches the last response for 20s
let _cache = null;
let _cacheTs = 0;
const CACHE_TTL_MS = 20_000;

// Per-IP rate limit: max 5 requests per 30s per serverless instance
const _ipMap = new Map();
const IP_WINDOW_MS = 30_000;
const IP_MAX_REQS  = 5;

function _isRateLimited(ip) {
  const now = Date.now();
  const e = _ipMap.get(ip);
  if (!e || now - e.t > IP_WINDOW_MS) { _ipMap.set(ip, { n: 1, t: now }); return false; }
  if (e.n >= IP_MAX_REQS) return true;
  e.n++;
  return false;
}

// Maps Twelve Data fetch symbol → display symbol sent to frontend
const SYMBOL_MAP = {
  'NVDA':    'NVDA',
  'MSFT':    'MSFT',
  'TSLA':    'TSLA',
  'MSTR':    'MSTR',
  'AAPL':    'AAPL',
  'SPY':     'SPX',     // S&P 500 proxy
  'XAU/USD': 'GOLD',
  'UUP':     'DXY',     // USD Index proxy
};

module.exports = async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://dopamilio-mint.vercel.app');
  res.setHeader('Access-Control-Allow-Methods', 'GET');
  res.setHeader('Vary', 'Origin');

  // Per-IP rate limit check
  const ip = ((req.headers['x-forwarded-for'] || '') + '').split(',')[0].trim() || 'unknown';
  if (_isRateLimited(ip)) {
    return res.status(429).json({ error: 'RATE_LIMITED', symbols: {} });
  }

  // Serve in-memory cache if fresh (handles rapid bursts that bypass CDN edge)
  if (_cache && Date.now() - _cacheTs < CACHE_TTL_MS) {
    res.setHeader('Cache-Control', 's-maxage=25, stale-while-revalidate=10');
    res.setHeader('X-Cache', 'HIT');
    return res.status(200).json(_cache);
  }

  const key = process.env.TWELVE_DATA_KEY;
  if (!key) return res.status(200).json({ error: 'NO_KEY', symbols: {} });

  const fetchSyms = Object.keys(SYMBOL_MAP).join(',');
  const url = `https://api.twelvedata.com/quote?symbol=${encodeURIComponent(fetchSyms)}&apikey=${key}`;

  try {
    const ctrl = new AbortController();
    const tid = setTimeout(() => ctrl.abort(), 5000);
    const response = await fetch(url, { signal: ctrl.signal });
    clearTimeout(tid);
    if (!response.ok) return res.status(200).json({ error: `HTTP_${response.status}`, symbols: {} });

    const raw = await response.json();

    // Handle top-level rate-limit or auth error from Twelve Data
    if (raw.status === 'error') {
      return res.status(200).json({ error: raw.message || 'TD_ERROR', symbols: {} });
    }

    // Remap keys to display symbols (SPY→SPX, UUP→DXY, XAU/USD→GOLD)
    const symbols = {};
    for (const [fetchSym, dispSym] of Object.entries(SYMBOL_MAP)) {
      const v = raw[fetchSym];
      if (v && v.status !== 'error') symbols[dispSym] = v;
    }

    // Cache in-memory and on Vercel CDN edge
    _cache = { symbols };
    _cacheTs = Date.now();
    res.setHeader('Cache-Control', 's-maxage=25, stale-while-revalidate=10');
    return res.status(200).json({ symbols });

  } catch (err) {
    return res.status(200).json({ error: err.message || 'FETCH_FAILED', symbols: {} });
  }
};
