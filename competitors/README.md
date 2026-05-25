# Competitors

One file per competitor. This README is the complete contract for generating a competitor file from raw data (their website, funding news, sales-call mentions, win/loss notes, analyst reports).

Template: [`../templates/competitor.md`](../templates/competitor.md)

---

## When to create a competitor file

Create a file for any company that:

- **Directly competes** — buyers evaluate them against you
- **Adjacently competes** — solves the same problem a different way, or could pivot toward you
- **Comes up repeatedly** in sales calls, even if you think they're not a real threat

**Do NOT create a file for:**

- Every company in your category — only ones that actually affect deals or strategy
- Companies mentioned once with no follow-up — note in a meeting, don't create a file
- Pure inspiration/aspiration companies that aren't competitors — those belong in `strategy.md` or `market` notes if you add that later

---

## Filename / slug derivation

Format: `<company-name>.md`, lowercase, ASCII, hyphen-separated, legal suffixes dropped.

- "Competitor Inc." → `competitor.md`
- "Data Robot" / "DataRobot" → `datarobot.md` (match their own spelling)

---

## Frontmatter contract

```yaml
---
type: competitor                # ALWAYS "competitor".
title: "Competitor Inc"         # Display name, quoted.
status: active                  # active | draft | archived (archived = defunct/acquired/irrelevant)
owner: "{{FOUNDER_NAME}}"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22       # Source date if pulled from a dated report.
source_of_truth: manual
category: direct                # direct | adjacent | tangential. REQUIRED.
threat_level: medium            # low | medium | high. REQUIRED.
audience: internal
source_refs:                    # Their website, funding announcements, etc.
  - url: "https://competitor.com"
tags: []
---
```

---

## Body structure

Compiled truth (top, mutable) + timeline (bottom, append-only).

### Compiled-truth block

| Field | What goes here | How to source it |
|-------|----------------|------------------|
| **What they do** | One sentence | Their homepage headline |
| **Category** | direct / adjacent / tangential + one line of why | Your own positioning judgment |
| **Founded / Funding / Team** | Year, last known raise, approx headcount | Crunchbase, news, LinkedIn |
| **Positioning** | How they describe themselves | Their site, ads, sales decks |
| **Their strength** | The one thing they genuinely do better — be honest | Win/loss notes, customer feedback |
| **Their weakness** | The one thing you do better that matters to buyers | Win/loss notes, their gaps |
| **How we win** | The positioning response when buyers compare | Sales-team playbook, won deals |
| **How they'd win** | What makes a buyer choose them — honest, not propaganda | Lost deals, their advantages |
| **Threat level** | low/med/high + reasoning | Your judgment from deal overlap |

**Critical:** A competitor file that is only critical of the competitor is propaganda and useless. Capture their real strengths honestly — the agent and sales team need an accurate map, not a morale boost.

### Timeline

Append-only. Log: funding rounds, product launches, pricing changes, notable customer wins/losses against them, leadership changes.

```
- 2026-04-01: Raised $20M Series B led by Sequoia. Likely to expand into our segment.
- 2026-02-15: Launched a German-language UI. Closes a gap we exploited.
```

---

## Worked example

```markdown
---
type: competitor
title: "DataFlow"
status: active
owner: "Matt"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual
category: direct
threat_level: high
audience: internal
source_refs:
  - url: "https://dataflow.io"
tags: [dach, well-funded]
---

# DataFlow

**What they do:** IoT analytics platform for European manufacturers.

**Category:** Direct — buyers shortlist us both in DACH manufacturing deals.

**Founded:** 2022 · **Funding:** $20M Series B (Sequoia, 2026) · **Team:** ~80.

**Positioning:** "Enterprise-grade, German-engineered IoT analytics."

**Their strength:** German-language product and local support. Strong brand with Mittelstand buyers.

**Their weakness:** Slow to ship; their API is thin. We win on developer experience.

**How we win:** Lead with API depth and integration speed. Show our 2-week implementation vs their 8-week.

**How they'd win:** A buyer who prioritizes local language + on-site support over technical depth picks them.

**Threat level:** High — well-funded, same buyers, just closed our language-gap advantage.

---

- 2026-04-01: Raised $20M Series B led by Sequoia.
- 2026-02-15: Launched German-language UI. Closed a gap we used to exploit.
```

---

## Quality bar

**Good:** Honest about their strengths. "How they'd win" is a real scenario, not a strawman. Threat level has reasoning. Sourced from actual deal experience.

**Bad:** All criticism, no acknowledged strengths. Vague ("they're worse than us"). Stale funding info presented as current. No "how we win" playbook.

---

## Edge cases

- **Missing data:** omit or `<unknown>`. Don't guess funding or headcount.
- **Competitor acquired / shuts down:** `status: archived`, timeline entry, keep the file (history matters for "whatever happened to X?").
- **Reclassification:** if an adjacent competitor becomes direct, update `category` + `threat_level`, log it in the timeline.
- **Update cadence:** refresh at least quarterly; competitor intel rots fast.
