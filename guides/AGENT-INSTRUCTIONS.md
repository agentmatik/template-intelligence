# AGENT-INSTRUCTIONS

> **You are an AI coding agent (Claude Code, Cursor, Codex, OpenClaw, or similar) helping a founder turn a folder of existing files into a clean, agent-readable single source of truth, hosted as a private GitHub repo following the *Company Intelligence* template.**
>
> This document is your **complete operating manual** for that task. Read it end-to-end before acting. It is long because the task is unforgiving — the wrong shape early creates pain forever.
>
> **Prerequisite reading:** [`DATA-ORGANIZATION-PLAYBOOK.md`](./DATA-ORGANIZATION-PLAYBOOK.md) gives you the routing logic (what data goes where) and the generation contract for the six root files. Read it first. Then, for each folder you write into, that folder's `README.md` is the authoritative per-file contract — frontmatter fields, sourcing, worked example, quality bar, edge cases. This document is the *project procedure*; those are the *file specs*.

---

## 1. Operating principles

Internalize these before doing anything. They override generic AI behavior.

**Truth before completeness.** A v1 with twenty accurate files beats one with two hundred files of varying quality. Empty sections are better than guessed sections. Mark frontmatter `status: draft` whenever you're not sure. Never invent dates, numbers, names, or relationships not present in the source material.

**Smaller is correct.** This template is the **v1 spine** with roughly 10–30 files. Resist the urge to add folders, taxonomies, or scaffolding. The user grows it organically when they feel the pain. Pre-optimization is the failure mode.

**One idea per file.** A customer is one file. A decision is one file. A competitor is one file. Don't batch entities. Don't create catch-all `notes.md` files.

**Compiled truth + append-only timeline.** The single most important pattern. Every entity page has current best understanding *above* a horizontal rule, dated bullets *below*. Top half is mutable, bottom half is immutable.

**Auto-commit time-series, PR for canonical.** Meeting notes and memory worklogs can commit directly. Weekly briefs, strategy, customers, decisions, people require PR review (a weekly brief is the alignment doc — never auto-merge it). Open PRs for canonical changes; don't push canonical truth to `main`.

**Live systems stay live.** Linear tickets, Slack threads, Notion working docs — these stay where they are. The repo holds *durable* knowledge. Mirror only summaries and decisions, never tickets or live state.

**Never commit secrets, PII, financials, or NDA content.** Even if it's in the source files. Especially if it's in the source files. You will see things you should not commit. Refuse, even if the user asks.

