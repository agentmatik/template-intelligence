# Operating System

The management-system layer: how the company sets direction, assigns ownership, measures the week, and documents its core processes. This README is the complete contract for the folder.

**This pack is optional and framework-agnostic.** The artifacts use generic names so any operating framework maps onto them. If you don't run a named system, use them as-is — they're the minimum set any disciplined company keeps written down.

> Attribution: the artifact set is compatible with the Entrepreneurial Operating System® (EOS®, V/TO®, Rocks®, Level 10 Meeting™ — trademarks of EOS Worldwide, LLC; see Gino Wickman's *Traction*), and with YC operating doctrine (single north-star metric, extreme internal metric transparency — Sam Altman's Startup Playbook). This template is not affiliated with or endorsed by EOS Worldwide.

---

## The files and what they map to

| File | What it holds | EOS equivalent | OKR equivalent | 4DX equivalent |
|------|---------------|----------------|----------------|----------------|
| `vision.md` | Long-horizon direction: values, focus, 10-year target, 3-year picture, 1-year plan | V/TO® (Vision/Traction Organizer) | Mission + annual objectives | WIG context |
| `rocks.md` | This quarter's 3–7 most important goals, one owner each | Rocks | Quarterly OKRs | WIGs |
| `scorecard.md` | 5–15 weekly measurables with owners and goals; north-star on top | Scorecard | KR dashboard | Lead measures + scoreboard |
| `accountability.md` | Seats → roles → responsibilities, one owner per seat | Accountability Chart | — | — |
| `processes/` | Documented core processes (SOPs) | Core Processes ("the EOS Process Component") | — | — |

Relationship to the root files (SSOT rule — link, never duplicate):

- `strategy.md` stays the **quarterly "what we're doing now"** — north-star definition, top-3 priorities, bets, risks. `vision.md` holds the **longer horizons** and links to `strategy.md` for the current quarter.
- `ops.md` keeps the cadence table and tools; its decision-rights section links to `accountability.md` for the full seat map.
- `weekly/` briefs report **against** `rocks.md` and `scorecard.md` (the optional L10-compatible agenda in `templates/weekly.md`).
- Metric *values* live in dashboards (live systems); `scorecard.md` holds definitions, owners, goals, and links — per the repo-wide rule that numbers stay in the systems that own them.

---

## Conventions

- All four root artifacts are **canonical**: full frontmatter, PR-gated changes, `compiled truth above ---, dated timeline below` where history matters (`rocks.md` keeps past quarters below the rule).
- Frontmatter `type:` values: `vision`, `rocks`, `scorecard`, `accountability`; process docs use `runbook`.
- Quarterly rhythm: rewrite `rocks.md` compiled-truth block each quarter (move the finished quarter to the timeline); review `vision.md` quarterly, rewrite the 1-year plan annually.
- Weekly rhythm: scorecard reviewed in the weekly brief; a measurable off-track two weeks running becomes an issue (and possibly a `decisions/` entry).

---

## processes/ — the SOP sub-folder

Document the **core** processes only — the ~20% that produce 80% of outcomes (sales, delivery, support, hiring, invoicing…). One process per file, `kebab-case-name.md`, template at [`../templates/process.md`](../templates/process.md).

Body shape: **Trigger** (when this runs) → **Owner** (one seat from `accountability.md`) → **Steps** (numbered, deterministic — an agent or new hire follows them blind) → **Done criteria** → **Exceptions** (when to stop and ask). Keep each ≤500 words; a process longer than that is two processes.

A process that an agent executes repeatedly is a candidate for promotion to `skills/<name>/SKILL.md` — the process doc stays the human-readable truth, the skill is the executable form, and they link to each other.

---

## Quality bar

**Good:** 3–7 rocks with one owner and a binary done/not-done definition. A scorecard a stranger could read and know if the week was good. An accountability chart where every seat has exactly one name. Processes a new hire follows without asking.

**Bad:** Ten rocks (= no priorities — same rule as `strategy.md`). Scorecard numbers pasted weekly into the file (they go stale; link the dashboard). Two names on one seat ("when two people are accountable, nobody is"). Aspirational processes describing how things *should* work instead of how they do.

---

## Edge cases

- **Solo founder:** you still fill `accountability.md` — every seat is you, and that's the point: it shows which hats exist before you hire for them.
- **No long-term vision yet:** leave the 10-year/3-year sections marked `<not yet set>` rather than inventing one. `status: draft`.
- **Company runs literal EOS with a coach:** keep the official tooling as the working surface if you have one, and mirror only the durable conclusions here — same rule as Linear/Notion.
