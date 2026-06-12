#!/usr/bin/env bash
# bootstrap.sh — one-time setup after creating a repo from the template.
#
# Fills the {{PLACEHOLDER}} variables across every tracked file, stamps
# today's date into the scaffold frontmatter, and optionally installs the
# gitleaks pre-commit hook.
#
# Usage: ./scripts/bootstrap.sh        (interactive)
# Idempotent: re-running with no placeholders left is a no-op.

set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

GRN='\033[0;32m'; YEL='\033[1;33m'; NC='\033[0m'

ask() {
  local prompt="$1" var="$2" example="$3" val
  read -r -p "$prompt (e.g. $example): " val
  if [ -z "$val" ]; then
    echo -e "${YEL}Skipped — {{$var}} left in place; re-run later to fill it.${NC}"
    return 0
  fi
  # Escape sed special chars in the replacement
  local esc
  esc=$(printf '%s' "$val" | sed -e 's/[\/&|]/\\&/g')
  # `|| true`: an already-filled placeholder makes grep exit 1, which would
  # kill the script under `set -euo pipefail` — re-runs must be no-ops.
  grep -rl --exclude-dir=.git "{{$var}}" . 2>/dev/null | while IFS= read -r f; do
    sed -i.bak "s|{{$var}}|$esc|g" "$f" && rm -f "$f.bak"
  done || true
  echo -e "${GRN}✓ {{$var}} → $val${NC}"
}

echo "Company Intelligence — bootstrap"
echo "Fills template placeholders across the repo. Empty answer = skip."
echo

ask "Company legal/full name" "COMPANY_NAME" "Acme Labs Ltd."
ask "Company short slug" "COMPANY_SHORT" "acme"
ask "Company tagline" "COMPANY_TAGLINE" "AI-native analytics for SMEs"
ask "Founder name" "FOUNDER_NAME" "Sarah Reinhardt"
ask "Founder email" "FOUNDER_EMAIL" "sarah@acme.co"
ask "GitHub org/user" "GITHUB_ORG" "acme-labs"
ask "Founder GitHub handle (for CODEOWNERS, no @)" "GITHUB_FOUNDER_HANDLE" "sarahreinhardt"

# Stamp the template's scaffold dates with today, so last_verified starts honest
TODAY=$(date +%Y-%m-%d)
echo
read -r -p "Stamp scaffold frontmatter dates with today ($TODAY)? [y/N]: " stamp
if [[ "${stamp:-n}" =~ ^[Yy]$ ]]; then
  # Any pre-instantiation ISO date in scaffold frontmatter gets today's date.
  # READMEs are excluded: their worked examples keep illustrative dates.
  grep -rl --exclude-dir=.git --exclude='README.md' -E "^(created|updated|last_verified): 20[0-9]{2}-[0-9]{2}-[0-9]{2}" . 2>/dev/null | while IFS= read -r f; do
    sed -i.bak -E "s/^(created|updated|last_verified): 20[0-9]{2}-[0-9]{2}-[0-9]{2}/\1: $TODAY/" "$f" && rm -f "$f.bak"
  done || true
  echo -e "${GRN}✓ scaffold dates → $TODAY${NC}"
fi

# Pre-commit hook
echo
read -r -p "Install gitleaks pre-commit hook? [y/N]: " hook
if [[ "${hook:-n}" =~ ^[Yy]$ ]]; then
  ln -sf ../../scripts/pre-commit.sh .git/hooks/pre-commit
  chmod +x scripts/pre-commit.sh
  command -v gitleaks >/dev/null 2>&1 || echo -e "${YEL}gitleaks not installed — brew install gitleaks${NC}"
  echo -e "${GRN}✓ pre-commit hook installed${NC}"
fi

echo
# templates/, SETUP's placeholder table, this script, and the CI exclude-regex
# keep {{...}} on purpose — only count unexpected leftovers.
LEFT=$( (grep -rlo --exclude-dir=.git --exclude-dir=templates --exclude=SETUP.md --exclude=bootstrap.sh --exclude=validate.yml "{{[A-Z_]*}}" . 2>/dev/null || true) | wc -l | tr -d ' ')
if [ "$LEFT" -gt 0 ]; then
  echo -e "${YEL}$LEFT file(s) still contain {{PLACEHOLDERS}} — grep -r '{{' to find them.${NC}"
else
  echo -e "${GRN}✓ no placeholders remaining${NC}"
fi

echo
echo "Next steps (guides/SETUP.md):"
echo "  1. Seed the ten minimum files (Step 3)"
echo "  2. Secure the repo: secret scanning, push protection, branch protection (Step 4)"
echo "  3. Configure MCP servers (Step 5)"
echo "  4. Validate: bash scripts/validate-frontmatter.sh"
