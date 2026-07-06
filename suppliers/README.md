# Suppliers

One file per named supplier - any organization the company **buys goods or services from** where the relationship matters: manufacturers, OEM factories, material/component suppliers, logistics providers, key service agencies. This README is the complete contract for generating a supplier file. An agent with no prior context should produce a correct, consistent file from raw data (call transcripts, order confirmations, email threads, invoices).

Template: [`../templates/supplier.md`](../templates/supplier.md)

**Boundary vs other folders:** `customers/` = organizations that buy FROM us. `distributors/` = organizations that sell our products onward. `suppliers/` = organizations WE buy from. A logistics partner or marketing agency (e.g. an external agency retained for campaigns) is a supplier.

---

## When to create a supplier file

Create a file when an organization is:

- An **active supplier** (open orders, ongoing service contract)
- A **candidate supplier** being seriously evaluated (samples requested, terms discussed - not just a name from a directory)
- A **former supplier** worth remembering (quality/terms history matters for at least 12 months)

**Do NOT create a file for:**

- One-off purchases with no relationship to track
- Individual people - the contact person is a field inside the org's file (or a `people/` file if they matter independently)
- A bare company name with no signal yet

---

## Filename / slug derivation

Format: `<company-name>.md`, lowercase, ASCII, hyphen-separated, legal suffixes dropped (Ltd./Inc./GmbH/s.r.o./Co.).

- "Weihai Fishing Tackle Co., Ltd." -> `weihai-fishing-tackle.md`
- "INSTINKT s.r.o." -> `instinkt.md`

---

## Frontmatter contract

```yaml
---
type: supplier                  # ALWAYS "supplier".
title: "Weihai Fishing Tackle"  # Display name, quoted.
status: active                  # draft | active | verified | archived
                                #   draft = generated from raw data, unverified by a human
                                #   active = confirmed, ongoing relationship
                                #   verified = a human checked the compiled-truth block
                                #   archived = former supplier
owner: "Matt"                   # Who maintains this file.
created: 2026-07-07
updated: 2026-07-07
last_verified: 2026-07-07
source_of_truth: manual         # manual | notion | slack | fireflies | granola | gdrive
relationship: active            # active | candidate | former. REQUIRED.
company: <slug>
audience: internal              # internal by default. Pricing/terms stay internal.
tags: []                        # e.g. [china, rods, oem]
---
```

When generating from raw data, default `status: draft` - only a human marks `verified`.

---

## Body structure

Two parts separated by `---`: compiled truth (top, mutable) and timeline (bottom, append-only).

### Compiled-truth block (above the `---`)

| Field | What goes here | How to source it |
|-------|----------------|------------------|
| **What they supply** | Product categories / services, one sentence | Orders, catalogs, call transcripts |
| **Our relationship** | active/candidate/former + since-date | First order date, contract |
| **Primary contact** | Name, role, email/WeChat + working language | Email threads, call transcripts |
| **Terms** | MOQ, lead time, payment terms, incoterms, currency | Order confirmations, proforma invoices |
| **Volume** | Approximate annual spend / order frequency | Invoices, finance notes |
| **Quality** | Defect/reklamace history, certifications | Claims records, QC reports, meeting notes |
| **Health** | Green / Yellow / Red + one-sentence reason | Lead-time trend, quality trend, communication |
| **Alternatives** | Known backup suppliers for the same category | Sourcing research, meeting notes |
| **Risk signals** | Single-source risk, price pressure, capacity, geopolitical | Meeting notes, market context |

Keep the whole block under ~800 words. Link to evidence (`[[../meetings/2026-07-01-management]]`) rather than pasting.

### Timeline (below the `---`)

Reverse-chronological dated bullets. Append-only. Log: orders, term changes, quality incidents (reklamace), price changes, visits, escalations. Cite the meeting note where one exists.

```
- 2026-07-01: Lead time raised to 60 days for Q4. [[../meetings/2026-07-01-management]]
- 2026-03-12: First container order, 5k units rods series X.
```

---

## Quality bar

**Good:** Terms come from an order confirmation, not a guess. The health signal has a reason. Risk signals are specific ("single source for carbon blanks"). Quality history cites incidents.

**Bad:** "Chinese supplier, works fine" (no specifics). Invented MOQ or payment terms. A pasted transcript wall instead of distilled truth.

---

## Edge cases

- **Missing data:** omit the line or `<unknown>`. Never invent terms, prices, or dates.
- **Conflicting sources:** newest wins; note the conflict in the timeline.
- **Candidate -> active:** update `relationship` and `status`, add a timeline entry, keep the same file.
- **Supplier dropped:** set `relationship: former`, `status: archived`, add a dated timeline entry with the reason. Keep the file.
- **Shared across companies** (supplies two sister companies): file lives under the primary buyer's folder; the other company's file links to it. If truly group-level, put it in `_shared/`.
- **Pricing sensitivity:** unit prices and negotiated terms are `audience: internal` (default). Consider ranges when exact numbers are contentious.
