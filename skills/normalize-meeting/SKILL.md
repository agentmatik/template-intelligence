---
name: normalize-meeting
description: >
  Use when the user asks to process, normalize, or file a meeting or
  transcript ("process this meeting", "normalize yesterday's call").
  Distills a transcript into a meetings/ note and opens PRs for any
  entity or decision updates it implies.
version: 1.0.0
---

# Normalize meeting

## Purpose

Turn a raw meeting transcript into the repo's durable form: one distilled note in `meetings/`, plus PR-gated updates to any entity pages and decisions the meeting affected. The raw transcript stays in its source system (Granola or similar).

## Inputs

- A transcript: Granola meeting (via MCP), a pasted transcript, or a file path.
- The meeting date and topic if not derivable from the source.

## Steps

1. Read the full transcript. Identify: date, attendees, topic, decisions made, action items, customer/competitor/people mentions.
2. Create `meetings/<category>/YYYY-MM-DD-<topic>.md` (category per the taxonomy in [`meetings/README.md`](../../meetings/README.md)) from [`templates/meeting.md`](../../templates/meeting.md), following the contract in [`meetings/README.md`](../../meetings/README.md): ≤500 words, action items + decisions + key quotes only, link to the source transcript. Frontmatter `source_of_truth: granola` (or `manual`), `status: active`.
3. For each **decision** made in the meeting: create `decisions/YYYY-MM-DD-<slug>.md` per [`decisions/README.md`](../../decisions/README.md), citing the meeting note.
4. For each **entity** materially affected (customer, competitor, person): append a dated timeline entry to its page; update the compiled-truth block only if a durable fact changed.
5. Commit: the meeting note may auto-commit (time-series). Entity and decision changes go in **one PR** titled `meeting(<topic>): normalize YYYY-MM-DD` with links back to the note.

## Output

- `meetings/<category>/YYYY-MM-DD-<topic>.md` (committed)
- One PR with entity/decision updates, or "no canonical changes" stated explicitly.

## Guardrails

- **Never paste raw transcript content** — distill. Key quotes ≤2 lines each.
- Never invent attendees, dates, or commitments not in the transcript.
- If the meeting touched comp, finance figures, or NDA content: leave it out and tell the user where it surfaced.
- Run within 48h of the meeting (before the source system evicts or memory fades); if older, note the gap.

## Example

Input: "Normalize today's Acme renewal call."
Output: `meetings/customers/2026-06-12-acme-renewal-call.md` + PR appending `2026-06-12: Renewal confirmed at €4k/mo …` to `customers/acme-co.md`.
