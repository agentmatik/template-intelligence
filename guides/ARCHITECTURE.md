# Architecture

## The three-layer model

```
┌──────────────────────────────────────────────────────────┐
│ HUMAN INTERFACE                                          │
│ Talk to the agent (Slack agent, Claude Code, chat) ·    │
│ Review PRs and read on GitHub                           │
└─────────────────────────┬────────────────────────────────┘
                          │  reads, opens PRs
                          ▼
┌──────────────────────────────────────────────────────────┐
│ SINGLE SOURCE OF TRUTH  (Company Intelligence)          │
│ Private GitHub repo · Plain Markdown + YAML frontmatter │
│ AGENTS.md canonical · CLAUDE.md shim · skills here too  │
└─────────────────────────┬────────────────────────────────┘
                          │  MCP (read-mostly)
                          ▼
┌──────────────────────────────────────────────────────────┐
│ LIVE SYSTEMS                                             │
│ Linear (execution) · Slack (conversation) · Granola     │
│ (transcripts) · Notion (legacy) · GitHub (code) ·       │
│ Workspace (mail/drive)                                   │
└──────────────────────────────────────────────────────────┘
```

Agents bridge all three layers. Humans write PRs into the middle. Live systems push data in. The middle layer is the **only** place durable truth lives.

## Twelve principles

### 1. One durable truth, many live sources

Durable knowledge in Git Markdown. Execution state in Linear. Live conversation in Slack/Granola. Agents read live via MCP; they don't create duplicate truth.

### 2. Prefer file-native context before retrieval systems

File search + grep beats vector DBs for knowledge under ~100k tokens. Anthropic's just-in-time retrieval (grep + AGENTS.md pointers) is the default.

### 3. Separate stable instructions from fluid facts

Stable rules → `AGENTS.md`. Changing facts → entity pages, decisions, time-series logs.

### 4. Keep always-loaded files small

`AGENTS.md` ≤200 lines (Anthropic guidance: under 200 lines per always-loaded file). If it grows beyond that, split into path-scoped rules. Forcing function, not a limit.

### 5. Put reusable know-how in Skills, not in the root prompt

Skills load on demand (progressive disclosure). Company policy stays always-on in `AGENTS.md`. Specialized procedures live in `skills/<name>/SKILL.md`.

### 6. Use subagents for isolation, not memory

Isolate token-heavy work (competitor deep-dive, week-of-Slack triage) inside subagents. Return compact summaries.

### 7. Plan, then act, then compact

Long-running agents perform better when they plan, write notes, then compact context — instead of dragging huge transcripts forever.

### 8. Use MCP for live reads and narrow writes, not as memory

MCP for current status and workflow actions. Bad as long-term memory. If MCP answered a durable question, write the conclusion back.

### 9. Assume prompt injection and skill supply-chain risk are normal

Skills from untrusted sources can contain prompt injection. MCP servers can return poisoned content. Defence: first-party skills, pinned versions, sandboxed sessions, read-only MCP scopes, secrets in OS keychain or 1Password.

### 10. Don't add RAG until evals prove you need it

Vector DBs, graph DBs, temporal-graph memory: defer until trace data shows repeated misses. Month one is file-native, eval-driven, boring.

### 11. Handbook-first

Document the change in the repo, then announce it with a link — never the reverse (GitLab doctrine: write first, communicate second, so documentation is never the skipped step). One canonical version: "there is only *the* version."

### 12. Prose is advisory; hooks and CI are deterministic

Agents follow written rules most of the time; hooks and CI enforce them every time. Rules that must hold 100% (frontmatter contract, no secrets, no broken links) run as `.claude/settings.json` hooks and `.github/workflows/validate.yml` — the written rule stays as explanation.

## Folder & file naming (and why no numbered prefixes)

The naming is optimized for how **agents** navigate, which also happens to be clearest for humans:

- **Clean, semantic names — never numbered prefixes** (`customers/`, not `02_customers/`). Agents route by *name* and by frontmatter `type:`, never by tree position: the retrieval model is `grep customers/` and "files where `type: customer`". A number adds noise to every path, wikilink, and commit scope while buying nothing — an agent never needs "the folder that sorts second."
- **Guessable = self-locating.** Asked "where do customer notes go?", an agent (or a new hire) with zero context guesses `customers/` right. Nobody can guess `02_customers/`, so every reference needs a lookup. Guessable names are the single biggest absorbability win in the tree.
- **No false sequence.** A knowledge base has no inherent order — `customers` isn't "before" `competitors`. Where a reading *order* genuinely matters (onboarding), `INDEX.md` and the README reading-paths supply it explicitly and curatedly — far better than a rigid number baked into every path.
- **Cheap to grow.** Numbered schemes force renumber cascades when you insert a domain; clean names absorb new folders with zero churn — essential when "structure earns itself, added only when content demands it."
- **Conventions:** plural for collections (`customers/`, `people/`), singular for the single root knowledge files (`strategy.md`, `ops.md`); `kebab-case` for entity slugs; ISO dates (`YYYY-MM-DD`) and ISO weeks (`YYYY-Www`) for time-series so they sort correctly.

