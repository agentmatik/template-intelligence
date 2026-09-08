# Sales

Pipeline by stage, pricing, and active deals worth tracking. This README is the complete contract for generating the two sales files from raw data (CRM exports, call transcripts, proposals, order forms).

Two files live here:
- `pipeline.md` - active deals, organized by stage
- `pricing.md` - what you charge, when, why; pricing-change log

---

## pipeline.md

A single file (not one-per-deal) listing active opportunities grouped by stage. Deals that close-won graduate to a full `customers/<slug>.md` file; close-lost get a timeline entry then get pruned from the active list.

### When a deal belongs in pipeline.md

- There's been real contact (a call, a demo, a proposal) - not just a cold lead
- The deal is live (not won, not dead)
- It's worth the founder knowing about in a weekly review

Cold leads with no contact stay in your CRM, not here.

### Frontmatter

```yaml
---
type: sales
title: "Pipeline"
status: active
owner: "{{FOUNDER_NAME}}"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual         # or "linear" / CRM if synced
audience: internal              # ALWAYS internal - sales-sensitive
tags: []
---
```

### Body structure

Group by stage. Common stages (adapt to your funnel): `Discovery → Qualified → Proposal → Negotiation → Closing`. Under each, one short paragraph per deal:

```markdown
## Negotiation

### Beta Industries - €30-50k ARR - owner: Matt
Manufacturing SME, 200 staff. Proposal sent 2026-04-10. Champion is their COO.
Sticking point: wants quarterly billing. Next step: revised terms by 2026-04-25.
```

**Value discipline:** use **rough ranges** ("€30-50k ARR"), never exact contract figures, in pipeline headlines. Exact numbers live in the order form / CRM.

### Stage transitions

- **Won:** create `customers/<slug>.md`, add a timeline entry there, remove from pipeline active list (optionally log in a `## Closed-won` section with date).
- **Lost:** move to a `## Closed-lost` section with date + one-line reason, then prune after the next monthly review. The reason is gold for `strategy.md` and competitor files.

---

## pricing.md

How you price, what's included at each tier, and a dated log of pricing decisions.

### Frontmatter

```yaml
---
type: sales
title: "Pricing"
status: active
owner: "{{FOUNDER_NAME}}"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual
audience: internal
tags: [pricing]
---
```

### Body structure

```markdown
# Pricing

## Current tiers

| Tier | Price | Includes | Best for |
|------|-------|----------|----------|
| Starter | €X/mo | ... | ... |
| Team | €Y/mo | ... | ... |
| Enterprise | Custom | ... | ... |

## Discount policy

When and how much you'll discount. Annual-prepay, multi-year, design-partner terms.

## Packaging rationale

Why the tiers are structured this way. What the value metric is (seats, usage, etc.).

---

- 2026-04-01: Raised Team tier €3k → €4k/mo. Grandfathered existing customers 6 months.
```

The timeline (below `---`) logs every pricing change with date and rationale - invaluable when a customer asks "why did my price change?"

---

## Sourcing from raw data

| Field | Where it comes from |
|-------|--------------------|
| Deal stage | CRM stage field, or inferred from latest call ("they asked for a proposal" = Proposal stage) |
| Deal value | Proposal, order form, stated budget. Convert to a range. |
| Champion | Who you've been emailing/calling |
| Next step | Last call's action items, follow-up email |
| Current tiers | Website pricing page, order forms, sales deck |
| Pricing history | Old proposals, billing changes, founder's memory |

---

## Quality bar

**Good:** Every deal has a stage, a rough value, an owner, and a concrete next step with a date. Pricing tiers match what's actually on order forms.

**Bad:** Deals with no next step (dead weight). Exact figures exposed in headlines. A pricing table that contradicts the website. Stale deals that closed months ago still in "active."

---

## Edge cases

- **No pipeline yet** (pre-revenue): create `pipeline.md` with a note "No active deals yet" rather than omitting the file, so the structure is ready.
- **Conflicting deal value across sources:** use the most recent proposal; range it.
- **Deal goes cold:** move to a `## Stalled` section; if dead after 60 days, treat as lost.
- **Never** put exact ARR or contract totals in headlines - ranges only. Exact numbers are CRM/finance territory.
