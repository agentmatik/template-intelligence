# Template changelog

Versions of the **template itself** (not your company content). When you instantiate the template, note the version you started from in your first commit — future template improvements can then be diffed and pulled selectively.

Versioning: tags `vMAJOR.MINOR` on the template repo. MAJOR = structural changes (new folders, changed contracts); MINOR = doc improvements, new scripts/skills, fixes.

---

## v1.2 — 2026-06-12

**Understandability pass** (founder feedback):

- `operating-system/` → **`management/`**; `rocks.md` → **`goals.md`**, `scorecard.md` → **`kpis.md`** (plain-English primary names; EOS terms kept as equivalents in the mapping table). Frontmatter types `rocks|scorecard` → `goals|kpis`.
- `docs/` → **`guides/`**.
- Meeting taxonomy simplified 8 → **6** (removed `board/`, `planning/` — now listed as add-when-relevant categories, with the planning propagation duty noted).
- **Agents codify repetition natively:** new AGENTS.md operating rule (3rd occurrence of a workflow → propose a skill via PR), a "codify repetition yourself" section in `skills/README.md`, and a monthly skill-candidate sweep in OPERATIONS.
- `templates/README.md` now states plainly what templates are (file skeletons for the repo's own types) and are not (business-document templates — that know-how lives in the generation guides).
- `people/` scope extended to **freelancers/contractors** (`relationship: freelancer`).
- **Language rule:** English is the operating language; verbatim quotes, transcript excerpts, and local-market brand voice examples keep their original language (playbook § Language rule, AGENTS.md preferred outputs, brand.md guide, meetings contract, README FAQ).

## v1.1 — 2026-06-12

**Turnkey wave** — from documented skeleton to instant starting package:

- `meetings/` default taxonomy: 8 best-practice category folders (standups, leadership/L10, one-on-ones, customers, product, marketing, board, planning), each with its own distill-focus + propagation README — explicitly designed to be reshaped to the company's real calendar during migration (Phase 8)
- Four first-party starter skills shipped: `normalize-meeting`, `weekly-brief`, `customer-brief`, `update-wiki` (symlinked into `.claude/skills/` for Claude Code)
- `scripts/bootstrap.sh` — interactive placeholder fill, date stamping, hook install
- `guides/CLIENT-ONBOARDING.md` — the consultancy engagement playbook (kickoff workshop → ingestion week → handoff → retainer)
- Folder READMEs completed: `templates/`, `guides/` (then `docs/`), `scripts/`, `agents-compat/`
- `.github/PULL_REQUEST_TEMPLATE.md` (the OPERATIONS PR checklist) + `CODEOWNERS` stub
- This changelog

## v1.0 — 2026-06-11

**Best-practice upgrade** (research-backed; see PR #1):

- `memory/` two-tier agent memory: `MEMORY.md` index (≤200 lines) + daily worklogs + typed `learnings.md`
- `management/` pack: `vision.md`, `goals.md`, `kpis.md`, `accountability.md`, `processes/` — EOS/OKR/4DX-compatible with mapping table and trademark attribution
- Handbook-first operating rule; ARCHITECTURE principles 11–12
- Deterministic enforcement: `.claude/settings.json` frontmatter hook + `.github/workflows/validate.yml` CI (frontmatter, gitleaks, links, staleness)
- README rebuilt as the exhaustive front door; INDEX extended
- `agents-compat/openclaw/` workspace adapter
- Fixes: SETUP links, eleven-phase count, AGENTS.md cap 150→200 (Anthropic guidance)

## v0.x — 2026-04

Initial template: entry files (AGENTS/CLAUDE/INDEX), six root knowledge files with generation guides, entity folders with full per-folder contracts, time-series folders, templates, docs (ARCHITECTURE/SETUP/OPERATIONS/PLAYBOOK/AGENT-INSTRUCTIONS), validation scripts.
