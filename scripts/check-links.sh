#!/usr/bin/env bash
# check-links.sh — verify all relative markdown links resolve.
# Local equivalent of CI's lychee job (offline, file-to-file only).
# Skips: external URLs, mailto:, {{PLACEHOLDER}} links, .claude/ symlink views.

set -euo pipefail
cd "$(git rev-parse --show-toplevel)"

python3 - <<'EOF'
import os, re, sys

bad = []
for root, dirs, files in os.walk('.'):
    dirs[:] = [d for d in dirs if d not in ('.git', '.claude', 'node_modules')]
    for f in files:
        if not f.endswith('.md'):
            continue
        p = os.path.join(root, f)
        text = open(p, encoding='utf-8').read()
        for m in re.finditer(r'\]\(([^)]+)\)', text):
            link = m.group(1).split('#')[0].strip()
            if not link or link.startswith(('http://', 'https://', 'mailto:', '{{')):
                continue
            if not os.path.exists(os.path.normpath(os.path.join(root, link))):
                bad.append(f"{p}: {link}")

if bad:
    print("❌ Broken relative links:")
    print("\n".join(bad))
    sys.exit(1)
print("✅ All relative links resolve.")
EOF
