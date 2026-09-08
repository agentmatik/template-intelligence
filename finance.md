---
type: finance
title: "Finance"
status: draft
owner: "{{FOUNDER_NAME}}"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual
tags: []
audience: internal
---

<!-- ============================================================
GENERATION GUIDE (delete this block once filled)

PURPOSE: Where the money truth LIVES - not the money truth itself. A pointer
file plus metric definitions.

⚠️ HARD RULE FOR AGENTS: If you encounter a cap table, payroll, term sheet, or
exact revenue-by-customer in the raw data, DO NOT transcribe it into this file.
Note in the migration handoff that it exists and recommend an encrypted home
(1Password, encrypted Drive folder with strict ACL, or a stricter private repo).
This file only records WHERE those things live and HOW metrics are defined.

WHAT IS OK TO INCLUDE:
  - Pointers to where financial artifacts live (with access notes)
  - Metric DEFINITIONS (the formula for ARR, burn, etc. - not the values)
  - Fundraising round summary (round/date/amount/lead are usually shareable;
    exact terms are not)
  - Review cadence

SOURCE FROM: the founder telling you where things live. Not from financial
documents you then copy.

  - status: draft when generated; human verifies.
============================================================ -->

# Finance

> **This file is high-level signal only.** Cap table, comp, term sheets, and
> customer-level revenue do NOT live here. They live in encrypted storage. This
> file points to them and defines the metrics.

## Where the real numbers live

<!-- A directory of financial artifacts and their (secure) locations. Source: founder. -->

| Document            | Location                  | Access            |
|---------------------|---------------------------|-------------------|
| Cap table           | [encrypted store]         | Founders only     |
| Bookkeeping         | [accounting tool]         | Founder + accountant |
| Bank accounts       | [bank portal]             | Founders          |
| Investor reporting  | [Drive folder]            | Investors + founders |
| Customer revenue    | [Stripe / spreadsheet]    | Founder           |
| Payroll / comp      | [encrypted vault]         | Founders          |

## Key metrics (definitions only)

<!-- The formulas, NOT the values. Values live in dashboards. Source: how the
company defines these - ask if ambiguous. -->

- **ARR** = [definition]
- **MRR** = [definition]
- **Burn** = [definition]
- **Runway** = cash on hand ÷ avg monthly burn (last 3 months)
- **CAC** = [definition]
- **LTV** = [definition]

## Cadence

- **Weekly:** burn check (Friday)
- **Monthly:** P&L review (first Monday)
- **Quarterly:** investor update
- **Annually:** audit, tax filing

## Fundraising history

<!-- Round / date / amount / lead are usually shareable. Exact terms (valuation
caps, liquidation prefs) belong in the encrypted store, NOT here. -->

| Round    | Date    | Amount | Lead investor |
|----------|---------|--------|---------------|
| Pre-seed | YYYY-MM | $X     | [name]        |

Term sheets and detailed terms: [encrypted location].

---

<!-- APPEND-ONLY TIMELINE. Fundraises closed, major financial milestones
(first revenue, breakeven, etc.). No raw figures beyond round headlines. -->

- 2026-04-22: Initialized finance.md.
