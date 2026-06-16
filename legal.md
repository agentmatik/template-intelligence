---
type: legal
title: "Legal & administration"
status: draft
owner: "{{FOUNDER_NAME}}"
created: 2026-06-14
updated: 2026-06-14
last_verified: 2026-06-14
source_of_truth: manual
tags: []
audience: internal
---

<!-- ============================================================
GENERATION GUIDE (delete this block once filled)

PURPOSE: The durable administrative facts the company needs day to day —
the things you paste into an invoice, a contract, or a supplier form:
legal entity, tax/VAT IDs, registered + invoicing addresses, company
structure, directors/signatories, key registrations, and pointers to the
underlying documents.

This is NOT company.md (the 30-second pitch) and NOT finance.md (money
truth). It's the registry of "what's our VAT number / registered address /
billing entity" — facts that change rarely but are needed often.

SENSITIVITY: most of this is low-sensitivity and often public (registered
name, company/registration number, VAT ID, registered office, directors —
these sit on public registers like Companies House or the obchodní
rejstřík). So they belong in the repo. What does NOT belong here:
  - Cap table, exact share percentages, beneficial-ownership personal data
    → finance.md points to the encrypted store.
  - Online-banking credentials, full payment-card data → never in the repo.
The receiving bank name + IBAN MAY be listed (it's the same info printed on
every invoice you send) — founder's call; mark `audience: team` if so.

RULES:
  - Pointers, not documents: link the incorporation PDF / articles /
    shareholder agreement; don't paste them.
  - Multi-entity companies: list every entity; mark which one invoices,
    which one employs, which one holds IP.
  - status: draft until a human confirms each number — a wrong VAT ID on an
    invoice is a real problem.
============================================================ -->

# Legal & administration

## Legal entity

<!-- One block per legal entity. The "billing entity" is the one whose
name + details go on outgoing invoices. -->

| Field | Value |
|-------|-------|
| Registered name | <!-- e.g. Acme Labs s.r.o. --> |
| Legal form | <!-- s.r.o. / Ltd / GmbH / Inc / … --> |
| Registration no. | <!-- company/registration number --> |
| Tax ID | <!-- e.g. DIČ / EIN --> |
| VAT ID | <!-- e.g. CZ12345678 --> |
| Incorporated | <!-- YYYY-MM-DD --> |
| Jurisdiction | <!-- country / state of incorporation --> |
| Fiscal year end | <!-- e.g. 31 Dec --> |

## Addresses

- **Registered office:** <!-- the official legal address -->
- **Invoicing / billing address:** <!-- if different from registered office; this is what suppliers put on invoices TO us -->
- **Trading / operating address:** <!-- where the team actually works, if different -->
- **Notices:** <!-- where legal notices should be sent, if specified in contracts -->

## Company structure

<!-- The high-level shape — entities and who's accountable. NOT the cap
table (that's finance.md → encrypted store). -->

- **Entities:** <!-- parent + any subsidiaries; one line each, with role: invoices / employs / holds IP -->
- **Ownership (high level):** <!-- e.g. "Founders 80%, angels 20%" — ranges/round numbers, not the cap table -->
- **Directors / statutory representatives:** <!-- names + role -->
- **Authorised signatories:** <!-- who can sign contracts, and any limits (links to `ops.md` decision rights / `management/accountability.md`) -->

## Key registrations & numbers

<!-- Whatever the company actually has — delete rows that don't apply. -->

| Type | Number / ref | Notes |
|------|--------------|-------|
| EORI (customs) | | |
| DUNS | | |
| Data-protection registration | | |
| Industry / regulatory licence | | |
| Insurance policy (liability, etc.) | | pointer to the policy doc |

## Banking (for invoicing)

<!-- Pointer by default. You MAY list the receiving bank name + IBAN here
since it's printed on every invoice you send (mark audience: team).
Online-banking logins / full details: never here — see SECURITY.md. -->

- Receiving bank / IBAN: <!-- or: "see <pointer>" -->
- Full banking detail lives in: <!-- finance.md pointer / encrypted store -->

## Documents (pointers)

<!-- Where the underlying legal documents live — never paste them. -->

| Document | Where it lives | Access |
|----------|----------------|--------|
| Incorporation / articles | | |
| Shareholder agreement | | finance.md / encrypted store |
| Customer contract templates (MSA, DPA) | | |
| IP assignments | | |
| Insurance policies | | |

---

<!-- APPEND-ONLY TIMELINE. Administrative changes only: address change,
VAT registration, new subsidiary, director change, rename.
- 2026-06-14: Entity registry created. -->
