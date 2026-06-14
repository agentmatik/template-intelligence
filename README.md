# Company Intelligence — starter template

A single-source-of-truth Git repo of plain Markdown that serves three audiences at once:

- **Humans** interact with it **through the agent** — ask a question in Slack or Claude Code, get an answer grounded in the repo; review changes as GitHub PRs. Nobody is expected to browse folders or edit Markdown by hand.
- **AI agents** (Claude Code, Cursor, Codex, OpenClaw, Gemini, Windsurf, Aider…) read it via `AGENTS.md` and write back through PRs.
- **Live systems** (Slack, Notion, Linear, Granola, Google Workspace) plug in through MCP.

Durable truth lives here. Execution state stays in the systems that own it. Agents synthesize across both — **the agent is the interface; the repo is its memory.**

**The promise:** point any new agent or team member at this repo and everything they need is absorbable from the documentation alone. Every folder carries its own complete generation contract; every rule has a written rationale; nothing requires tribal knowledge.

## What's "intelligence"?

The **intelligence** is the persistent knowledge layer your company runs on: an operating layer, not just storage. Agents and humans both read from it. Both write to it. PRs gate the truth.

## The system in one diagram

```
┌──────────────────────────────────────────────────────────┐
│ HUMAN INTERFACE                                          │
│ Talk to the agent (Slack agent, Claude Code, chat) ·     │
│ Review PRs and read on GitHub                            │
└─────────────────────────┬────────────────────────────────┘
                          │  reads, opens PRs
                          ▼
┌──────────────────────────────────────────────────────────┐
│ SINGLE SOURCE OF TRUTH  (this repo)                      │
│ Private GitHub repo · Plain Markdown + YAML frontmatter  │
│ AGENTS.md canonical · CLAUDE.md shim · skills · memory   │
└─────────────────────────┬────────────────────────────────┘
                          │  MCP (read-mostly)
                          ▼
┌──────────────────────────────────────────────────────────┐
│ LIVE SYSTEMS                                             │
│ Linear (execution) · Slack (conversation) · Granola      │
│ (transcripts) · Notion (legacy) · GitHub (code) ·        │
│ Workspace (mail/drive)                                   │
└──────────────────────────────────────────────────────────┘
```

Agents bridge all three layers. Humans write PRs into the middle. The middle layer is the **only** place durable truth lives. Full rationale: [`guides/ARCHITECTURE.md`](./guides/ARCHITECTURE.md).

## Complete file map

