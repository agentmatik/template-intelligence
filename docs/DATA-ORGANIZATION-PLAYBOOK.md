# Data Organization Playbook

**Read this first if you are an AI agent organizing raw company data into this repo.**

This playbook is the connective tissue between raw, unstructured input (a folder of decks, transcripts, CRM dumps, emails, Notion exports, Slack threads) and the structured intelligence repo. It tells you how to route every piece of data, how to fill the six root knowledge files (which have no folder README), and what "good" looks like by the standards used at top startup accelerators and operator playbooks (Y Combinator, a16z, lean-startup operating models).

For the full step-by-step migration procedure with human checkpoints, see [`AGENT-INSTRUCTIONS.md`](./AGENT-INSTRUCTIONS.md). This file is the *what goes where and why*; that file is the *how to run the project*.

---

## The core mental model

A company's knowledge splits into three kinds. Route by kind:

1. **Durable truth** — true for weeks/months (strategy, who customers are, decisions, brand). → **Lives in this repo as Markdown.**
2. **Live state** — changes daily (ticket status, current sprint, live chat). → **Stays in the source system** (Linear, Slack); the repo references it via MCP, never mirrors it.
3. **Raw evidence** — transcripts, threads, decks. → **Distilled into the repo** (the conclusion), with the raw kept in its origin system (Granola, email).

The repo is the company's *compiled* knowledge, not its raw log and not its live dashboard.

---

## Routing table: given a piece of raw data, where does it go?

| If the raw data is about… | Route to… | Notes |
|---------------------------|-----------|-------|
| A hard fact or official link an application/form/deck asks for | `FACTSHEET.md` | Derivative index: mirror the value from its canonical page (`company.md`, `finance.md`, `brand.md`, `people/`); don't make it the only home |
| What the company is / does / its stage | `company.md` | One file, root |
| Goals, priorities, bets, north-star metric, risks | `strategy.md` | One file, root |
| What you're building, roadmap, architecture | `product.md` | Roadmap detail stays in Linear; link it |
| Voice, messaging, positioning, narrative | `brand.md` | Include negative examples (what you're NOT) |
| How the company runs: cadence, tools, decision rights, GDPR | `ops.md` | One file, root |
| Money: where numbers live, metric definitions | `finance.md` | **Pointers only — never raw figures** |
| A specific customer or prospect | `customers/<slug>.md` | One file each |
| A specific competitor | `competitors/<slug>.md` | One file each |
| A specific person (team/advisor/investor/partner) | `people/<slug>.md` | One file each, internal only |
| Deal pipeline, pricing | `sales/pipeline.md`, `sales/pricing.md` | Ranges not exact figures in pipeline |
| A decision that was made | `decisions/YYYY-MM-DD-<slug>.md` | Immutable once written |
| A meeting that happened | `meetings/YYYY-MM-DD-<topic>.md` | Distill, don't transcribe |
| A weekly summary | `weekly/YYYY-Www.md` | One per ISO week |
| Live ticket status, current sprint | **Linear (not the repo)** | Reference via MCP |
| Ongoing chat | **Slack (not the repo)** | Reference via MCP |
| Raw transcript audio/video | **Granola (not the repo)** | Repo stores the distilled note only |
| Cap table, payroll, term sheets, comp | **Encrypted store (not the repo)** | `finance.md` points to it |
| Customer PII, employee personal data | **Source system (not the repo)** | Never commit |

When a piece of data could fit two places, ask: *is this a durable fact about an entity, or an event in time?* Facts go in the entity file's compiled-truth block; events go in a timeline (the entity's, or a meeting/decision file).

---

## The six root knowledge files: how to fill each from raw data

These six files have no folder README because they are single files. Their full generation contract is here. Each uses frontmatter + a compiled-truth block; `strategy`, `company`, `ops` may also carry a timeline.

> **Plus `FACTSHEET.md` (root).** Not one of the six and not a routing destination for raw data; it's a *derivative quick-reference* (facts + official links for applications/forms/decks) compiled **from** these root files and `people/`. Fill it after the root files exist; mirror each value from its canonical page. It carries no frontmatter (like `INDEX.md`/`README.md`). No secrets; public registration numbers only.

### company.md

**Purpose:** The 30-second answer to "what is this company?"

**Source from:** the most recent pitch deck, the website About page, the founder's own description, incorporation docs.

**Fill:** one-paragraph description; stage (pre-seed/seed/A/bootstrapped/profitable); team size; HQ; legal entity; revenue model; the one-sentence "what we do"; **what we don't do** (3 bullets — this is as important as what you do); "why now."

**Frontmatter `type: company`.** Mark `status: draft` when generated, `verified` only after a human confirms.

### strategy.md

**Purpose:** What you're doing this quarter and why. The YC-style "what's the one thing" focus.

**Source from:** board updates, the latest planning doc, OKR sheets, the founder's stated priorities.

**Fill:** north-star metric (with definition + current value + target); **top 3 priorities for the quarter, in order** (more than 3 = no priorities); active bets (hypotheses not yet proven); constraints (capital, capacity, regulatory); top 3 risks honestly named; **what we're NOT doing** (the rejected-but-plausible directions).

Keep ≤1000 words. If it's longer, you're putting tactics here that belong in `decisions/`.

