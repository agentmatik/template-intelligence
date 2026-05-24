# Decisions

ADR-style decision log. Every meaningful decision gets its own file.

## Naming

`YYYY-MM-DD-<slug>.md` — e.g. `2026-04-22-adopt-company-intelligence.md`

## What counts as "meaningful"

Write a decision file when:
- Multiple team members would reasonably disagree
- Reversing it would cost real time or money
- You'll want to remember *why* a year from now
- A new hire would ask "why did you choose X?"

## Decisions are immutable

Once made, a decision file isn't edited. If circumstances change:
1. Write a **new** decision file that supersedes it
2. Mark the old one `status: superseded`
3. Link from new to old in "Alternatives considered"

Preserves the historical record of what you believed when.
