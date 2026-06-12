# Scripts

Deterministic helpers. Everything here also runs in CI (`.github/workflows/validate.yml`) or as a hook — the scripts are the single implementation; CI and hooks just invoke them.

| Script | What it does | Wired into |
|--------|--------------|-----------|
| `bootstrap.sh` | Interactive first-run setup: fills `{{COMPANY_NAME}}`-style placeholders across the repo, stamps today's dates, optionally installs the pre-commit hook | Run once after creating a repo from the template |
| `validate-frontmatter.sh` | Checks every canonical file for the required frontmatter fields | CI (`frontmatter` job) + `.claude/settings.json` PostToolUse hook |
| `check-stale.sh` | Flags pages whose `last_verified` exceeds the per-type threshold (`--threshold N`, `--type customer`) | CI (advisory job) + the weekly ritual |
| `pre-commit.sh` | gitleaks secret scan + sanity checks before each commit | `ln -sf ../../scripts/pre-commit.sh .git/hooks/pre-commit` |

Conventions:

- Bash, `set -euo pipefail`, no dependencies beyond coreutils + optionally gitleaks.
- A rule that must hold 100% of the time belongs here (deterministic), with the prose version in `AGENTS.md` as explanation only — see `guides/ARCHITECTURE.md` principle 12.
- New script? Add a row here and wire it into CI or a hook in the same PR — an unwired script is a rule nobody enforces.
