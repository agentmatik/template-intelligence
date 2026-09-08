# Distributors

One file per named distributor or reseller - any organization that **sells the company's products onward**: national/regional distributors, resellers, key retail chains, marketplaces with a managed relationship. This README is the complete contract for generating a distributor file. An agent with no prior context should produce a correct, consistent file from raw data (call transcripts, sales reports, contracts, email threads).

Template: [`../templates/distributor.md`](../templates/distributor.md)

**Boundary vs other folders:** `customers/` = end accounts and sponsors buying for themselves. `distributors/` = channel partners who resell. `suppliers/` = organizations we buy from. If a wholesale account resells meaningfully, it belongs here, not in `customers/`.

---

## When to create a distributor file

Create a file when an organization is:

- An **active distributor/reseller** (signed terms, placing orders)
- An **active channel prospect** (real negotiation on territory/terms, not a cold lead)
- A **former distributor** worth remembering (territory history, why it ended - keep at least 12 months)

**Do NOT create a file for:**

- Cold channel leads with no conversation yet - a line in `sales/pipeline.md`
- Individual people - the contact is a field inside the org's file
- End retail customers who don't resell - those are `customers/`

---

## Filename / slug derivation

Format: `<company-name>.md`, lowercase, ASCII, hyphen-separated, legal suffixes dropped.

- "Acme Distribution s.r.o." -> `acme-distribution.md`
- "Charlie's Outdoor" -> `charlies-outdoor.md`

---

## Frontmatter contract

```yaml
---
type: distributor               # ALWAYS "distributor".
title: "Acme Distribution"      # Display name, quoted.
status: active                  # draft | active | verified | archived
owner: "Matt"
created: 2026-07-07
updated: 2026-07-07
last_verified: 2026-07-07
source_of_truth: manual         # manual | notion | slack | fireflies | granola | gdrive
relationship: distributor       # distributor | reseller | prospect | former. REQUIRED.
territory: "CZ/SK"              # Free text: countries/regions covered.
company: <slug>
audience: internal              # internal by default. Margins/terms stay internal.
tags: []                        # e.g. [cz, exclusive, carp]
---
```

When generating from raw data, default `status: draft` - only a human marks `verified`.

---

## Body structure

Two parts separated by `---`: compiled truth (top, mutable) and timeline (bottom, append-only).

### Compiled-truth block (above the `---`)

| Field | What goes here | How to source it |
|-------|----------------|------------------|
| **Who they are** | One sentence on their business + channel type | Their website, intro call |
| **Our relationship** | distributor/reseller/prospect/former + since-date | Contract date, first order |
| **Territory & exclusivity** | Regions covered, exclusive or not, carve-outs | Contract, negotiation notes |
| **Primary contact** | Name, role, email + what they care about | Email threads, call transcripts |
| **Terms** | Margin/discount tier, payment terms, marketing support | Contract, price list |
| **Performance** | Revenue, sell-through, order cadence, trend | Sales reports, Shoptet/Notion data |
| **Health** | Green / Yellow / Red + one-sentence reason | Order trend + relationship sentiment |
| **Expansion opportunities** | New categories, territories, programs | Meeting notes, stated interest |
| **Risk signals** | Margin pressure, competitor courting them, payment delays | Meeting notes, finance signals |

Keep the whole block under ~800 words. Link to evidence rather than pasting.

### Timeline (below the `---`)

Reverse-chronological dated bullets. Append-only. Log: contract events, term changes, big orders, disputes, territory changes, ended relationships. Cite the meeting note where one exists.

```
- 2026-06-19: Margin discussion FR/EU distributors flagged as EPIC. [[../meetings/2026-06-19-management]]
- 2026-02-01: Signed CZ/SK distribution terms, 35% tier.
```

---

## Quality bar

**Good:** Territory and exclusivity are explicit. Margin tier comes from the contract. Performance cites a number and a period. Risk signals are specific and actionable.

**Bad:** "Big distributor, going well." Invented margins. Mixing up a reselling partner with an end customer.

---

## Edge cases

- **Missing data:** omit the line or `<unknown>`. Never invent margins, territories, or dates.
- **Conflicting sources:** newest wins; note the conflict in the timeline.
- **Prospect -> distributor:** update `relationship` and `status`, add a timeline entry, keep the same file.
- **Relationship ends:** set `relationship: former`, `status: archived`, dated timeline entry with the reason. Keep the file - territory history matters.
- **Overlap with `customers/`:** if a file for the same org already exists in `customers/`, move the content here via PR (a rename/move is SENSITIVE per [`docs/CURATION.md`](../docs/CURATION.md)) rather than duplicating.
- **Terms sensitivity:** margins and exclusivity clauses are `audience: internal` (default).
