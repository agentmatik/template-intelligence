#!/usr/bin/env bash
# validate-frontmatter.sh — ensure all canonical files have required frontmatter
# Exits 1 if any file missing required fields.

set -euo pipefail

CANONICAL_DIRS="customers competitors people sales decisions meetings weekly operating-system"
# memory/ daily worklogs (YYYY-MM-DD.md) are time-series drafts and exempt;
# the two curated memory files are canonical and checked below.
ROOT_FILES="company.md strategy.md product.md brand.md ops.md finance.md memory/MEMORY.md memory/learnings.md"
REQUIRED_FIELDS="type status owner created updated last_verified"

ERRORS=0

check_file() {
  local f="$1"
  if [ "$(basename "$f")" = "README.md" ]; then return; fi
  if ! head -1 "$f" 2>/dev/null | grep -q "^---$"; then
    echo "❌ $f — no frontmatter"
    ERRORS=$((ERRORS+1))
    return
  fi
  FM=$(awk '/^---$/{c++; if(c==2)exit; next} c==1{print}' "$f")
  for field in $REQUIRED_FIELDS; do
    if ! echo "$FM" | grep -qE "^${field}:"; then
      echo "❌ $f — missing field: $field"
      ERRORS=$((ERRORS+1))
    fi
  done
}

for f in $ROOT_FILES; do
  [ -f "$f" ] && check_file "$f"
done

for d in $CANONICAL_DIRS; do
  [ -d "$d" ] || continue
  while IFS= read -r f; do
    check_file "$f"
  done < <(find "$d" -type f -name "*.md")
done

if [ "$ERRORS" -gt 0 ]; then
  echo
  echo "Found $ERRORS frontmatter issue(s)."
  exit 1
fi

echo "✅ All canonical files have valid frontmatter."
