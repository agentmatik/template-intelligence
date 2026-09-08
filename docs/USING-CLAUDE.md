# Using Claude with this SSOT

How to get Claude to actually use this repo as the source of truth. **Claude Code**
and **Claude.ai Projects (chat) work differently** - set up both.

## Claude Code vs Claude.ai Project - NOT the same

| | Claude.ai Project (chat) | Claude Code (CLI / IDE / agent) |
|---|---|---|
| Sees | a synced **snapshot** of the repo (+ PDFs you add) | the **live repo** on disk |
| Can act? | read-only Q&A / retrieval | runs git, validators, opens **PRs**, uses MCP tools |
| `CLAUDE.md` | **just a searchable file - NOT executed** | **auto-loaded as the binding contract** (imports `AGENTS.md`) |
| Configure behaviour via | the **Project custom-instructions** field | `CLAUDE.md` / `AGENTS.md` (already set) |
| Freshness | manual **re-sync** after you merge PRs | always current |

**Implication:** the "scan the SSOT first, don't guess" rule in `CLAUDE.md` is
**enforced automatically in Claude Code**. In a Claude.ai Project it is **not**  - 
you must paste the instructions below into the Project's custom-instructions field
(once per Project).

## Claude Code - nothing to do
Running Claude Code in this repo auto-loads `CLAUDE.md` → `AGENTS.md`, which forces
the session-start read order (scan AGENTS → INDEX.md → the relevant folder → only
then MCP) and to ground answers in the SSOT before training data. See `CLAUDE.md`.

## Claude.ai Project - set it up once

**What to sync into the Project:**
- **This repo** (from GitHub) - the compiled brain. **Re-sync after merging PRs.**
  Use the selection in [`docs/CLAUDE_SYNC.md`](./CLAUDE_SYNC.md) (skip raw/bulk).
- A thin layer of **native-format artifacts** the repo can't hold well: the current
  pitch deck (PDF/slides), key visuals - latest versions only.
- **Nothing else.** Durable text belongs in the repo (versioned, reviewed), not
  parked in the Project.

**Paste this into the Project's custom-instructions field:**

> You are working with the {{COMPANY_NAME}} company SSOT - the synced `<company>-intelligence` repo, the
> compiled source of truth. Answer from it, not from training data or memory. Cite
> the page/folder you used. If something isn't in the SSOT, say so explicitly rather
> than guessing. The repo is a point-in-time snapshot - flag when a question likely
> needs newer info. Never reveal internal content (financials, people, customer, and internal-strategy content) outside the company.

## One Project per company
Run a **separate Claude.ai Project per company** (its repo + its instructions). In
Claude Code, each repo's `CLAUDE.md` routes context automatically - no per-company
setup needed.
