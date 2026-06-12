# Meetings

Distilled meeting notes, one file per meeting, **routed into a category folder**. This README is the complete contract for turning a raw transcript (Granola, Otter, Zoom, hand notes) into a structured meeting note.

Template: [`../templates/meeting.md`](../templates/meeting.md)

---

## Category folders — a default taxonomy, made to be adjusted

Notes live at `meetings/<category>/YYYY-MM-DD-<topic>.md`. The template ships the recurring meeting types of a default startup operating cadence (YC- and EOS-shaped):

| Category | What goes there | Cadence anchor |
|----------|-----------------|----------------|
| [`standups/`](./standups/README.md) | Daily/async team syncs — only the rare one that produced something durable | Daily |
| [`leadership/`](./leadership/README.md) | The weekly leadership meeting (EOS L10-compatible: KPIs, goals, issues) | Weekly |
| [`one-on-ones/`](./one-on-ones/README.md) | Manager 1:1s — commitments and themes, never comp/performance detail | Weekly/biweekly |
| [`customers/`](./customers/README.md) | Customer, prospect, and user calls — the YC "talk to users" record | Continuous |
| [`product/`](./product/README.md) | Sprint planning, design/eng reviews, retros | Weekly/sprint |
| [`marketing/`](./marketing/README.md) | Marketing & growth syncs, campaign reviews, experiment readouts | Weekly/monthly |

**This taxonomy is a starting point, not a prescription.** During setup or migration, reshape it to the company's *actual* calendar:

- **Delete** category folders the company doesn't use (no standups? remove `standups/`).
- **Rename or add** categories its real cadence demands (`board/` once there's a board, `planning/` for quarterly sessions, `all-hands/`, `partners/`, `hiring/`…) — each new category gets a short README on the same pattern: what belongs, distill focus, propagation rule. For planning sessions, remember the propagation duty: goals set there feed `strategy.md`, `management/goals.md`, and `management/vision.md` — the note records the session, the artifacts hold the plan.
- The company's calendar is the source of truth for which categories exist — folders must reflect real recurring meetings, never aspiration.
- A meeting that fits no category: prefer creating the right category over inventing a `misc/`.

---

## When to create a meeting note

Create a note for any meeting that produced something durable:

- Decisions (even small ones)
- Action items with owners
- Customer/prospect conversations
- Strategic or planning discussions
- Anything you'd want to recall in three months

**Do NOT create a note for:** routine standups with nothing notable, purely social calls, meetings where literally nothing was decided or assigned. If the entire meeting fits in one line, put that line in the relevant entity's timeline instead.

---

## Filename / slug derivation

Format: `<category>/YYYY-MM-DD-<short-topic>.md` — date is the **meeting date**, not today.

- Acme renewal call on 2026-04-15 → `customers/2026-04-15-acme-renewal-call.md`
- Weekly eng sync on 2026-04-22 → `product/2026-04-22-eng-sync.md`

If two meetings share a date and topic, append a disambiguator: `-am` / `-pm` or a number.

Archive notes older than 6 months to `meetings/<category>/archive/YYYY/` to keep folders browsable.

---

## Frontmatter contract

```yaml
---
type: meeting                   # ALWAYS "meeting".
title: "Acme renewal call"      # Concise topic, quoted. Not "Meeting at 3pm".
status: active                  # active. (Meetings aren't draft/verified — they're records.)
owner: "{{FOUNDER_NAME}}"
created: 2026-04-15             # The MEETING date.
updated: 2026-04-15
last_verified: 2026-04-15
source_of_truth: granola        # granola | manual | gdrive — where the transcript lives
source_refs:
  - granola: "<meeting-id-or-url>"
attendees: ["Matt", "Klaus Berger (Acme)"]   # Names, with org for externals.
audience: internal
tags: [acme, renewal]
---
```

---

## Body structure

Meetings are **distillations, not transcripts.** A 60-minute meeting becomes ~300 words. Target ≤500 words. Sections:

| Section | What goes here | Sourcing rule |
|---------|----------------|---------------|
| **Date / Duration / Channel** | One line of logistics | Calendar, transcript metadata |
| **Attendees** | Names + org affiliation for externals | Transcript speaker labels, invite |
| **Context** | Why this meeting happened, in one or two sentences | Agenda, invite, opening of transcript |
| **Decisions** | What was decided (or deliberately not). The most important section. Owner + due where applicable. | Look for commitments, agreements, conclusions |
| **Action items** | Checkbox list: owner — action — deadline | Look for "I'll...", "can you...", assignments |
| **Risks / flags** | Concerns surfaced. Link to the entity they affect. | Objections, worries, blockers raised |
| **Key moments / quotes** | Short attributed quotes ONLY when they matter materially. Never a transcript. Quotes stay in their **original language** (translation loses evidence); summarize in English after. | Pivotal statements |
| **Links** | Granola original, related customer/decision files, Linear tickets created | Cross-references |

### Critical: propagate canonical changes

If a meeting changed a durable fact, **also update the canonical file** — don't leave the truth stranded in the meeting note:

- Customer status changed → update `customers/<slug>.md` (timeline + compiled truth), ideally via PR
- A real decision was made → create `decisions/YYYY-MM-DD-<slug>.md`
- A person's role changed → update `people/<slug>.md`
- A risk emerged → note it in `strategy.md` or the relevant entity

The meeting note records *what happened*; the canonical files hold *what's now true*.

---

## Worked example

`meetings/customers/2026-04-15-acme-renewal-call.md`:

```markdown
---
type: meeting
title: "Acme renewal call"
status: active
owner: "Matt"
created: 2026-04-15
updated: 2026-04-15
last_verified: 2026-04-15
source_of_truth: granola
source_refs:
  - granola: "mtg_abc123"
attendees: ["Matt", "Klaus Berger (Acme VP Eng)"]
audience: internal
tags: [acme, renewal]
---

# Acme renewal call

**Date:** 2026-04-15 · **Duration:** 45min · **Channel:** Zoom

## Context

Annual renewal due in January; Klaus wanted to discuss terms and the analytics-v2 roadmap.

## Decisions

- Renewal confirmed at current €4k/mo. Owner: Matt. Klaus to sign by 2026-04-30.

## Action items

- [ ] Matt — send analytics-v2 beta access — 2026-04-22
- [ ] Matt — draft expansion proposal (€2k/mo) — 2026-04-30

## Risks / flags

- German-language UI still a stated requirement; competitor DataFlow now offers it. → [[competitors/dataflow]]

## Key moments

> "If analytics-v2 lands by Q3, we'd expand to the whole plant."
> — Klaus Berger

## Links

- Granola original: mtg_abc123
- [[customers/acme-labs]]
- Linear: ENG-901 (analytics-v2 beta access)
```

---

## Quality bar

**Good:** Decisions and action items are crisp with owners and dates. Distilled, not pasted. Canonical files updated where facts changed. Quotes only where they carry weight.

**Bad:** A 2,000-word wall of pasted transcript. Action items with no owner. Decisions buried in prose. Forgetting to update the customer file when the renewal was confirmed.

---

## Edge cases

- **No transcript, only memory:** write what you recall, source `manual`, keep it short.
- **Transcript is huge / multi-topic:** still distill to ≤500 words; split into two notes only if genuinely two meetings.
- **Sensitive content in transcript** (PII, comp talk): summarize around it; never paste raw sensitive passages.
- **Auto-commit is OK** for meeting notes (they're append-only time-series). But canonical changes they trigger go via PR.
- **Backfilling:** only distill meetings from the last ~30 days; older transcripts are low-value and hard to summarize accurately.
