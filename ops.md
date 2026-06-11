---
type: ops
title: "Operations"
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

PURPOSE: How the company actually runs day to day. The operating manual.
Decision rights here are especially valuable — they tell an agent who can
approve what, enabling autonomy.

SOURCE FROM:
  1. Team handbook / wiki
  2. Calendar (reveals cadence)
  3. Tool inventory (what's in the SSO app list)
  4. Vendor contracts / invoices
  5. Any privacy policy / GDPR docs (for the data inventory)

RULES:
  - Keep under ~1000 words. Spin out an ops/ folder only when it outgrows this.
  - GDPR data inventory is required for EU companies. Skip only if genuinely
    no personal data is processed (rare).
  - Decision rights: list real names/roles. This is what lets agents and team
    know who to route approvals to.
  - status: draft when generated; human verifies.
============================================================ -->

# Operations

## Cadence

<!-- The rhythm of the company. Source: recurring calendar events, handbook. -->

| Cadence    | What happens |
|------------|--------------|
| Daily      | e.g. async standup in Slack, meetings captured in Granola |
| Weekly     | e.g. Friday brief in weekly/, team sync |
| Monthly    | e.g. metrics review, customer health pass |
| Quarterly  | e.g. rewrite strategy.md, board update, OKR reset |
| Annually   | e.g. planning week, vendor audit |

## Decision rights

<!-- Who decides what WITHOUT committee. Critical for agent autonomy and team
clarity. Source: founder, handbook. Use real names/roles. -->

- **Product roadmap:** [name]
- **Hiring (open a role):** [name]
- **Hiring (make an offer):** [name]
- **Pricing changes:** [name]
- **Customer escalations:** [name]
- **Spend above €[X]:** [name]

For anything else: open a question in `decisions/` and tag the owner.

Full seat map — who owns which function, with responsibilities: [`operating-system/accountability.md`](./operating-system/accountability.md). Update both together on hires/reorgs. Documented core processes: [`operating-system/processes/`](./operating-system/processes/).

## Tools

<!-- Function → tool. Source: SSO app list, expense reports, team knowledge. -->

| Function            | Tool |
|---------------------|------|
| Execution / tickets | Linear |
| Team chat           | Slack |
| Meetings + notes    | Granola |
| Documents           | Google Workspace |
| Code                | GitHub |
| Knowledge           | This repo (+ Notion legacy until migrated) |
| Design              | Figma |
| Payments            | Stripe |
| Accounting          | [tool] |
| Secrets             | 1Password |

## Vendors

<!-- Material vendors (>€100/mo): name, what for, contact, renewal date.
Source: invoices, contracts. -->

- [Vendor] — [purpose] — [contact] — renews [date]

## Security & access

<!-- Source: IT setup, handbook. -->

- Identity: [SSO provider]
- Secrets: [1Password vaults]
- 2FA: required on all accounts
- Device policy: [encrypted laptops, etc.]

## GDPR / data inventory

<!-- Required for EU companies. What personal data, where, why allowed, how long.
Source: privacy policy, data-processing records, system inventory. -->

| Data category       | Where stored    | Lawful basis          | Retention |
|---------------------|-----------------|-----------------------|-----------|
| Customer emails     | [system]        | Contract performance  | [period]  |
| Meeting transcripts | Granola         | Legitimate interest   | 90 days   |
| ...                 | ...             | ...                   | ...       |

DPA template: [link] · Privacy policy source: [link]

---

<!-- APPEND-ONLY TIMELINE. Major process changes, tool migrations, policy updates. -->

- 2026-04-22: Initialized ops.md.
