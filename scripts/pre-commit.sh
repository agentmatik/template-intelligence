#!/usr/bin/env bash
# pre-commit.sh — gitleaks + sanity checks
# Install: ln -sf ../../scripts/pre-commit.sh .git/hooks/pre-commit

set -euo pipefail

RED='\033[0;31m'
YEL='\033[1;33m'
GRN='\033[0;32m'
NC='\033[0m'

# 1. Secret scan
if command -v gitleaks >/dev/null 2>&1; then
  echo "Running gitleaks..."
  if ! gitleaks protect --staged --redact -v; then
    echo -e "${RED}❌ Secrets detected. Commit blocked.${NC}"
    exit 1
  fi
else
  echo -e "${YEL}⚠️  gitleaks not installed. Install with: brew install gitleaks${NC}"
fi

# 2. Block raw inbox commits
STAGED=$(git diff --cached --name-only --diff-filter=ACM)
if echo "$STAGED" | grep -qE "^inbox/raw/|^inbox/granola-cache/|^inbox/slack-export/"; then
  echo -e "${RED}❌ Raw inbox files staged. These should be gitignored.${NC}"
  exit 1
fi

# 3. Frontmatter sanity check
CANONICAL_DIRS="customers competitors people sales decisions meetings weekly management memory"
for f in $STAGED; do
  for d in $CANONICAL_DIRS; do
    case "$f" in
      "$d"/*.md)
        if [ "$(basename "$f")" != "README.md" ]; then
          if ! head -1 "$f" 2>/dev/null | grep -q "^---$"; then
            echo -e "${YEL}⚠️  $f is in $d/ but has no frontmatter${NC}"
          fi
        fi
        ;;
    esac
  done
done

echo -e "${GRN}✅ Pre-commit checks passed.${NC}"
