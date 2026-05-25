# Decisions

ADR-style decision log. One file per meaningful decision. This README is the complete contract for generating a decision file from raw data (meeting transcripts, Slack threads, email debates, founder notes).

Template: [`../templates/decision.md`](../templates/decision.md)

---

## When to create a decision file

Write a decision file when the decision meets **any** of these:

- Multiple reasonable people would disagree about it
- Reversing it in six months would cost real time or money
- You'll want to remember *why* a year from now
- A new hire would ask "why did you choose X?"

**Examples that warrant a file:** picking a tech stack, a pricing change, a hire/no-hire on a key role, choosing a vendor, a strategic pivot, killing a feature, raising or not raising.

**Do NOT create a file for:** routine operational choices, anything trivially reversible, day-to-day prioritization. Those are noise.

---

## Filename / slug derivation

Format: `YYYY-MM-DD-<short-slug>.md` — date is when the decision was **made**, not when the file was written.

- "Adopt company intelligence repo" decided 2026-04-22 → `2026-04-22-adopt-company-intelligence.md`
- "Migrate from Notion to Linear" decided 2026-03-10 → `2026-03-10-notion-to-linear.md`

Slug: 2-5 words, lowercase, hyphenated, action-oriented.

---

## Frontmatter contract

```yaml
---
type: decision                  # ALWAYS "decision".
title: "Adopt company intelligence repo"   # The decision, as a short phrase.
status: active                  # active | superseded. Decisions are never "draft".
owner: "{{FOUNDER_NAME}}"       # Who made the final call.
created: 2026-04-22             # Date the DECISION was made.
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual
source_refs: []                 # Links to the meeting/thread where decided.
supersedes: []                  # Filenames of decisions this one overrides.
tags: []
---
```

`supersedes` lists the slug(s) of any prior decision this one reverses or replaces.

---

## Body structure

Decisions do NOT use the compiled-truth + timeline split. They are **immutable records**. Structure:

| Section | What goes here | How to source it |
|---------|----------------|------------------|
| **Decided / Owner / Status** | One line: date, who decided, current status | Meeting date, decision-maker |
| **Context** | What led here. The problem or opportunity. | The discussion before the decision |
| **Decision** | What was decided, plainly. One paragraph ideally. | The conclusion reached |
| **Consequences** | Accepted trade-offs + expected benefits (with 30/60/90 markers) | Stated reasoning, risk discussion |
| **Alternatives considered** | What else was on the table, why rejected — including "do nothing" | The options debated |
| **Evidence** | Links to meetings, data, customer feedback that informed it | Source material |
| **Review date** | When to revisit (usually +90 days) | Set to created + 90 days |

---

## Worked example

`decisions/2026-03-10-notion-to-linear.md`:

```markdown
---
type: decision
title: "Migrate execution tracking from Notion to Linear"
status: active
owner: "Matt"
created: 2026-03-10
updated: 2026-03-10
last_verified: 2026-03-10
source_of_truth: manual
source_refs:
  - "[[meetings/2026-03-10-tooling-review]]"
supersedes: []
tags: [tooling, ops]
---

# Migrate execution tracking from Notion to Linear

**Decided:** 2026-03-10 · **Owner:** Matt · **Status:** active

## Context

Notion databases had become slow and the team stopped updating ticket status.
Engineering wanted a purpose-built issue tracker with keyboard-first UX.

## Decision

Move all execution tracking (issues, cycles, projects) to Linear. Notion stays
for long-form docs only, until migrated to the intelligence repo.

## Consequences

**Accepted trade-offs:**
- Two tools during a 1-month transition.
- Cost of Linear seats (~€8/user/mo).

**Expected benefits:**
- 30 days: engineering actually updates ticket status again.
- 60 days: cycle velocity is measurable.
- 90 days: Notion is docs-only.

## Alternatives considered

- **Stay on Notion:** rejected — the team had already voted with their feet.
- **GitHub Issues:** rejected — weaker cycle/sprint model for our cadence.
- **Do nothing:** rejected — status tracking was effectively dead.

## Evidence

- [[meetings/2026-03-10-tooling-review]]
- Engineering team poll: 5/6 preferred Linear.

## Review date

Revisit: 2026-06-10. Did engineering adopt it? Is velocity measurable?
```

---

## Immutability rule

Once written, **a decision file is not edited.** If circumstances change:

1. Write a **new** decision file that supersedes it.
2. List the old slug in the new file's `supersedes:` frontmatter.
3. Set the old file's `status: superseded` (this is the only permitted edit).
4. Link new→old in the new file's "Alternatives considered."

This preserves an honest record of what you believed when.

---

## Quality bar

**Good:** The context explains the *why now*. Alternatives include "do nothing." Consequences have time-bound success markers. Sourced to the meeting where it happened.

**Bad:** A decision with no alternatives listed (looks like there was no real choice). Vague consequences ("things will be better"). Editing a past decision instead of superseding it.

---

## Edge cases

- **Decision made informally** (Slack, hallway): still write the file, source it to the thread, set the date to when consensus formed.
- **Can't reconstruct full context** from raw data: fill what you can, mark gaps `<unknown>`, don't invent reasoning.
- **Backfilling old decisions:** only go back ~90 days. Older decisions are hard to reconstruct accurately and invite hallucinated context. Note in handoff that older ones weren't backfilled.
- **Reversal:** never delete. Supersede.
