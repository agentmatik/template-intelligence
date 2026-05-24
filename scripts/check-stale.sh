#!/usr/bin/env bash
# check-stale.sh — flag pages whose last_verified is older than threshold
# Usage: ./scripts/check-stale.sh [--threshold N] [--type customer]

set -euo pipefail

THRESHOLD=${THRESHOLD:-30}
TYPE_FILTER=""

while [ $# -gt 0 ]; do
  case $1 in
    --threshold) THRESHOLD="$2"; shift 2;;
    --type) TYPE_FILTER="$2"; shift 2;;
    *) echo "Unknown arg: $1"; exit 1;;
  esac
done

# Type-specific thresholds (days)
type_threshold() {
  case "$1" in
    customer) echo 30;;
    competitor) echo 60;;
    person) echo 180;;
    strategy) echo 90;;
    spec) echo 30;;
    runbook) echo 90;;
    *) echo "$THRESHOLD";;
  esac
}

NOW=$(date +%s)
TODAY=$(date +%Y-%m-%d)

echo "# Staleness report — $TODAY"
echo
echo "Default threshold: ${THRESHOLD} days. Type-specific applied where set."
echo

FILES=$(find . -type f -name "*.md" \
  -not -path "./node_modules/*" \
  -not -path "./inbox/*" \
  -not -path "./site/*" 2>/dev/null)

STALE_FOUND=0

for f in $FILES; do
  if ! head -1 "$f" 2>/dev/null | grep -q "^---$"; then continue; fi
  LV=$(awk '/^---$/{c++; next} c==1 && /^last_verified:/{print $2; exit}' "$f" | tr -d '"' | tr -d "'")
  TYPE=$(awk '/^---$/{c++; next} c==1 && /^type:/{print $2; exit}' "$f" | tr -d '"' | tr -d "'")
  [ -z "$LV" ] && continue
  [ -n "$TYPE_FILTER" ] && [ "$TYPE" != "$TYPE_FILTER" ] && continue

  if date -d "$LV" +%s >/dev/null 2>&1; then
    LV_TS=$(date -d "$LV" +%s)
  else
    LV_TS=$(date -j -f "%Y-%m-%d" "$LV" +%s 2>/dev/null || echo 0)
  fi
  [ "$LV_TS" -eq 0 ] && continue
  AGE_DAYS=$(( (NOW - LV_TS) / 86400 ))
  T=$(type_threshold "$TYPE")
  if [ "$AGE_DAYS" -gt "$T" ]; then
    echo "- $f (type:${TYPE:-untyped}, last_verified $LV, ${AGE_DAYS}d ago, threshold ${T}d)"
    STALE_FOUND=$((STALE_FOUND+1))
  fi
done

echo
if [ "$STALE_FOUND" -eq 0 ]; then
  echo "✅ No stale pages found."
else
  echo "Found $STALE_FOUND stale page(s). Update last_verified after refreshing."
fi
