# Template changelog

Versions of the **template itself** (not your company content). When you instantiate the template, note the version you started from in your first commit — future template improvements can then be diffed and pulled selectively.

Versioning: tags `vMAJOR.MINOR` on the template repo. MAJOR = structural changes (new folders, changed contracts); MINOR = doc improvements, new scripts/skills, fixes.

---

## v1.4 — 2026-06-14

**Team access & rollout** (closes the last acknowledged gap — the README promised "ask in Slack" with no wiring path):

- New `guides/TEAM-ACCESS.md`: the three access tiers (1 ask & edit via the Slack agent — everyone, no GitHub account; 2 browse read-only Notion views; 3 review & merge on GitHub — 1–2 maintainers), the **one-way-out / never-two-way** rule with reasoning, the published-view stamped-header convention driven off the `audience:` field, and Slack-agent wiring options (Claude in Slack / OpenClaw-in-a-channel / n8n webhook bridge) with the read-broad/write-as-PR invariants
- Wired into README (new "teammate without GitHub" reading path + FAQ entry + file map), `guides/README.md`, `guides/ARCHITECTURE.md` (deliberately-NOT now names two-way sync explicitly), and `HUMAN-JOB.md`
- Companion (agency toolkit, not the template): an n8n `publish-to-notion` building block for Tier-2 one-way publishing

## v1.3 — 2026-06-12

**QA hardening** (5-agent adversarial audit: cold-start agent + cold-start founder simulations, consistency forensics, SME gap analysis vs a production SSOT, executable verification):

- **Contract fixes:** weekly briefs removed from the auto-commit list everywhere (PR + human review only — the worst cross-doc contradiction); `ops | finance` added to the canonical type enum; wikilink semantics defined (root-relative, no extension, agent convention); precedence rule (folder README > AGENTS.md > guides); `[VERIFY]`/`[INFERENCE]` uncertainty tags with weekly resolution ritual
- **New:** `GLOSSARY.md` (every system term defined; company section grows), `guides/HUMAN-JOB.md` (the human's whole role incl. click-by-click PR review), `guides/FAQ-AND-FAILURE-MODES.md` (judgment calls, CI failures, anti-patterns), `LICENSE` (MIT — was claimed, not shipped), `SECURITY.md` (incl. burned-credential rotate-then-use), `CONTRIBUTING.md`, `Makefile` (`make verify` = CI parity) + `scripts/check-links.sh`
- **Shipped scaffolds:** `sales/pipeline.md` + `sales/pricing.md` (INDEX/README routed to them but they didn't exist)
- **Script bugs:** bootstrap.sh re-runs no longer abort under `set -euo pipefail`; date-stamp regex now matches any scaffold ISO date (was an enumerated list that missed 2026-06-12); leftover-placeholder count excludes intentional scaffolding
- **Templates:** REQUIRED fields added (`relationship` to person + customer, `category`/`threat_level` to competitor); `{{CUSTOMER}}` → `{{CUSTOMER_NAME}}`
- **Migration doc:** eight→six category count, template-ships-the-structure framing, complete target tree, archive rule scoped to migration time, `make verify` in Phase 10
- **Routing rows added:** glossary terms, legal pointers (new ops.md section), job candidates (ATS, not repo), content calendar (live systems); `github` added to `source_of_truth` enums
- **Founder UX:** SETUP leads with the agent-driven path ("the agent runs the commands; you answer questions"), seed list reconciled (finance.md, management/, memory, inbox), `/skill x` → `/x` syntax unified, honest note on branch protection for free-plan private repos
- strategy.md ↔ goals.md boundary stated (narrative priorities vs the one tracked goal table); broken worked-example wikilinks fixed (category segment); hook command anchored to `$CLAUDE_PROJECT_DIR`; pre-commit dirs aligned with the validator
- **Versioning & audit trail made explicit:** AGENTS.md "Sign your work" rule (semantic commits, why in the body, `Co-Authored-By: <agent>` trailer on every agent-authored commit — never impersonate the human); README "Versioning & audit trail" section; HUMAN-JOB "Seeing the history"; GLOSSARY (audit trail, blame) + FAQ entries; PR-template provenance checkbox. Doctrine: Git is the changelog — never hand-maintain one for content

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