| Path | What it is |
|------|------------|
| `AGENTS.md` | **The agent operating contract.** Canonical, cross-tool, ≤200 lines. Every agent reads this first. |
| `CLAUDE.md` | Claude-Code shim: imports `@AGENTS.md`, adds Claude-specific guidance. |
| `INDEX.md` | Curated navigation + current focus. Updated weekly. |
| `company.md` | The 30-second answer to "what is this company?" — incl. what we *don't* do. |
| `strategy.md` | This quarter: north-star metric, top-3 priorities, bets, risks, what we're NOT doing. |
| `product.md` | What's built, roadmap direction (detail stays in Linear), architecture. |
| `brand.md` | Voice (3 dos + 3 don'ts with examples), messaging, naming rules. |
| `ops.md` | Cadence, decision rights, tools, vendors, GDPR inventory. |
| `finance.md` | **Pointers only** — where money truth lives, metric formulas. Never the numbers. |
| `customers/` | One file per customer/prospect — compiled truth + append-only timeline. |
| `competitors/` | One file per competitor, same pattern. |
| `people/` | Team, freelancers/contractors, advisors, investors, partners. Internal only. |
| `sales/` | `pipeline.md` (deals by stage, ranges not exact figures), `pricing.md`. |
| `decisions/` | `YYYY-MM-DD-<slug>.md` — append-only ADRs. Immutable; superseded by new files. |
| `meetings/` | `<category>/YYYY-MM-DD-<topic>.md` — distilled notes (≤500 words), never raw transcripts. Ships 6 best-practice categories (standups, leadership, one-on-ones, customers, product, marketing); reshape to the company's real calendar. |
| `weekly/` | `YYYY-Www.md` — the Friday brief. Human alignment cadence. |
| `management/` | Management-system layer: `vision.md`, `goals.md`, `kpis.md`, `accountability.md`, `processes/` (SOPs). EOS/OKR/4DX-compatible — see its README's mapping table. |
| `memory/` | **Agent** continuity: `MEMORY.md` curated index (≤200 lines), `YYYY-MM-DD.md` daily worklogs, `learnings.md` typed lessons. |
| `skills/` | Cross-tool agent skills (SKILL.md format). Ships with 4 starters: normalize-meeting, weekly-brief, customer-brief, update-wiki. |
| `templates/` | Frontmatter-scaffolded templates for every file type. |
| `agents-compat/openclaw/` | Use the repo as an OpenClaw workspace: SOUL/USER/TOOLS stubs + mapping. |
| `GLOSSARY.md` | Every term defined — system vocabulary ships filled; company terms grow. |
| `Makefile` | `make verify` — the same frontmatter/links/secrets checks CI runs, locally. |
| `LICENSE` · `SECURITY.md` · `CONTRIBUTING.md` | MIT (template structure only) · secret rules + burned-credential policy · how changes enter the repo. |
| `guides/` | The manuals: `ARCHITECTURE.md` (why), `SETUP.md` (bootstrap), `OPERATIONS.md` (rituals), `DATA-ORGANIZATION-PLAYBOOK.md` (routing), `AGENT-INSTRUCTIONS.md` (migration procedure), `CLIENT-ONBOARDING.md` (consultancy playbook), `HUMAN-JOB.md` (the human's whole role, click-by-click), `TEAM-ACCESS.md` (how the whole team reads/edits without GitHub), `FAQ-AND-FAILURE-MODES.md` (when something feels wrong), `TEMPLATE-CHANGELOG.md` (template versions). |
| `scripts/` | `bootstrap.sh` (one-command template setup), `validate-frontmatter.sh`, `check-stale.sh`, `check-links.sh`, `pre-commit.sh` (gitleaks); `make verify` runs the CI checks locally. |
| `.claude/` | `settings.json` deterministic hooks (frontmatter validation on every agent write); `skills/` symlinks for Claude Code discovery. |
| `.github/` | `workflows/validate.yml` CI (frontmatter, secrets, links, staleness) · PR template with the canonical-change checklist · `CODEOWNERS` stub. |

Every folder's own `README.md` is the **complete file-generation contract** for that folder (frontmatter, fields, sourcing, worked example, quality bar, edge cases). An agent with no prior context can generate correct, consistent files from those READMEs alone.

## Reading paths — start here

**Founder / operator (human):**
[`guides/HUMAN-JOB.md`](./guides/HUMAN-JOB.md) — your entire role on one page, zero assumed tech background (incl. click-by-click PR review). Any unfamiliar word: [`GLOSSARY.md`](./GLOSSARY.md).

**New team member (human):**
Ask the agent: *"Read AGENTS.md and brief me on this company."* Or read directly on GitHub: `company.md` → `strategy.md` → `brand.md` → `ops.md` → most recent `weekly/`. Under 30 minutes to oriented either way.

**Agent starting a task:**
[`AGENTS.md`](./AGENTS.md) (your operating contract — read it before doing anything else) → `memory/MEMORY.md` + today/yesterday worklogs → `INDEX.md` → the domain file the task touches → MCP only for fresh operational state.

**Agent asked to BUILD an intelligence repo from raw company data:**
1. [`guides/DATA-ORGANIZATION-PLAYBOOK.md`](./guides/DATA-ORGANIZATION-PLAYBOOK.md) — what goes where and why; the routing logic.
2. [`guides/AGENT-INSTRUCTIONS.md`](./guides/AGENT-INSTRUCTIONS.md) — the eleven-phase migration procedure with human checkpoints.
3. Each target folder's `README.md` — the per-file generation contract.

**Operator running the company on it:**
[`management/README.md`](./management/README.md) (artifact map + EOS/OKR/4DX table) → `vision.md` → `goals.md` → `kpis.md` → [`guides/OPERATIONS.md`](./guides/OPERATIONS.md) for the rituals that keep it alive.

**A teammate who just needs to read or change something (no GitHub account):**
[`guides/TEAM-ACCESS.md`](./guides/TEAM-ACCESS.md) — talk to the agent in Slack to ask or to propose a change; browse read-only published views in Notion. Nobody but the maintainer needs GitHub.

**OpenClaw user:**
[`agents-compat/openclaw/README.md`](./agents-compat/openclaw/README.md) — the repo doubles as an OpenClaw workspace; AGENTS.md and `memory/` work unmodified.

## The five contracts

Everything in the repo reduces to five conventions. Internalize these and the rest follows:

1. **Entry files** — `AGENTS.md` is canonical and ≤200 lines (always-loaded files must stay small or agents stop following them); `CLAUDE.md` imports it; everything procedural lives in on-demand skills, never the entry files. → [`AGENTS.md`](./AGENTS.md)
2. **Frontmatter** — every durable note opens with `type/status/owner/created/updated/last_verified/audience`. `type` routes retrieval; `status: draft` until a human verifies; `last_verified` tells the truth about staleness. Enforced by hook + CI. → [`AGENTS.md`](./AGENTS.md) § Frontmatter contract
3. **Compiled truth + timeline** — mutable current understanding above `---`, append-only dated history below. Never delete a timeline entry. → [`AGENTS.md`](./AGENTS.md) § Entity page pattern
4. **Two-tier memory** — small always-loaded `memory/MEMORY.md` index; dated detail retrieved on demand; every corrected mistake becomes a typed `learnings.md` entry before the task ends. → [`memory/README.md`](./memory/README.md)
5. **PR-gated truth, handbook-first** — canonical changes go through PR review; time-series auto-commits; and you document the change here *before* announcing it anywhere — never the reverse. → [`guides/OPERATIONS.md`](./guides/OPERATIONS.md)

## Versioning & audit trail — built in, not bolted on

Every change to truth is automatically logged with **what, why, who (human or agent), and when** — no separate changelog to maintain, because Git *is* the log:

- **What changed:** every edit is a commit; every canonical change is a PR with a reviewable line-by-line diff.
- **Why:** semantic commit titles + the PR's "What changed" body carry the reason; decisions get a full ADR in `decisions/`.
- **Who — human or agent:** the commit author is the human; agent-authored commits carry a `Co-Authored-By:` trailer naming the agent (an AGENTS.md rule), and the PR reviewer/merger is recorded by GitHub. You can always tell which agent wrote what and which human approved it.
- **When + history of any fact:** on GitHub, any file → **History** shows every version; *blame* shows who last touched each line. Or just ask the agent: *"who changed Acme's renewal date, when, and why?"*
- **In-file history for humans:** entity timelines (append-only, dated) and `decisions/` give the readable narrative without opening Git at all; `updated`/`last_verified` frontmatter dates every fact's freshness.

What we deliberately do **not** do: hand-maintain a "CHANGELOG of company content" — that would duplicate Git history and silently rot (the SSOT rule applies to history too). The one exception is [`guides/TEMPLATE-CHANGELOG.md`](./guides/TEMPLATE-CHANGELOG.md), which versions the *template structure itself*.

## Operating cadence

| Rhythm | Ritual |
|--------|--------|
| Daily (10 min) | Normalize meetings within 48h · touch one canonical page · log decisions as they happen |
| Weekly (Fri, 30 min) | `/weekly-brief` → review → merge · KPIs & goals check · staleness check · merge PRs, CI green |
| Monthly (60 min) | Strategy check-in · refresh top customers · prune `memory/learnings.md` · gitleaks clean |
| Quarterly (2 hrs) | Rewrite `strategy.md` · roll `goals.md` · review `vision.md` · audit MCP scopes · run the 20-question founder eval |

Full rituals and the 20-question eval: [`guides/OPERATIONS.md`](./guides/OPERATIONS.md).

## Who this is for

- **Founders** who want their AI agents to actually know their company
- **Small teams (1–20 people)** who don't need enterprise knowledge graphs
- **Consultancies and agencies** who want a reusable client template
- **Anyone** tired of repeating company context to every new chat

## Quick start (≤30 minutes)

See [`guides/SETUP.md`](./guides/SETUP.md). It walks you from empty clone to working intelligence with seeded strategy, one skill installed, and Claude Code reading the repo correctly.

**As a template:**

1. Click **Use this template** on GitHub (or `gh repo create --template`)
2. Name the new repo `<company>-intelligence`, make it **private**
3. Clone locally and run `./scripts/bootstrap.sh` — fills every placeholder, stamps dates, installs the pre-commit hook
4. Follow [`guides/SETUP.md`](./guides/SETUP.md)

Founders: budget one afternoon for setup, one week for seed content. Consultancies applying it to a client: follow [`guides/CLIENT-ONBOARDING.md`](./guides/CLIENT-ONBOARDING.md) — a 2-hour kickoff workshop, one week of async ingestion, a 1-hour handoff.

## Design principles (the one-paragraph version)

One durable truth (Git) + many live sources (MCP). Prefer file-native context before retrieval systems. Separate stable rules from fluid facts. Keep always-loaded files small. Put repeatable know-how in Skills, not in the root prompt. Use subagents for isolation. Plan, then act, then compact. Use MCP for freshness and narrow writes, not as long-term memory. Handbook-first: write it down before announcing it. Prose is advisory — hooks and CI are deterministic. Assume prompt injection is real. **Don't add RAG, vector DBs, or graph DBs until your traces prove you need them.**

The full twelve principles with rationale: [`guides/ARCHITECTURE.md`](./guides/ARCHITECTURE.md).

## What this is NOT (alternatives considered)

- **Not a Notion/Confluence wiki.** Wikis don't scale company truth: content goes stale silently, there's no review gate, and agents can't diff them. Git + PR review splits proposer from approver and gives you an audit trail for free. Notion keeps its job as the *working-docs* surface — a live system the agent reads via MCP — it just isn't where durable truth lives.
- **Not a plain CLAUDE.md.** One always-loaded file can't hold a company — it bloats past the size agents reliably follow. This repo keeps the entry contract small and pushes everything else into routed, on-demand files.
- **Not a vector-memory plugin.** File-native context (grep + frontmatter routing) beats retrieval infrastructure below ~100k tokens of knowledge. The evolution path to evals → hybrid search → vector DB exists ([`guides/ARCHITECTURE.md`](./guides/ARCHITECTURE.md) § Evolution path) — earn each tier.
- **Not a mirror of your live systems.** Linear tickets, Slack threads, and dashboards stay where they are; the repo holds distilled, durable conclusions and links out.

## FAQ

**Do I need all of this on day one?** No. The eleven-phase migration deliberately builds a 10–30 file spine. `skills/` ships only the four universal starters; `management/` is an optional pack; structure is added when content demands it.

**What if my company doesn't run EOS?** The `management/` artifacts use generic names with an EOS/OKR/4DX mapping table. Use them under any framework, or ignore the folder entirely.

**Where do the actual metric numbers live?** In your dashboards. The repo holds definitions, owners, goals, and links — numbers pasted into Markdown go stale and rot trust.

**How do agents avoid hallucinating company facts?** Source-of-truth hierarchy (`AGENTS.md`): verified repo files → live MCP → never training data. Files without frontmatter are drafts; `status: verified` requires a human. The 20-question quarterly eval catches regressions.

**How does the rest of the team read or edit this without GitHub accounts?** Three tiers: everyone asks and proposes changes by talking to the agent in Slack (it opens the PR); a few key pages are published read-only into Notion; only the 1–2 maintainers use GitHub to merge. Never two-way-sync Notion back into the repo. Full design: [`guides/TEAM-ACCESS.md`](./guides/TEAM-ACCESS.md).

**Can multiple agents work in it concurrently?** Time-series folders (meetings, weeklies, memory dailies) are append-only and auto-commit safely. Canonical pages go through PRs — the human reviewer is the arbiter when agents disagree.

**Is my data safe in here?** The repo is private by design, with hard prohibitions (no secrets, PII, cap tables, comp — see the playbook), gitleaks in pre-commit and CI, and GitHub push protection recommended in setup.

**What if the company doesn't operate in English?** English is the repo's operating language (compiled truth, summaries, frontmatter) — agents work most reliably in it. Source-language content stays where it's evidence: verbatim quotes, transcript excerpts, and local-market brand voice examples keep their original language. Full rule: [`guides/DATA-ORGANIZATION-PLAYBOOK.md`](./guides/DATA-ORGANIZATION-PLAYBOOK.md) § Language rule.

## License & versioning

MIT for the template structure. Your content is yours.

Template versions are tagged and logged in [`guides/TEMPLATE-CHANGELOG.md`](./guides/TEMPLATE-CHANGELOG.md) — when you instantiate, note the version in your first commit so you can pull future template improvements selectively.

EOS®, V/TO®, and Level 10 Meeting™ are trademarks of EOS Worldwide, LLC. This template is EOS-*compatible* and not affiliated with or endorsed by EOS Worldwide.

---

**Maintained by [Agentmatik](https://agentmatik.com).** Based on consensus across independent deep research on agent-ready company context patterns (Anthropic context engineering & Claude Code best practices, GitLab handbook-first, OpenClaw workspace memory, Cline, gbrain/gstack, Superpowers, Chroma context-rot research, LangChain context engineering, the AGENTS.md standard, Sam Altman's Startup Playbook).
