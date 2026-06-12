# Processes

Documented core processes (SOPs). One process per file. This README is the complete per-file generation contract.

**Document the core ~20% only** — the handful of processes that produce most outcomes (sales, delivery, support, hiring, invoicing). A company drowning in SOPs nobody reads is the failure mode; start with the 3-5 processes that actually repeat.

Template: [`../../templates/process.md`](../../templates/process.md)

---

## When to create a process file

All three must hold:

- The workflow has run **3+ times** and will run again
- More than one person (or an agent) needs to execute it the same way
- Getting it wrong has a real cost

Don't write aspirational processes ("how onboarding *should* work"). Document how it works **today**; improve it by PR.

## Filename / slug

`kebab-case-name.md`, named for the outcome: `close-a-deal.md`, `onboard-a-customer.md`, `run-payroll.md`. No dates — processes are evergreen pages.

## Frontmatter contract

```yaml
---
type: runbook
title: "Onboard a customer"
status: draft          # verified once the owner has executed from this doc
owner: "<the seat owner from ../accountability.md>"
created: 2026-06-11
updated: 2026-06-11
last_verified: 2026-06-11
source_of_truth: manual
audience: internal
tags: []
---
```

## Body structure

| Section | What goes here |
|---------|----------------|
| **Trigger** | When this process starts — the event, not a vague condition |
| **Owner** | One seat from [`../accountability.md`](../accountability.md) |
| **Steps** | Numbered, deterministic. A new hire or an agent follows them blind. Name the tool and the artifact at each step. |
| **Done criteria** | How you know it's complete — checkable |
| **Exceptions** | The known cases where you stop and ask instead of proceeding |

Keep ≤500 words. Longer means it's two processes — split it.

## Relationship to skills/

A process an **agent** executes repeatedly is a candidate for `skills/<name>/SKILL.md`: the process doc stays the human-readable truth, the skill is the executable form. Link them both ways. Change the process → update the skill in the same PR.

## Quality bar

**Good:** A trigger you could set an alert on. Steps with named tools and artifacts. An owner who has actually executed from the doc (then mark `status: verified`).

**Bad:** "Be responsive to the customer" (a value, not a step). Ten-page procedures (split them). Processes describing an ideal nobody follows.

## Edge cases

- **The process lives in a tool already** (e.g. a Linear template, an n8n workflow): don't duplicate the steps — document the trigger, owner, done criteria, and link the tool as the executable truth.
- **Two seats genuinely share a process:** split it at the handoff into two processes, each with one owner.
