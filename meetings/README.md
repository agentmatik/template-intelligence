# Meetings

Normalized meeting notes. Ingested from Granola via the `normalize-meeting` skill.

## Naming

`YYYY-MM-DD-<short-topic>.md` — e.g. `2026-04-15-acme-renewal-call.md`

Archive older-than-6-months to `meetings/archive/YYYY/`.

## What goes here

- Attendees
- Context
- **Decisions made** (the most important section)
- Action items (owner + deadline)
- Risks/flags surfaced
- Links to Granola original, customer files, decisions

Transcripts stay in Granola (which evicts after 48–72h). This folder stores **summaries**, not raw dumps.

## Auto-commit OK

Time-series. The `normalize-meeting` skill commits directly. If any decision updates canonical knowledge, the skill also opens a separate PR against the entity file.
