# Template changelog

Versions of the **template itself** (not your company content). When you instantiate the template, note the version you started from in your first commit — future template improvements can then be diffed and pulled selectively.

Versioning: tags `vMAJOR.MINOR` on the template repo. MAJOR = structural changes (new folders, changed contracts); MINOR = doc improvements, new scripts/skills, fixes.

---

## v1.1 — 2026-06-12

**Turnkey wave** — from documented skeleton to instant starting package:

- Four first-party starter skills shipped: `normalize-meeting`, `weekly-brief`, `customer-brief`, `update-wiki` (symlinked into `.claude/skills/` for Claude Code)
- `scripts/bootstrap.sh` — interactive placeholder fill, date stamping, hook install
- `docs/CLIENT-ONBOARDING.md` — the consultancy engagement playbook (kickoff workshop → ingestion week → handoff → retainer)
- Folder READMEs completed: `templates/`, `docs/`, `scripts/`, `agents-compat/`
- `.github/PULL_REQUEST_TEMPLATE.md` (the OPERATIONS PR checklist) + `CODEOWNERS` stub
- This changelog

## v1.0 — 2026-06-11

**Best-practice upgrade** (research-backed; see PR #1):

- `memory/` two-tier agent memory: `MEMORY.md` index (≤200 lines) + daily worklogs + typed `learnings.md`
- `operating-system/` pack: `vision.md`, `rocks.md`, `scorecard.md`, `accountability.md`, `processes/` — EOS/OKR/4DX-compatible with mapping table and trademark attribution
- Handbook-first operating rule; ARCHITECTURE principles 11–12
- Deterministic enforcement: `.claude/settings.json` frontmatter hook + `.github/workflows/validate.yml` CI (frontmatter, gitleaks, links, staleness)
- README rebuilt as the exhaustive front door; INDEX extended
- `agents-compat/openclaw/` workspace adapter
- Fixes: SETUP links, eleven-phase count, AGENTS.md cap 150→200 (Anthropic guidance)

## v0.x — 2026-04

Initial template: entry files (AGENTS/CLAUDE/INDEX), six root knowledge files with generation guides, entity folders with full per-folder contracts, time-series folders, templates, docs (ARCHITECTURE/SETUP/OPERATIONS/PLAYBOOK/AGENT-INSTRUCTIONS), validation scripts.
