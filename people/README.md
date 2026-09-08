# People

One file per person: team members, advisors, partners, investors. This README is the complete contract for generating a person file. An agent with no prior context should be able to read this and produce a correct, consistent file from raw data.

Template: [`../templates/person.md`](../templates/person.md)

---

## When to create a person file

Create a file when a person meets **any** of these:

- Is a current team member (employee or long-term contractor)
- Is an advisor, board member, or mentor with an ongoing relationship
- Is an investor (angel or fund partner) in the company
- Is a recurring external partner (agency lead, key supplier contact, channel partner)

**Do NOT create a file for:**

- Customers or prospects - those go in [`../customers/`](../customers/)
- One-off contacts with no ongoing relationship
- Job candidates who haven't joined (track those in your ATS, not here)
- Anyone where you only have a name and nothing else - skip until there's signal

When in doubt, the test is: *would an agent preparing the founder for a meeting need a durable file on this person?* If yes, create it. If the info fits in one line of a meeting note, don't.

---

## Filename / slug derivation

Format: `<first>-<last>.md`, lowercase, ASCII, hyphen-separated.

- "Sarah Reinhardt" → `sarah-reinhardt.md`
- "José Müller" → `jose-muller.md` (strip diacritics)
- Single mononym "Madonna" → `madonna.md`
- Name collision (two Sarah Chens) → append a disambiguator: `sarah-chen-eng.md`, `sarah-chen-sales.md`

Subfolder by relationship if the folder grows past ~15 files:
`people/team/`, `people/advisors/`, `people/investors/`, `people/partners/`. Until then, keep them flat in `people/`.

---

## Frontmatter contract

Every person file opens with this YAML block. Fill every field; use the stated default when unknown.

```yaml
---
type: person                    # ALWAYS "person". Never change.
title: "Sarah Reinhardt"        # Full display name, quoted.
status: active                  # active | archived. Use "archived" for alumni/former.
owner: "{{FOUNDER_NAME}}"       # Who maintains this file. Usually the founder.
created: 2026-04-22             # Date file first created (today, when generating).
updated: 2026-04-22             # Date of last material edit (today, when generating).
last_verified: 2026-04-22       # Date facts last confirmed against reality. If you
                                #   pulled from a dated source, use the SOURCE's date.
source_of_truth: manual         # manual | linear | notion | slack | granola | gdrive
relationship: team              # team | advisor | investor | partner. REQUIRED.
audience: internal              # ALWAYS "internal" for people files. Never "public".
tags: []                        # e.g. [founder, engineering, board]
---
```

**Per-field rules:**

- `relationship` is mandatory and drives any future subfoldering. Pick the single primary relationship; note secondary ones in the body.
- `last_verified`: if you're generating from a 3-month-old org chart, set it to that document's date, NOT today. This signals staleness honestly.
- `status: archived` for anyone who has left or whose relationship ended. Never delete the file.

---

## Body structure

The body has two parts separated by a `---` rule: **compiled truth** (top, mutable) and **timeline** (bottom, append-only).

### Compiled-truth block (above the `---`)

Fill these fields. Omit a line only if you genuinely have no data and no reasonable inference; never invent.

| Field | What goes here | How to source it from raw data |
|-------|----------------|-------------------------------|
| **Role** | Current title + reporting line (team), or relationship nature (advisor/investor/partner) | Org chart, email signature, LinkedIn, intro email |
| **Contact** | Work email, preferred channel. Phone only if work-relevant. | Email headers, signature, CRM |
| **Timezone** | UTC±X or city | Calendar, signature, stated location |
| **Joined / met** | Date they joined the team or the relationship began | Offer letter date, first email, contract start |
| **What they own** | Their domains, RACI responsibilities, or how they help | Role description, project assignments, meeting context |
| **Superpower** | The one thing they're uniquely good at | Founder's own assessment, peer feedback in transcripts |
| **Where they need support** | What they'd benefit from help with - honest and kind | Founder's assessment. Optional. Frame constructively. |
| **Comms preference** | Async/sync, response time, meeting style | Observed behavior, stated preference |

### Timeline (below the `---`)

Reverse-chronological dated bullets. **Append-only - never edit or delete past entries.** Light touch for people: log role changes, joining, departure, major contributions, promotions. Not every interaction.

```
- 2026-04-15: Promoted to Head of Engineering.
- 2026-01-10: Joined as senior engineer.
```

---

## Worked example

`people/sarah-reinhardt.md`:

```markdown
---
type: person
title: "Sarah Reinhardt"
status: active
owner: "Matt"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual
relationship: team
audience: internal
tags: [engineering, founding-team]
---

# Sarah Reinhardt

**Role:** Co-founder & CTO. Owns all engineering. Reports to no one; peer to CEO.

**Contact:** sarah@acme.co · Slack @sarah · prefers Slack over email.

**Timezone:** UTC+1 (Berlin).

**Joined / met:** 2025-03-01 (co-founded the company).

**What they own:** Entire technical stack, hiring for engineering, architecture decisions, security posture.

**Superpower:** Turns vague product ideas into shipped systems faster than anyone I've worked with. Exceptional at hiring senior engineers.

**Where they need support:** Tends to take on too much directly; benefits from explicit permission to delegate.

**Comms preference:** Deep-work mornings, no meetings before 11:00. Fast async responder. Direct feedback style.

---

- 2026-03-01: Led the v2 architecture migration. Shipped on time.
- 2025-03-01: Co-founded the company. Owns CTO role from day one.
```

---

## Quality bar

**Good:** Specific, current, sourced, honest. "Owns all engineering, reports to no one" beats "technical person." The superpower is concrete. The support note is constructive, not a criticism dump.

**Bad:** Vague ("good at tech"), invented (a join-date you guessed), or containing prohibited data (salary, performance ratings, health, personal life). A file that reads like a LinkedIn summary is too generic - capture what's *useful to the company*, not what's public.

---

## Strict prohibitions

- **No compensation** - salary, equity, bonus. Lives in your cap table / payroll, encrypted.
- **No performance reviews or ratings.** Lives in your HR system.
- **No medical, health, or sensitive personal information.** Ever.
- **No personal details beyond work-relevant context.** Birthday is fine if you celebrate them; home address is not.
- `audience: internal` always. People files never go on a public docs site.

---

## Edge cases

- **Missing data:** omit the line, or write `<unknown>`. Never guess a date, title, or email.
- **Conflicting sources:** use the most recent, note the conflict in a timeline entry.
- **Person leaves:** set `status: archived`, add a timeline entry with the departure date, move to `people/alumni/` if the folder is subfoldered. Keep the file.
- **Person has two roles** (e.g. advisor who later invests): pick the primary `relationship`, mention the second in the Role line.
- **You only have a name:** don't create a stub. Wait until there's real signal.
