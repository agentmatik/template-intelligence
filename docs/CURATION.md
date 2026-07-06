> Template note: paths below use the flat single-company layout. In a company-first repo
> (like vagner-intelligence) prefix entity/time-series paths with `<co>/` and place this file
> at `docs/contracts/curation.md`.

# Curation contract - automated SSOT updates from meeting transcripts

This contract governs the **automated curation loop**: what an agent may write to this repo without human approval, and what requires a PR + Slack approval. It is the single source of the sensitivity tiers - the curator agent reads its rules from THIS file, not from its own prompt, so the mechanism can be copied to any `*-intelligence` repo by copying this file and adjusting the lists.

## Actors

| Actor | What it does | Writes |
|-------|--------------|--------|
| **n8n Knowledge Extract tap** | After each processed meeting, extracts structured facts from the transcript | `inbox/extracted/YYYY-MM-DD-<slug>.md` only (staging, always auto-commit) |
| **Curator agent** (scheduled cloud routine) | Folds uncurated staged facts into canonical files per `docs/contracts/` | SAFE tier: direct commits to `main`. SENSITIVE tier: branch `bot/<slug>` + PR + Slack approval |
| **Human (founder)** | Approves/rejects sensitive PRs via Slack buttons or GitHub | Everything |

## Tier 1 - SAFE (auto-commit to main, no approval)

Roughly 90% of extracted knowledge is pure information basis. The curator commits these directly, always with a source citation:

- `inbox/extracted/**` - staged facts (written by the n8n tap)
- `meetings/**`, `_shared/meetings/**` - meeting notes and distillations (pipeline already writes these)
- **Timeline appends** below the `---` on any existing entity page (`customers/`, `suppliers/`, `distributors/`, `competitors/`, `people/`) - dated, cited, append-only
- **New entity stubs** in those folders, created per their contract with `status: draft` (a human later marks `verified`)
- **Compiled-truth updates** on entity pages whose `status` is `draft` or `active`, when the change is factual, additive, and cited
- Appending a dated, cited item to `eos/issues.md` (issues list is a living intake; prioritization stays human/L10)
- `weekly/**` notes

## Tier 2 - SENSITIVE (branch `bot/<slug>` + PR + Slack approval)

Anything that changes what the company IS, decides, or keeps private:

- `strategy.md`, `company.md`, `brand.md`, `product.md` - the core definition files
- `decisions/**`, `_shared/decisions/**` - new decision records (existing decisions are immutable - never edit, not even via PR)
- `eos/**` except the `issues.md` append case above (Rocks, scorecard, accountability)
- `_shared/finance.md`, `_shared/ops.md`, anything under `_shared/_private/**`
- Any **frontmatter `audience` change** on any file
- Compiled-truth edits on entity pages marked `status: verified` (a human signed that block off)
- Any **delete, rename, or move** of an existing file
- `FACTSHEET.md`, `INDEX.md`, `AGENTS.md`, `CLAUDE.md`, `CONTEXT.md`, `docs/**`, `templates/**`

**Uncertainty rule: when in doubt about the tier, treat it as SENSITIVE.** A wrongly-gated safe fact costs one click; a wrongly-auto-committed strategy change costs trust.

## PR + Slack approval mechanics

- One PR per coherent change-set (not per file), branch `bot/<short-slug>`, never push sensitive changes to `main` directly
- PR body: what changed, why (quote or paraphrase from the source meeting), link `[[meetings/...]]`
- After opening the PR, post an approval message to Slack (the management channel / DM the founder): one-line summary, the key diff lines, Approve / Reject buttons, PR link
- Approve -> the approval workflow merges the PR. Reject -> closes it with a comment. No response -> PR stays open; the next curator run re-pings once, then leaves it

## Hard guardrails (both tiers, non-negotiable)

1. **Cite the source.** Every curated fact links the meeting note it came from. No citation, no write.
2. **Append-only timelines.** Never edit or delete an existing timeline entry; correct with a new dated entry.
3. **Decisions are immutable** once merged.
4. **Never invent** numbers, dates, names, or contract terms. Missing data is omitted or `<unknown>`.
5. **Uncertain facts** get an inline `[VERIFY]` tag and default to the SENSITIVE tier.
6. **Names:** spell brand and person names EXACTLY as the brand spells them (add the brand-specific rule here when instantiating). Preserve diacritics on all proper nouns.
7. **Status discipline:** the curator never sets `status: verified` - only a human does. New bot-created files start as `status: draft`.
8. **Mark provenance:** after folding a staged file, the curator sets `curated: true` (+ `curated_date`) in its frontmatter so no fact is processed twice.
9. **Redaction:** compensation, health, family, and other `_private/`-grade topics found in transcripts are summarized as "sensitive topic discussed - see transcript" and routed SENSITIVE, never quoted verbatim outside `_private/`.

## Staged-facts file shape (`inbox/extracted/`)

Written by the n8n tap, one file per processed meeting:

```yaml
---
type: extracted-facts
source_meeting: "meetings/2026-07-07-management.md"
company: <slug>
date: 2026-07-07
curated: false             # curator flips to true when folded
---
```

Body: one section per fact -

```markdown
## Fact 1
- entity_type: supplier    # supplier | distributor | customer | competitor | person | issue | decision | strategy-signal | other
- entity_name: "Example Factory Co"
- fact: "Lead time increased from 45 to 60 days for Q4 orders"
- quote: "...doba dodání se protáhla na 60 dní..."
- sensitivity_hint: safe   # safe | sensitive - a HINT; the curator's own tiering decides
- confidence: high         # high | medium | low
```
