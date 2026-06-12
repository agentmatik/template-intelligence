---
name: weekly-brief
description: >
  Use when the user asks to draft the weekly brief ("draft the weekly",
  "write this week's brief"). Synthesizes the week's meetings, decisions,
  entity changes, and live execution state into a weekly/YYYY-Www.md draft
  for human review.
version: 1.0.0
---

# Weekly brief

## Purpose

Produce the Friday alignment draft: what shipped, what we learned, customer signals, scorecard/rocks status, blockers, next week's focus. The human reviews and merges — never auto-merge.

## Inputs

- The target ISO week (default: the current one).

## Steps

1. Gather, in order:
   - `meetings/**/YYYY-MM-DD-*.md` dated within the ISO week
   - `decisions/YYYY-MM-DD-*.md` from the week
   - `customers/` files modified this week (`git log --since`)
   - Live state via MCP if connected: Linear closed issues/cycle, GitHub merged PRs
   - `operating-system/rocks.md` and `scorecard.md` if the pack is in use
2. Draft `weekly/YYYY-Www.md` from [`templates/weekly.md`](../../templates/weekly.md) following [`weekly/README.md`](../../weekly/README.md): ≤400 words, three priorities for next week (not ten), metrics as dashboard links (never pasted numbers).
3. Fill the optional scorecard & rocks check: off-track items only; flag anything off-track two weeks running as an issue.
4. Open a PR titled `weekly: YYYY-Www` — **do not merge it**.

## Output

A PR containing the draft brief. State explicitly which sources were unavailable (e.g. "Linear MCP not connected — shipped list from meetings only").

## Guardrails

- "What we learned" must be a genuine insight or "Nothing notable" — never invent one.
- A quiet week still gets a (short) brief; the cadence is the point.
- Never paste metric values. Links only.
- Never auto-merge — the brief drives alignment; trust depends on human sign-off.

## Example

Input: "Draft the weekly."
Output: PR with `weekly/2026-W24.md`, sourced from 3 meeting notes, 1 decision, Linear cycle 14, and the rocks table.
