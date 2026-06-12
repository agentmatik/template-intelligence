# Customers

One file per named customer or active prospect. This README is the complete contract for generating a customer file. An agent with no prior context should produce a correct, consistent file from raw data (CRM exports, call transcripts, contracts, email threads).

Template: [`../templates/customer.md`](../templates/customer.md)

---

## When to create a customer file

Create a file when an organization is:

- A **paying customer** (any plan, any size)
- An **active prospect** in the pipeline (had a real conversation, not just a cold lead)
- A **pilot / trial** in progress
- A **recently churned** customer worth remembering (keep for at least 12 months)

**Do NOT create a file for:**

- Cold leads with no contact yet — those live in `sales/pipeline.md` as a line, not a file
- Individual people — customer files are about the *organization*; the human champion is a field inside it
- Customers where you only have a company name and nothing else — wait for signal

Rule of thumb: a customer earns a file once there's a relationship to track. One paragraph of context in `sales/pipeline.md` is enough until then.

---

## Filename / slug derivation

Format: `<company-name>.md`, lowercase, ASCII, hyphen-separated, legal suffixes dropped.

- "Acme Labs Ltd." → `acme-labs.md` (drop Ltd./Inc./GmbH/s.r.o.)
- "Müller & Co" → `muller-co.md`
- "BMW Group" → `bmw.md` if unambiguous, else `bmw-group.md`

If a prospect and a customer division of the same parent both exist, disambiguate: `acme-enterprise.md`, `acme-smb.md`.

Move churned customers to `customers/archive/` only if the folder grows past ~30 files; otherwise mark `status: archived` and leave in place.

---

## Frontmatter contract

```yaml
---
type: customer                  # ALWAYS "customer".
title: "Acme Labs"              # Display name, quoted. Legal suffix optional here.
status: active                  # active | draft | verified | archived.
                                #   draft = generated from raw data, unverified by a human
                                #   active = confirmed, ongoing relationship
                                #   verified = a human checked the compiled-truth block
                                #   archived = churned / dead
owner: "{{FOUNDER_NAME}}"       # Who maintains this file.
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22       # Source date if pulled from a dated export.
source_of_truth: manual         # manual | linear | notion | slack | granola | gdrive
relationship: customer          # customer | prospect | pilot | churned. REQUIRED.
audience: internal              # internal by default. NDA accounts stay internal.
tags: []                        # e.g. [enterprise, dach, q2-2026]
---
```

When generating from raw data, default `status: draft` — only a human marks `verified`.

---

## Body structure

Two parts separated by `---`: compiled truth (top, mutable) and timeline (bottom, append-only).

### Compiled-truth block (above the `---`)

| Field | What goes here | How to source it |
|-------|----------------|------------------|
| **What they do** | One sentence on the customer's business | Their website, CRM notes, intro call |
| **Our relationship** | customer/prospect/pilot/churned + since-date | Contract date, CRM stage, first-call date |
| **Primary contact** | Champion name, role, email + what they care about | Email threads, call transcripts, CRM contact |
| **Plan** | Tier, pricing, renewal date | Contract, Stripe, order form |
| **Usage** | Which features, how heavily | Product analytics, support tickets, QBR notes |
| **Unmet needs** | 1-3 bullets on what they still want | Call transcripts, feature requests, churn-risk signals |
| **Health** | Green / Yellow / Red + one-sentence reason | Usage trend + sentiment from recent contact |
| **Expansion opportunities** | What else they could buy | QBR notes, stated interest, product gaps they hit |
| **Risk signals** | What would cause churn | Support escalations, contract objections, low usage |

Keep the whole block under ~1000 words. Link to evidence (`[[meetings/customers/2026-04-15-acme-qbr]]`) rather than pasting.

### Timeline (below the `---`)

Reverse-chronological dated bullets. Append-only. Log: contract events, renewals, expansions, escalations, key calls, churn. Cite the meeting note where one exists.

```
- 2026-04-15: QBR. Renewal confirmed, interested in analytics-v2. [[meetings/customers/2026-04-15-acme-qbr]]
- 2026-01-12: Signed annual contract, €4k/mo Team plan.
```

---

## Worked example

`customers/acme-labs.md`:

```markdown
---
type: customer
title: "Acme Labs"
status: active
owner: "Matt"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-15
source_of_truth: manual
relationship: customer
audience: internal
tags: [enterprise, dach]
---

# Acme Labs

**What they do:** Industrial IoT analytics for German manufacturing SMEs.

**Our relationship:** Customer since 2026-01-12.

**Primary contact:** Klaus Berger, VP Engineering, klaus@acme-labs.de. Cares about uptime and SSO compliance.

**Plan:** Team tier, €4,000/mo, renews 2027-01-12.

**Usage:** Heavy on the API and dashboards; 40 seats active of 50 licensed.

**Unmet needs:** Wants analytics-v2 (predictive), SAML SSO (now shipped), and a German-language UI.

**Health:** Green — usage growing, renewal confirmed, champion engaged.

**Expansion opportunities:** analytics-v2 upsell (~€2k/mo), additional seats.

**Risk signals:** German-language UI is a stated requirement; competitor offers it. Watch.

---

- 2026-04-15: QBR. Renewal confirmed, analytics-v2 interest. [[meetings/customers/2026-04-15-acme-qbr]]
- 2026-03-20: Shipped SAML SSO (ENG-882). Resolved their main blocker.
- 2026-01-12: Signed annual contract, €4k/mo Team plan.
```

---

## Quality bar

**Good:** The health signal has a reason. The champion is named with what they care about. Risk signals are specific and actionable. Numbers come from the contract, not a guess.

**Bad:** "Big customer, going well" (no specifics). Invented ARR. A wall of pasted transcript instead of a distilled compiled-truth block. Missing the champion.

---

## Edge cases

- **Missing data:** omit the line or `<unknown>`. Never invent contract values, dates, or contacts.
- **Conflicting sources:** newest wins; note the conflict in the timeline.
- **Prospect → customer:** update `relationship` and `status`, add a timeline entry, keep the same file.
- **Customer → churned:** set `relationship: churned`, `status: archived`, add a dated timeline entry with the reason. Keep the file.
- **Sensitive / NDA account:** `audience: internal` (already default). Consider whether deal-specific pricing should be redacted to a range.
- **Do not mirror Linear tickets** here. Reference them; they live in Linear.