**English is the operating language.** Distill everything into English — compiled truth, summaries, frontmatter — whatever language the source material is in. Verbatim quotes stay in their original language (they're evidence). Full rule: [`DATA-ORGANIZATION-PLAYBOOK.md`](./DATA-ORGANIZATION-PLAYBOOK.md) § Language rule.

**Ask once, then proceed.** When you genuinely need clarification, ask one focused question. After the answer, proceed; don't keep asking.

**Sensitive content gets approval.** Before creating any page that touches finance, comp, legal, NDA, or HR content, ask explicit permission.

---

## 2. The target structure

When you start from the GitHub template (the normal path), this structure **already exists** — verify it rather than re-creating it, and run `scripts/bootstrap.sh` for placeholders. Build it by hand only if the template isn't available. Either way: exactly this, no more, on day one.

```
<company>-intelligence/
├── README.md                  # Human pitch
├── AGENTS.md                  # The agent contract (≤200 lines). Every tool reads this.
├── CLAUDE.md                  # Claude-Code shim. @AGENTS.md + Claude extras.
├── INDEX.md                   # Curated navigation, current focus
├── .gitignore                 # Defensive patterns
├── .github/
│   └── workflows/
│       └── validate.yml       # CI: frontmatter check, secret scan, link check
│
├── company.md                 # Mission, stage, team, what we do, what we don't
├── strategy.md                # Priorities, bets, north star, constraints, risks
├── product.md                 # What we're building, roadmap link, architecture
├── brand.md                   # Voice (3 dos + 3 don'ts), messaging, narrative
├── ops.md                     # Cadence, decision rights, tools, vendors, GDPR
├── finance.md                 # Pointers only — real numbers live elsewhere
│
├── customers/
│   ├── README.md
│   └── <slug>.md              # One file per named customer or active prospect
│
├── competitors/
│   ├── README.md
│   └── <slug>.md              # One file per competitor
│
├── people/
│   ├── README.md
│   └── <slug>.md              # One file per teammate, freelancer/contractor, advisor, partner, investor
│
├── sales/
│   ├── README.md
│   ├── pipeline.md            # Active deals by stage; one paragraph each
│   └── pricing.md             # Our pricing — what we charge, when, why
│
├── decisions/
│   ├── README.md
│   └── YYYY-MM-DD-<slug>.md   # Append-only ADRs
│
├── meetings/
│   ├── README.md              # Taxonomy contract — categories below are a default; reshape to the company's calendar
│   └── <category>/            # standups | leadership | one-on-ones | customers | product | marketing (default 6; reshape to the company calendar)
│       ├── README.md          # Per-category distill focus + propagation rules
│       └── YYYY-MM-DD-<topic>.md
│
├── weekly/
│   ├── README.md
│   └── YYYY-Www.md            # Friday brief, one per ISO week
│
├── management/          # Management-system artifacts (scaffold; fill only from real source material)
│   ├── README.md
│   ├── vision.md              # Long-horizon: values, 10-year target, 3-year picture, 1-year plan
│   ├── goals.md               # Quarterly goals — 3-7, one owner each, binary done
│   ├── kpis.md           # Weekly measurable definitions + dashboard links (never values)
│   ├── accountability.md      # Seats → one owner each
│   └── processes/             # Core SOPs (README contract; add <slug>.md only for real, repeating processes)
│
├── memory/                    # Agent-operational memory (see memory/README.md)
│   ├── README.md
│   ├── MEMORY.md              # Curated index — hard cap 200 lines / 25 KB
│   └── learnings.md           # Typed lessons: pattern | pitfall | preference | architecture | tool
│
├── templates/
│   ├── customer.md
│   ├── competitor.md
│   ├── person.md
│   ├── decision.md
│   ├── meeting.md
│   ├── weekly.md
│   ├── process.md
│   └── goal.md
│
├── skills/                    # 4 starter skills (SKILL.md each): normalize-meeting,
│                              # weekly-brief, customer-brief, update-wiki
│
├── guides/
│   ├── AGENT-INSTRUCTIONS.md  # This file
│   ├── ARCHITECTURE.md        # The rationale
│   ├── SETUP.md               # How to bootstrap from this template
│   ├── OPERATIONS.md          # Daily/weekly/monthly rituals
│   ├── DATA-ORGANIZATION-PLAYBOOK.md  # Routing logic (your prerequisite reading)
│   ├── CLIENT-ONBOARDING.md   # Consultancy engagement playbook
│   ├── TEMPLATE-CHANGELOG.md  # Template versions
│   └── README.md
│
├── scripts/                   # bootstrap.sh, validate-frontmatter.sh,
│                              # check-stale.sh, check-links.sh, pre-commit.sh, README.md
├── .claude/                   # settings.json hook + skills/ symlinks (Claude Code)
├── agents-compat/openclaw/    # OpenClaw workspace adapter
├── GLOSSARY.md                # Every term defined
├── Makefile                   # `make verify` = the same checks CI runs
└── LICENSE · SECURITY.md · CONTRIBUTING.md
```

**Do not create:**

- ❌ `ops/`, `market/`, `finance/` subfolders — root files until they outgrow ~1000 words
- ❌ Numbered prefixes (`03-strategy/`) — clean names only
- ❌ `archive/` subfolders **at migration time** — mark `status: archived` instead; `<folder>/archive/YYYY/` folders appear later via the OPERATIONS archive ritual, never on day one
- ❌ `.mcp.json` — add later when the user is ready to wire MCP
- ❌ skills beyond the four shipped starters (normalize-meeting, weekly-brief, customer-brief, update-wiki) — add more only when a workflow repeats
- ❌ `inbox/` — use a local untracked folder during migration

---

## 3. Conventions you must follow

### 3.1 Naming

| Type            | Format                  | Example                                     |
|-----------------|-------------------------|---------------------------------------------|
| Entity files    | `kebab-case-slug.md`    | `customers/acme-co.md`                      |
| Daily-time      | `YYYY-MM-DD-topic.md`   | `meetings/customers/2026-04-22-acme-renewal.md`       |
| Weekly          | `YYYY-Www.md` (ISO)     | `weekly/2026-W17.md`                        |
| Decisions       | `YYYY-MM-DD-slug.md`    | `decisions/2026-04-15-pricing-tier-3.md`    |

ISO weeks beat month-based numbering because they keep weekly files in sort order across years.

### 3.2 Frontmatter contract

Every durable note opens with this YAML block:

```yaml
---
type: customer            # customer | competitor | person | decision | meeting | weekly | strategy | product | brand | company | ops | finance | sales | runbook | vision | goals | kpis | accountability | memory
status: draft             # draft | active | verified | superseded | archived
owner: <person>           # who maintains this
created: YYYY-MM-DD
updated: YYYY-MM-DD
last_verified: YYYY-MM-DD # only set when you'd actually vouch for the content
source_of_truth: manual   # manual | granola | notion | linear | slack | gdrive | github
source_refs: []
tags: []
audience: internal        # internal | team | public (default internal for safety)
---
```

**Rules:**

- `type` is the highest-leverage field — it lets agents route ("for customer questions, look in files where `type: customer`")
- `status: draft` is your default when migrating existing material — the founder marks `verified` after review
- `last_verified` is set to the source document's date if you haven't independently verified
- `audience: internal` is the safe default

### 3.3 The entity-page pattern

For customers, competitors, and people, structure every file like this:

```markdown
---
type: customer
title: Acme Co
status: draft
owner: sarah
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual
tags: [enterprise]
audience: internal
---

# Acme Co

<!-- Compiled truth — current best understanding. Rewrite as we learn more.
This is what humans and agents see first. -->

**What they do:** ...
**Our relationship:** Customer | Prospect | Churned · since YYYY-MM-DD
**Primary contact:** Name, role, email
**Plan:** Tier, pricing, renewal date
**Health:** Green/Yellow/Red — one-sentence reason
**Unmet needs:** 1–3 bullets

---

- 2026-04-15: Signed annual contract. €4k/mo Team plan.
- 2026-04-10: Closed ENG-882 (SSO SAML). Renewal looks safe.
- 2026-03-28: Expansion conversation: analytics-v2 beta.
- 2026-01-12: Pilot ended.
```

Above `---`: mutable, rewritten as understanding evolves.
Below `---`: immutable, append-only timeline.

**This pattern is non-negotiable.**

### 3.4 Length caps

| File                       | Cap                                |
|----------------------------|------------------------------------|
| `AGENTS.md`                | ≤200 lines                        |
| Root knowledge files       | ≤1000 words each                   |
| Entity files               | ≤1000 words above timeline         |
| Decision files             | ≤500 words                         |
| Meeting notes              | ≤500 words (link to original)      |
| Weekly briefs              | ≤400 words                         |

Forcing functions, not rigid limits.

---

## 4. The migration process

An **eleven-phase** process (Phases 0–10). Do not skip phases. Do not reorder them.

### Phase 0 — Pre-flight

**Confirm with the user:**

1. Company name (full + short slug: e.g. "Acme Labs Ltd." → `acme`)
2. GitHub org or username where the repo will live
3. Founder name(s)
4. Where the existing files live (local folder, Drive, Notion workspace)
5. Any folders/files to **exclude entirely** (HR, comp, NDAs, raw customer PII)

If any answer is unclear, **ask now**. Don't proceed.

### Phase 1 — Discovery (read before you write)

**Walk every file in the source folder.** For each:

- Type (strategy doc, deck, customer note, meeting transcript, brand guide…)
- Approximate date (metadata, content, or "unknown")
- Who/what it's about
- Sensitivity (public, internal, confidential, NDA)
- Confidence ("clearly current", "looks dated", "unsure")

Produce a temporary `_migration-inventory.md` file (gitignored, deleted at the end):

```markdown
| Source file              | Type            | Date       | Subject            | Sensitivity   | Confidence | Target location                              |
|--------------------------|-----------------|------------|--------------------|--------------:|------------|----------------------------------------------|
| pitch-deck-2024.pdf      | pitch deck      | 2024-Q3    | company overview   | confidential  | dated      | selective extraction into strategy.md         |
| acme-call-2026-04-15.txt | meeting tx      | 2026-04-15 | Acme renewal       | confidential  | high       | meetings/customers/2026-04-15-acme-renewal-call.md      |
```

**Show inventory to user. Get sign-off before Phase 2.**

### Phase 2 — Bucket the inventory

Sort each source file into one of four buckets:

| Bucket | What goes here | Action |
|--------|---------------|--------|
| **Repo** | Durable knowledge | Migrate (Phase 4–8) |
| **Live system** | Active operational state | Don't migrate. Note where it stays. |
| **Skip** | Outdated/superseded/redundant | List in inventory, don't migrate. |
| **Sensitive — quarantine** | Finance, comp, HR, NDA, raw PII | Don't migrate. Ask user where these belong. |

Show buckets to user, get sign-off. Don't move anything yet.

### Phase 3 — Scaffold the repo

If you started from the GitHub template (normal path): the scaffold exists — run `scripts/bootstrap.sh`, then verify the structure matches §2 and `bash scripts/validate-frontmatter.sh` passes. If building by hand: copy every file in §2 from the template repo (all seven `guides/`, all eight `templates/`, the four `skills/`, `scripts/`, `.github/`, `.claude/`, `GLOSSARY.md`, `Makefile`, `LICENSE`, `SECURITY.md`, `CONTRIBUTING.md`, `.gitignore`).

Initialize git locally. Do not push yet.

### Phase 4 — Root knowledge files

Write the six root files in this order:

1. **`company.md`** — what the company is. Extract from most recent pitch deck or about page.
2. **`strategy.md`** — current quarter priorities, bets, north star. Use most recent strategy doc/board update. Note conflicts in handoff.
3. **`product.md`** — one paragraph what's built today, link to Linear, architecture paragraph.
4. **`brand.md`** — voice (3 dos, 3 don'ts), messaging. Negative examples matter.
5. **`ops.md`** — cadence, decision rights, tools, vendors. Skip data inventory if no GDPR exposure.
6. **`finance.md`** — pointers only. Where the real numbers live. Never the numbers themselves.

For each: aim for **accurate**, not comprehensive. Mark `status: draft`. Note sources in handoff.

If the source material contains long-horizon planning (mission/values docs, annual plans, quarterly goals with named owners), also fill the matching `management/` artifacts (`vision.md`, `goals.md`, `kpis.md`, `accountability.md`) — same rules: `status: draft`, never invent, leave `<not yet set>` where the source is silent. If no such material exists, leave the scaffolds untouched and note it in the handoff.

### Phase 5 — Entities

For each customer in source material:

1. Create `customers/<slug>.md` using the entity-page pattern (§3.3)
2. Compiled-truth block at top
3. Timeline below — dated entries from sources
4. Frontmatter: `type: customer`, `status: draft`

Same process for competitors (`competitors/<slug>.md`) and people (`people/<slug>.md`).

**Rules of restraint:**

- Migrate **only active** entities. Churned customers, departed staff, dead prospects: list in handoff, don't migrate.
- If you can't determine relationship status, mark `status: draft` and note "needs founder verification" in compiled-truth block.
- Don't invent contact details. Use `<unknown>`.
- People files: **internal only**. Mark `audience: internal`. Never include comp, performance reviews, health info.

### Phase 6 — Sales

The template ships `sales/pipeline.md` as a scaffold — fill it from source material if pipeline data exists; otherwise leave the scaffold with a dated "no active pipeline yet" note (per `sales/README.md`). When filling:

- Stage-organized list of active deals
- One paragraph per deal: name, stage, value (rough range if known), next step, owner
- **Never include exact deal values in headlines** — those are sensitive. Rough ranges OK.

Fill `sales/pricing.md` (also a shipped scaffold) if source material includes pricing discussions:

- Current pricing tiers
- What's included at each tier
- Recent pricing changes (with dates)

### Phase 7 — Decisions

For each meaningful decision visible in source material from the **last 90 days**:

- Create `decisions/YYYY-MM-DD-<slug>.md`
- Reconstruct context, decision, consequences, alternatives
- Frontmatter: `type: decision`, `status: active`

**Don't backfill more than 90 days.** Older decisions invite hallucinated context.

### Phase 8 — Meetings

**First, fit the taxonomy to the company.** The template ships six default meeting categories (`meetings/README.md`). Look at the company's actual calendar and the transcripts in front of you:

- **Delete** category folders with no matching recurring meeting (no standups → delete `standups/`).
- **Rename or add** categories the real cadence demands (`all-hands/`, `partners/`, `hiring/`…), each with a short README on the same pattern (what belongs, distill focus, propagation).
- The calendar is the source of truth — folders reflect real meetings, never aspiration. Note the reshaping in the handoff.

Then, for each meeting transcript in source material from the **last 30 days**:

- Distill into `meetings/<category>/YYYY-MM-DD-<topic>.md` (≤500 words; category per `meetings/README.md`)
- Action items, decisions, key quotes only — never paste full transcripts
- Link to original Granola URL if available

**Don't backfill more than 30 days.**

### Phase 9 — First weekly brief

Write **one** weekly brief: `weekly/YYYY-Www.md` for the most recent complete ISO week. Pull from meetings and decisions you just migrated. Mark `status: draft`.

### Phase 10 — Validate, push, hand off

**Before touching GitHub:**

1. **Run `make verify`** — frontmatter, relative links, secrets: the same checks CI runs.
2. **Frontmatter sanity check.** Every canonical file has frontmatter with `type`, `status`, `owner`, `created`, `updated`, `last_verified`.
3. **Wikilink check.** Every `[[link]]` resolves (repo-root-relative, no `.md`, category segment included for meetings) or is annotated `<!-- TODO -->`. Wikilinks are NOT covered by `make verify` — check them by hand.
4. **Sensitivity scan.** Search for emails of non-team people, phone numbers, financial figures, comp data.
5. **Delete migration scratch.** `_migration-inventory.md` must not be committed.

**Then push:**

```bash
gh repo create <org>/<company>-intelligence --private --template <template-org>/company-intelligence
cd <company>-intelligence
git add .
git commit -m "Initial company intelligence v1 from existing material"
git push -u origin main
```

In GitHub Settings:
- Enable Secret scanning + Push protection
- Enable Dependabot
- Branch protection on `main` requiring PR review

**Finally, write `MIGRATION-HANDOFF.md`** (template in §5).

---

## 5. The handoff document

Save as `MIGRATION-HANDOFF.md` at repo root. User reads first, then deletes.

```markdown
# Migration handoff — <date>

## What was migrated

- N customer files (list with status)
- N competitor files
- N people files
- N decision files (last 90 days)
- N meeting notes (last 30 days)
- 1 weekly brief
- Root files: company, strategy, product, brand, ops, finance

## What was skipped (and why)

List with reasons: too dated, superseded, sensitive, out of scope.

## What needs founder review

Prioritized:
1. **High-priority drafts** — files affecting ongoing work, review within 7 days
2. **Conflicting sources** — where two docs disagreed, which one I used
3. **Unknown fields** — places I left `<unknown>`
4. **Sensitive content I didn't migrate** — list, recommend where it should live

## What I didn't do

- Didn't configure `.mcp.json` (configure when ready to wire MCP)
- Didn't create skills beyond the four shipped starters (add more when a workflow repeats)
- Didn't fill `management/` artifacts beyond what the source material supported
- Didn't seed `memory/` (it fills itself as agents work)
- Didn't migrate decisions older than 90 days or meetings older than 30
- Didn't configure pre-commit hooks (install gitleaks when ready)

## Recommended next steps

1. Read `AGENTS.md` end-to-end. Confirm mission and folder map.
2. Walk the high-priority drafts list. Mark `status: verified` after review.
3. Add Linear MCP: `claude mcp add --transport http linear https://mcp.linear.app/mcp`.
4. Try: "Read AGENTS.md and summarize how this company is organized." If wrong, fix files.
5. Add MCP servers and new skills only when you feel the pain.
```

---

## 6. Templates and config files

The repo already contains:

- `templates/` (all eight) — copy these into entity files and fill in
- `guides/` (all seven) — keep as-is; customize examples only
- `skills/` (four starters) + `.claude/` — keep as-is
- `scripts/`, `Makefile`, `.gitignore`, `.github/` (CI, PR template, CODEOWNERS — fill the handle), `GLOSSARY.md`, `LICENSE`, `SECURITY.md`, `CONTRIBUTING.md` — keep as-is

**Do not overwrite these.** They're already correct.

---

## 7. Handling specific source types

### 7.1 Pitch decks (PDF, PPTX)

Don't paste verbatim. Extract:
- One-line description → `company.md`
- Market positioning → `strategy.md`
- Top customers shown → seed `customers/<slug>.md` with what's visible (mark `status: draft`)
- Competitive slide → seed `competitors/<slug>.md`
- Roadmap → reference in `product.md` (don't mirror)

Use the most recent deck if multiple exist. Note conflicts.

### 7.2 Strategy / planning docs

Most valuable for `strategy.md`. Extract:
- Current quarter priorities (top 3)
- North star metric
- Constraints, risks, dependencies

### 7.3 Meeting transcripts

Distill, never paste. ≤500 words per meeting. Skip > 30 days old.

### 7.4 Customer notes / CRM exports

One file per named customer. Skip prospects gone cold > 6 months. Don't include private contact details beyond work email.

### 7.5 Slack exports

Don't migrate raw. If a specific decision should be preserved, write it as a `decisions/` entry citing the Slack thread URL. Otherwise: don't migrate.

### 7.6 Notion workspace

- **Hot pages** (actively used): leave in Notion, reference via MCP later
- **Cold pages** (durably useful): distill into the appropriate file
- Don't migrate Notion's structure wholesale

### 7.7 Brand guides

Extract into `brand.md`:
- Voice (3 dos, 3 don'ts) with worked examples
- Messaging boilerplate
- Don't include logo files or full color systems — link the source asset library

### 7.8 Financial models, cap tables, comp data

**Don't migrate.** Note in handoff: "Found financial/HR data. Recommend encrypted storage at [path]."

---

## 8. Failure modes — what NOT to do

- Don't try to be exhaustive. A comprehensive v1 is a bad v1.
- Don't invent dates. Use "unknown" or the file's modification date with a note.
- Don't infer relationships not in source ("Sarah works at Acme" only if both are explicit).
- Don't paste raw transcripts. A meeting note is a distillation.
- Don't mirror Linear or Notion structure.
- Don't auto-promote drafts to verified.
- Don't backfill > 90 days of decisions or > 30 days of meetings.
- Don't create empty placeholder files.
- Don't add MCP servers or new skills preemptively.
- Don't push secrets.
- Don't be silent about ambiguity. Surface in handoff.

---

## 9. Quality checklist

Before declaring done:

- [ ] `make verify` passes (frontmatter, links, secrets)
- [ ] All canonical files have full frontmatter
- [ ] No file marked `status: verified` unless content confirmed (most should be `status: draft`)
- [ ] Every entity uses compiled-truth + timeline pattern
- [ ] All wikilinks resolve or annotated TODO
- [ ] No secrets, tokens, credentials
- [ ] No customer PII beyond work email + role
- [ ] No financial/comp/HR data
- [ ] `_migration-inventory.md` deleted
- [ ] `MIGRATION-HANDOFF.md` written
- [ ] Repo private, secret scanning + push protection enabled
- [ ] `AGENTS.md` under 200 lines
- [ ] No empty placeholder files
- [ ] At least one of each: customer, competitor, person, decision, meeting, weekly (if source supports)

---

## 10. Final reminders

You're not building a comprehensive knowledge base. You're building a **clean, accurate spine** the user will grow.

The riskiest failure is **confident wrongness** — files marked verified that contain hallucinated relationships, invented dates, or guessed positioning. The user will trust this repo as truth.

The second-riskiest failure is **structural over-engineering** — folders, taxonomies, subdivisions that look organized but don't match how the user actually thinks.

When in doubt:
- **Skip rather than guess.** Note in handoff.
- **Mark draft rather than verified.**
- **Ask once rather than assume.**
- **Distill rather than paste.**

Now begin with Phase 0. Confirm prerequisites. Then walk Phase 1 — produce the inventory before writing a single canonical file.