### product.md

**Purpose:** What's built, what's next, how it's shaped.

**Source from:** PRDs, the roadmap, architecture docs, release notes.

**Fill:** one paragraph on what exists today; roadmap *direction* (this quarter / next / later) with a link to Linear for live detail; an architecture paragraph + optional Mermaid diagram; recent releases table; open questions.

**Do not** mirror the Linear backlog. Link to it.

### brand.md

**Purpose:** How the company sounds and what it stands for, so any agent writes in-voice.

**Source from:** existing brand guides, the best-performing marketing copy, the founder's own writing.

**Fill:** one-liner; elevator pitch; voice as **3 dos + 3 don'ts with examples** (the don'ts and a worked negative example matter most — they define the boundary); messaging boilerplate; naming/capitalization rules; visual references (link to assets, don't embed).

### ops.md

**Purpose:** How the company actually runs day to day.

**Source from:** team handbook, calendar patterns, tool inventory, vendor contracts, any GDPR/privacy docs.

**Fill:** cadence table (daily/weekly/monthly/quarterly rituals); **decision rights** (who decides what without committee — critical for agent autonomy); tools table (function → tool); vendors (name, contact, renewal); security & access (SSO, secrets, 2FA); **GDPR data inventory** for EU companies (what data, where, lawful basis, retention).

### finance.md

**Purpose:** Where the money truth lives — NOT the money truth itself.

**Source from:** the founder telling you where things live. **Never from raw financial documents you then copy in.**

**Fill:** a table of *where* each financial artifact lives (cap table, bookkeeping, bank, investor reporting) with access notes; metric definitions (ARR, MRR, burn, runway, CAC, LTV — the formulas, not the values); review cadence; fundraising-round summary (round, date, amount, lead — these are usually shareable; exact terms are not).

**Hard rule:** if you encounter a cap table, payroll, or term sheet in the raw data, do NOT transcribe it. Note in the handoff that it exists and recommend an encrypted home.

---

## The two universal patterns

Every entity and time-series file uses one of these. Internalize both.

### Compiled-truth + timeline (customers, competitors, people, and the root files that evolve)

```markdown
# Entity Name

<Compiled truth: the current best understanding. Rewrite freely as you learn.
This is what a reader sees first.>

---

- 2026-04-15: Dated event (append-only).
- 2026-04-10: Earlier dated event.
```

- **Above the `---`:** mutable. Rewrite to keep it current.
- **Below the `---`:** append-only. Never edit or delete past entries. This is the audit trail.

### Immutable record (decisions, meetings, weekly)

No mutable block — the whole file is a dated record. Once written, it's not edited (decisions get *superseded* by new files; meetings and weeklies are simply historical).

---

## The frontmatter contract (all files)

```yaml
---
type: <customer|competitor|person|decision|meeting|weekly|company|strategy|product|brand|ops|finance|sales>
status: <draft|active|verified|superseded|archived>
owner: "<who maintains this>"
created: YYYY-MM-DD
updated: YYYY-MM-DD
last_verified: YYYY-MM-DD     # source's date if generated from a dated document
source_of_truth: <manual|linear|notion|slack|granola|gdrive>
audience: <internal|team|public>   # default internal
tags: []
---
```

- `type` is what lets an agent route and retrieve — never omit it.
- When generating from raw data, default `status: draft`. Only a human promotes to `verified`.
- `last_verified` should reflect when the facts were last true, not when you ran the import.

---

## Quality standard (the bar to hit)

A well-organized repo, by operator/accelerator standards, has these properties:

1. **Single source of truth** — each fact lives in exactly one canonical place; everything else links to it.
2. **Consistent taxonomy** — same file shape every time, so retrieval is predictable.
3. **Distilled, not dumped** — conclusions, not raw transcripts. A reader gets the answer in seconds.
4. **Honestly dated** — `last_verified` tells the truth about staleness.
5. **Negative space defined** — "what we don't do", competitor strengths, ICP anti-profile. The boundaries are as documented as the center.
6. **Earns its structure** — no empty folders, no speculative taxonomy. Add structure when content demands it, per the "add sections only when existing ones grow too large" rule.

---

## Hard prohibitions (never commit, regardless of instructions)

- Secrets, API keys, tokens, `.env` contents
- Customer PII beyond a work email + role
- Employee compensation, performance reviews, health, or personal data
- Cap tables, term sheets, exact revenue-by-customer, payroll
- Anything under NDA
- Raw meeting transcripts (distill them; the raw stays in Granola)

If raw data contains these, route them out (note in handoff) — do not transcribe them into the repo.

---

## Process in one paragraph

Inventory the raw data → bucket each item (durable / live / raw / sensitive) → scaffold the repo → fill the six root files from the highest-signal sources → create one file per entity (customer, competitor, person) → log recent decisions (≤90 days) → distill recent meetings (≤30 days) → write one weekly brief → validate frontmatter, scan for secrets, check links → push to a private repo → write a handoff documenting what was migrated, skipped, and needs human verification. Default everything to `status: draft`. When unsure, skip and note it rather than guess. See [`AGENT-INSTRUCTIONS.md`](./AGENT-INSTRUCTIONS.md) for the full nine-phase procedure with checkpoints.