**Documents vs taxonomy — the distinction that matters.** We *do* number/date individual sequential **documents** — ADRs are effectively `0001-`-style, `decisions/` and `meetings/` are dated, `weekly/` is ISO-week. A date is a numeric ID, and for a sequence it's the right one. What we *don't* number is the **taxonomy** — the top-level folders. Those two are different decisions; the case against numbering is specifically against numeric *taxonomy* prefixes, not against dated documents.

**What the field does** (this isn't just our opinion): every public company-handbook-as-repo we surveyed uses clean names — GitLab, PostHog, Basecamp, Sourcegraph, 18F: 5/5, zero numbered top-level folders — as do ~90% of AI-agent context repos (AGENTS.md, Cline memory-bank, Cursor rules, gbrain). Numbered taxonomies live in three adjacent worlds whose reasons don't transfer: human-browsed PKM vaults (Johnny.Decimal's own rationale is scanning a file manager), rendered docs sites (Docusaurus/MkDocs use a numeric prefix only as a sidebar sort key — and *strip it from the URL*, proving it's presentation, not identity), and individual decision docs (ADRs — which is document numbering, see above). Anthropic's guidance points the same way: naming conventions "provide important signals… for both humans and agents," and the test for what to keep is "would removing this cause Claude to make mistakes? If not, cut it" — a `02_` prefix fails that test (and costs ~3× the tokens of the bare word).

*When numbered taxonomy prefixes **are** right — the honest flip conditions: the primary interface is a human browsing the raw file tree / an Obsidian vault (not agent-chat + a published browse layer); or the content has a genuine inherent sequence (a curriculum, ordered runbook). A repo built for direct human browsing may reasonably number its folders — that's a different audience, not a contradiction, and numbering is perfectly agent-legible (it's a marginal cost, not a failure). This repo is agent-first, browsed via the agent and curated indexes, with a deliberately-growing taxonomy — so clean names win here.*

## Why Git + Markdown beats a database-backed knowledge store

- **Cheap to run.** No servers, no vector infra.
- **Diffable.** Every change is a PR.
- **Durable.** Markdown from 2015 still reads.
- **Portable.** Every agent tool reads the same files.
- **Searchable.** Grep is fast enough. Agents route via frontmatter `type:`.
- **Agent-readable everywhere.** Plain Markdown is native input for every agent runtime; GitHub renders it for the rare human who reads directly. No docs site to build or maintain.
- **Version-controlled.** `git log` is your audit trail.

## What this architecture deliberately does NOT do

- ❌ Vector database at day 1. Added later if evals demand it.
- ❌ Knowledge graph / entity linking at day 1. Wikilinks are enough for <1000 files.
- ❌ Cross-company context sharing. Three repos for three companies.
- ❌ Auto-promotion of raw content to canonical truth. Inbox → PR → review → merge.
- ❌ Long procedures in `AGENTS.md`. Skills load on demand.
- ❌ Everything-in-one mega-file.
- ❌ Mirroring Linear/Notion/Slack into the repo. Live systems stay live.
- ❌ Two-way sync between the repo and any other surface. Publish *out* to Notion read-only views (one-way); never let edits flow back unreviewed. See [`TEAM-ACCESS.md`](./TEAM-ACCESS.md).

## Evolution path

1. **Month 1–3:** File-native + MCP. Most companies never outgrow this.
2. **Month 4+:** Add **evals** (Braintrust, Langfuse, DIY). Measure retrieval quality.
3. **If evals show misses:** Add **hybrid search**.
4. **If still insufficient:** Add **vector DB** (Chroma, Qdrant, mem0).
5. **If time-series queries dominate:** Add **Zep/Graphiti** temporal graph.
6. **Only at scale:** Dedicated knowledge graph.

Each tier earns its complexity.

## Reference reading

- [GitLab — Handbook-first documentation](https://handbook.gitlab.com/handbook/company/culture/all-remote/handbook-first/)
- [Anthropic — Claude Code best practices (advisory vs deterministic; <200-line entry files)](https://code.claude.com/docs/en/best-practices)
- [OpenClaw — agent workspace & two-tier memory](https://docs.openclaw.ai/concepts/agent-workspace)
- [Garry Tan's gstack — process loop + /learn](https://github.com/garrytan/gstack)
- [Sam Altman — Startup Playbook (north-star metric, metric transparency)](https://playbook.samaltman.com/)
- [Anthropic — Effective context engineering for AI agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
- [Anthropic — Effective harnesses for long-running agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)
- [agents.md — cross-tool standard](https://agents.md)
- [Cline Memory Bank](https://docs.cline.bot/features/memory-bank)
- [Garry Tan's gbrain](https://github.com/garrytan/gbrain)
- [Jesse Vincent's superpowers](https://github.com/obra/superpowers)
- [Chroma — Context Rot research](https://research.trychroma.com/context-rot)
- [Drew Breunig — How Long Contexts Fail](https://drewbreunig.com/2025/06/22/how-contexts-fail-and-how-to-fix-them.html)
- [Harrison Chase — Context engineering for agents](https://blog.langchain.com/context-engineering-for-agents)
