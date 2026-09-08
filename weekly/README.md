# Weekly

Friday founder/team brief, one file per ISO week. This README is the complete contract for generating a weekly brief by synthesizing the week's meetings, decisions, Linear activity, and customer signals.

Template: [`../templates/weekly.md`](../templates/weekly.md)

---

## When to create a weekly brief

Once per ISO week, ideally Friday. It's the alignment document - the single place to see what happened and what's next. Always created (even a quiet week gets a short one), because the cadence is the point.

---

## Filename / slug derivation

Format: `YYYY-Www.md` using ISO week numbers.

- Week 17 of 2026 → `2026-W17.md`
- Week 3 of 2026 → `2026-W03.md` (zero-pad to two digits)

ISO weeks (not month-based) keep files in correct sort order across year boundaries. ISO week 1 is the week containing the year's first Thursday.

Archive briefs older than 6 months to `weekly/archive/YYYY/` if the folder gets long.

---

## Frontmatter contract

```yaml
---
type: weekly                    # ALWAYS "weekly".
title: "Week 2026-W17"          # ISO week label, quoted.
status: active
owner: "{{FOUNDER_NAME}}"
created: 2026-04-24             # The Friday it's written.
updated: 2026-04-24
last_verified: 2026-04-24
source_of_truth: manual
audience: internal              # or "team" if you share it with the whole team
tags: []
---
```

---

## Body structure

Target ≤400 words - readable in two minutes. Sections:

| Section | What goes here | How to source it |
|---------|----------------|------------------|
| **What shipped** | 3-5 concrete deliverables | Linear (closed issues), GitHub (merged PRs), the week's meeting notes |
| **What we learned** | The one non-obvious insight of the week | Synthesis across meetings/customer calls. If none, say so - don't invent. |
| **Customer signals** | Who did what, what they said. Link customer files. | `customers/` updates, call notes, support themes |
| **Metrics** | Links to live dashboards. **Do NOT paste numbers** - they go stale. | `INDEX.md` / `strategy.md` dashboard links |
| **Blockers / risks** | Honestly named | Meeting notes, Linear blocked items |
| **Decisions this week** | Link decision files | `decisions/` created this week |
| **Next week's focus** | Three priorities, not ten | Current Linear cycle, open decisions |
| **Meetings** | Only the ones that produced something durable | `meetings/` from this week |

### How it's generated (the `weekly-brief` skill)

An agent generating this pulls from:
1. `meetings/YYYY-MM-DD-*.md` dated within the ISO week
2. `decisions/YYYY-MM-DD-*.md` from the week
3. Linear via MCP - closed issues, cycle progress
4. GitHub via MCP - merged PRs
5. `customers/` files modified this week (via git log)

It then drafts the brief. **A human reviews and edits before merging.** Never auto-merge a weekly - it's the alignment doc; trust depends on human sign-off.

---

## Worked example

`weekly/2026-W17.md`:

```markdown
---
type: weekly
title: "Week 2026-W17"
status: active
owner: "Matt"
created: 2026-04-24
updated: 2026-04-24
last_verified: 2026-04-24
source_of_truth: manual
audience: team
tags: []
---

# Week 2026-W17 - Apr 20-24

## What shipped
- SAML SSO live for Acme (ENG-882).
- New pricing page deployed.
- Hired a second backend engineer (starts May 5).

## What we learned
German-language UI is now table stakes in DACH - two prospects raised it
unprompted this week. It moved from "nice to have" to a deal-blocker.

## Customer signals
- Acme: renewal confirmed, analytics-v2 interest. [[customers/acme-labs]]
- Beta Industries: stalled on quarterly-billing ask.

## Metrics
- [North-star dashboard](https://...)  ·  [Pipeline](https://...)

## Blockers / risks
- DataFlow shipped German UI; closes our language-gap advantage. [[competitors/dataflow]]

## Decisions this week
- [[decisions/2026-04-22-german-ui-priority]] - fast-track German UI to Q3.

## Next week's focus
1. Scope German UI for Q3.
2. Close Beta Industries (revised billing terms).
3. Onboard new engineer.

## Meetings
- [[meetings/2026-04-15-acme-renewal-call]]
```

---

## Quality bar

**Good:** Three focused priorities, not a laundry list. "What we learned" is a genuine insight. Metrics linked, not pasted. Reads in under two minutes.

**Bad:** Ten "priorities" (= no priorities). Pasted metric numbers that are already stale. Invented insights. A brief so long nobody reads it.

---

## Edge cases

- **Quiet week:** write a short brief anyway. "Nothing shipped; heads-down on German UI" is a valid entry.
- **Missing live data** (MCP not connected yet): pull from meetings + decisions only, note the gap.
- **"What we learned" is genuinely empty:** write "Nothing notable" rather than inventing an insight.
- **Always human-reviewed before merge.** This file drives alignment; auto-generated-and-merged erodes trust in it.
