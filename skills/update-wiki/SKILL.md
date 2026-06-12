---
name: update-wiki
description: >
  Use when the user asks to reconcile, file, or process accumulated raw
  material ("reconcile the inbox", "file these notes", "process this
  folder"). Routes each item to its canonical home per the playbook and
  opens one reviewable PR.
version: 1.0.0
---

# Update wiki

## Purpose

Turn a pile of raw dropped material (an `inbox/` folder, pasted notes, a stack of files) into structured intelligence: each item routed to its canonical home, everything gated through one PR.

## Inputs

- A source: local `inbox/` folder (gitignored), pasted content, or file paths.

## Steps

1. Inventory every item. For each, decide its bucket using the routing table in [`guides/DATA-ORGANIZATION-PLAYBOOK.md`](../../guides/DATA-ORGANIZATION-PLAYBOOK.md): durable → repo file; live → stays in its system (note it); sensitive → quarantine and tell the user; stale/duplicate → skip with reason.
2. For each durable item, apply the matching folder README contract: update an existing canonical page (preferred) or create one from the matching template. Compiled-truth edits + dated timeline appends, per the entity pattern.
3. Show the user the routing plan (item → action → target) **before writing** if more than ~5 items are involved.
4. Make the changes. Open **one PR** titled `wiki: reconcile <source> (<N> items)`, listing per item what was done and what was skipped/quarantined and why.
5. Delete or archive processed items from the inbox (it's scratch space, not storage).

## Output

One PR + a short report: N filed, N skipped (reasons), N quarantined (where they should live instead).

## Guardrails

- **Prefer updating over creating.** A new file needs a reason an existing one couldn't hold the fact.
- Default new pages to `status: draft` — the human promotes to verified. (Exception: `decisions/` and `meetings/` are records — `status: active` per their folder READMEs.)
- Hard prohibitions apply regardless of what's in the inbox: no secrets, PII, comp, cap tables, NDA content, raw transcripts.
- When an item could fit two places: durable fact → entity compiled truth; event in time → a timeline. Still unsure → ask once.

## Example

Input: "Reconcile the inbox" (4 items: a prospect email thread, a pricing-change note, a competitor's launch announcement, a payroll PDF).
Output: PR with a timeline append to `customers/beta-industries.md`, a new `decisions/2026-06-12-pricing-floor.md`, a timeline append to `competitors/dataflow.md`; payroll PDF quarantined with a note recommending the encrypted store.
