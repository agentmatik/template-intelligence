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

# Operations

<!-- How we run the company. Keep this file ≤1000 words. Spin out a folder when it grows. -->

## Cadence

| Cadence    | What happens                                                  |
|------------|---------------------------------------------------------------|
| Daily      | Standups (async in Slack #standups), Granola for meetings     |
| Weekly     | Friday brief in `weekly/`, OKR check-in, retro                |
| Monthly    | First Monday — strategic review, customer health pass        |
| Quarterly  | Rewrite `strategy.md`, board update, OKR reset               |
| Annually   | Annual planning week, comp review, vendor audit               |

## Decision rights

Who decides what without committee:

- **Product roadmap:** [name]
- **Hiring (heads):** [name]
- **Hiring (offers):** [name]
- **Pricing changes:** [name]
- **Customer escalations:** [name]
- **Marketing campaigns:** [name]
- **Spend > €X:** [name]

For anything else: open a question in `decisions/` and tag the owner.

## Tools we use

| Function          | Tool                                  |
|-------------------|---------------------------------------|
| Execution / tickets | Linear                              |
| Team chat         | Slack                                 |
| Meetings + notes  | Granola                               |
| Documents         | Google Workspace                      |
| Code              | GitHub (private)                      |
| Knowledge         | This repo + Notion (legacy only)      |
| Design            | Figma                                 |
| Payments          | Stripe                                |
| Accounting        | [tool]                                |
| Identity          | Google Workspace SSO                  |
| Secrets           | 1Password                             |

## Vendors

For each material vendor (>€100/mo): name, contact, contract location, renewal date.

- ...

## Security & access

- Identity: SSO via Google Workspace
- Secrets: 1Password (shared vaults per project)
- 2FA: required on all accounts
- Device policy: [encrypted laptops, …]
- Incident playbook: see [`docs/incident-response.md`](./docs/incident-response.md) (TODO)

## GDPR / data inventory

Required for EU-based companies. What customer data lives where:

| Data category        | Where stored          | Lawful basis           | Retention |
|----------------------|-----------------------|------------------------|-----------|
| Customer emails      | Stripe + Linear       | Contract performance   | Indefinite while active |
| Meeting transcripts  | Granola               | Legitimate interest    | 90 days   |
| ...                  | ...                   | ...                    | ...       |

DPA template: link.
Privacy policy source: link.

---

- 2026-04-22: Initialized ops.md.
