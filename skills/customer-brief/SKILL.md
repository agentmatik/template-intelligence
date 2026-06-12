---
name: customer-brief
description: >
  Use when the user asks to be briefed on a customer before a call, board
  meeting, or investor update ("brief me on Acme before my 3pm"). Produces
  a one-page summary from the customer file plus recent meetings and
  pipeline.
version: 1.0.0
---

# Customer brief

## Purpose

A tight, one-page briefing on a single customer so the founder walks into the conversation prepared.

## Inputs

- A customer name or slug (resolve to `customers/<slug>.md`; if ambiguous, list matches and ask once).

## Steps

1. Read `customers/<slug>.md` — compiled truth + full timeline.
2. Pull the last 3 `meetings/` notes referencing this customer.
3. Check `sales/pipeline.md` for any open deal; `decisions/` for recent decisions naming them.
4. If MCP is connected: check Linear for open tickets tagged to this customer and recent Slack mentions — fold in only what's material.
5. Summarize into: who they are · relationship status & health · recent activity · open items & risks · **3 talking points for the upcoming conversation**, leading with the single most important thing.

## Output

A markdown brief **in chat** (not saved as a file unless asked). ≤1 page.

## Guardrails

- Never invent contract values, renewal dates, or contacts not in the source files — write `unknown` and flag it.
- If the customer file's `last_verified` is >30 days old, open the brief with a staleness warning.
- No compensation or internal-only people data in any brief that might be shared externally.
- If the file doesn't exist, say so and offer to create it from [`templates/customer.md`](../../templates/customer.md) — don't improvise a brief from memory.

## Example

Input: "Brief me on Acme before my 3pm."
Output: one page — relationship (customer since 2026-01, €4k/mo, health green), last 3 touchpoints, open SSO ticket, renewal 2027-01, 3 talking points.
