#!/usr/bin/env bash
# switch-to-mainnet.sh — Apply mainnet configuration to index.html
#
# Usage:
#   bash scripts/switch-to-mainnet.sh <CONTRACT_ADDR> <CONTRACT_P2TR> <DEPLOY_BLOCK>
#
# Example:
#   bash scripts/switch-to-mainnet.sh opt1sNEWADDR bc1pTREASURY 0x3f9a
#
# What this script changes in index.html:
#   - CONTRACT_ADDR   → new mainnet contract address
#   - CONTRACT_P2TR   → bc1p treasury address
#   - RPC_URL         → https://mainnet.opnet.org
#   - NETWORK_OBJ     → mainnet network object (bech32:'bc', isTestnet:false)
#   - OPSCAN_QUERY    → empty string (no ?network=op_testnet)
#   - _DEPLOY_BLOCK   → deploy block from receipt
#
# After running: git add index.html && git commit -m "feat: mainnet config" && git push

set -euo pipefail

CONTRACT_ADDR="${1:?Usage: $0 <CONTRACT_ADDR> <CONTRACT_P2TR> <DEPLOY_BLOCK>}"
CONTRACT_P2TR="${2:?Usage: $0 <CONTRACT_ADDR> <CONTRACT_P2TR> <DEPLOY_BLOCK>}"
DEPLOY_BLOCK="${3:?Usage: $0 <CONTRACT_ADDR> <CONTRACT_P2TR> <DEPLOY_BLOCK>}"

INDEX="index.html"

if [ ! -f "$INDEX" ]; then
  echo "ERROR: $INDEX not found. Run from the repo root." >&2
  exit 1
fi

echo "Applying mainnet config to $INDEX..."
echo "  CONTRACT_ADDR  = $CONTRACT_ADDR"
echo "  CONTRACT_P2TR  = $CONTRACT_P2TR"
echo "  DEPLOY_BLOCK   = $DEPLOY_BLOCK"

# Create backup
cp "$INDEX" "${INDEX}.mainnet-backup"

# 1. CONTRACT_ADDR
sed -i "s|const CONTRACT_ADDR\s*=\s*'[^']*'|const CONTRACT_ADDR = '$CONTRACT_ADDR'|" "$INDEX"

# 2. CONTRACT_P2TR
sed -i "s|const CONTRACT_P2TR\s*=\s*'[^']*'|const CONTRACT_P2TR = '$CONTRACT_P2TR'|" "$INDEX"

# 3. RPC_URL
sed -i "s|const RPC_URL\s*=\s*'https://testnet\.opnet\.org'|const RPC_URL = 'https://mainnet.opnet.org'|" "$INDEX"

# 4. OPSCAN_QUERY
sed -i "s|const OPSCAN_QUERY\s*=\s*'?network=op_testnet'|const OPSCAN_QUERY = ''|" "$INDEX"

# 5. _DEPLOY_BLOCK
sed -i "s|const _DEPLOY_BLOCK\s*=\s*0x[0-9a-fA-F]*|const _DEPLOY_BLOCK = $DEPLOY_BLOCK|" "$INDEX"

# 6. NETWORK_OBJ — replace testnet with mainnet
sed -i "s|\.\.\.networks\.opnetTestnet,|...networks.bitcoin,|" "$INDEX"
sed -i "s|bech32:'opt'|bech32:'bc'|" "$INDEX"
sed -i "s|isTestnet:true|isTestnet:false|" "$INDEX"

# Verify key replacements
echo ""
echo "Verifying replacements..."
grep -n "CONTRACT_ADDR\|CONTRACT_P2TR\|RPC_URL\|OPSCAN_QUERY\|_DEPLOY_BLOCK\|isTestnet" "$INDEX" | grep "const " | head -20

echo ""
echo "Done. Review the diff with: git diff index.html"
echo "Backup saved to: ${INDEX}.mainnet-backup"
echo ""
echo "Next steps:"
echo "  git add index.html"
echo "  git commit -m \"feat: switch to mainnet — $CONTRACT_ADDR\""
echo "  git push"
