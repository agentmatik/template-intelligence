# Memory

Agent-operational memory: what agents learn about *working in this repo and this company's systems*, so it survives context resets. This README is the complete contract for the memory layer.

**This is not company knowledge.** Facts about the company go in the knowledge files (`company.md`, `customers/`, `decisions/`, …). Memory holds the *operational* layer: conventions discovered, environment quirks, user preferences, and lessons from mistakes. If a fact would matter to a human reading the handbook, it belongs in a knowledge file — not here.

**This is also not the weekly brief.** `weekly/` is the *human* alignment cadence. `memory/` is *agent* continuity. Different audiences, different write rules.

---

## The three files

| File | What it holds | Loading convention | Write rule |
|------|---------------|--------------------|------------|
| `MEMORY.md` | Curated, durable index: conventions, preferences, environment facts | **Always** — read at the start of every session | Distill, don't append. Hard cap 200 lines / 25 KB. |
| `YYYY-MM-DD.md` | Daily worklog: what was done, found, decided today | Today + yesterday at session start; older **on demand** | Append-only during the day. Auto-commit OK (time-series). |
| `learnings.md` | Typed lessons: patterns, pitfalls, preferences | On demand; skim when starting unfamiliar work | Append-only. One entry per lesson. |

This two-tier shape (small always-loaded index + dated detail retrieved on demand) is the cross-validated convention from OpenClaw's workspace memory and Claude Code's auto memory: keep the always-loaded surface tiny, push detail to files an agent reads only when relevant.

---

## MEMORY.md — the curated index

**Hard cap: 200 lines or 25 KB, whichever comes first.** Most agent runtimes only auto-load roughly that much; anything past the cap is silently invisible. The cap is the design.

Rules:

- **Distill, don't append.** When adding a fact, check whether an existing line already covers it — update that line instead. When the file approaches the cap, move detail into a dated daily file or `learnings.md` and keep a one-line pointer.
- One fact per line or short bullet. No narratives — those go in daily files.
- Date facts that can go stale: `(as of 2026-06)`.
- Delete facts that turn out to be wrong. This file is curated, not append-only.

What belongs: standing user preferences ("Matt wants PRs, never direct pushes to main"), environment facts ("the Notion MCP token lives in 1Password, not .env"), repo conventions discovered the hard way, pointers to important learnings entries.

---

## Daily worklogs — `YYYY-MM-DD.md`

One file per day an agent does substantive work. Skip quiet days — no empty files.

```markdown
# 2026-06-11

- Migrated 12 customer files from the Notion export; 3 flagged draft (no contract dates in source).
- Found: Granola MCP truncates transcripts >2h. Noted in learnings.
- Open: sales/pipeline.md needs the Q3 stage definitions from Friday's meeting.
```

- Append-only during the day. Auto-commit allowed (time-series, like `meetings/`).
- Terse bullets. Link entities with wikilinks rather than restating facts.
- The "Open:" lines are the handoff to tomorrow's session — write them as if the next agent has zero context, because it does.
- Archive files older than 6 months to `memory/archive/YYYY/` if the folder gets long.

---

## learnings.md — the lesson store

Every corrected mistake and every discovered best practice becomes a typed entry. Types:

| Type | Meaning | Example trigger |
|------|---------|-----------------|
| `pattern` | An approach that works here — reuse it | "Distilling meetings to ≤300 words got them actually read" |
| `pitfall` | Something that fails — avoid it | "Webhook data nests under `.body`; root access silently returns null" |
| `preference` | How the user wants things done | "Always show the diff before opening a PR" |
| `architecture` | A structural fact about how systems connect | "Linear is execution truth; never mirror tickets into the repo" |
| `tool` | How a specific tool actually behaves | "Granola MCP truncates transcripts over 2 hours" |

Entry shape (append at the top, newest first):

```markdown
## 2026-06-11 · pitfall · Granola truncates long transcripts
**What happened:** Asked Granola MCP for a 2.5h board-meeting transcript; got the first ~2h with no truncation warning. Summary missed the final decisions.
**Why it matters:** Silent data loss — the agent believed it had the full meeting.
**Next time:** For meetings >2h, fetch the transcript in segments and verify the last timestamp against the meeting length.
```

Rules:

- **Write the entry before finishing the task** in which the mistake was made or corrected. A lesson recorded a session later is a lesson lost.
- One entry per lesson. If a new event confirms an existing entry, add a dated confirmation line to it instead of duplicating.
- **Prune monthly** (see `docs/OPERATIONS.md`): merge duplicates, delete entries that proved wrong, promote entries that changed standing behavior into `MEMORY.md` (one line + pointer) or — if they changed *company* process — into `ops.md` or a process doc.

---

## Frontmatter

`MEMORY.md` and `learnings.md` carry standard frontmatter with `type: memory`. Daily files may omit frontmatter (they're treated as time-series drafts, like raw meeting notes).

```yaml
---
type: memory
status: active
owner: "{{FOUNDER_NAME}}"
created: 2026-06-11
updated: 2026-06-11
last_verified: 2026-06-11
source_of_truth: manual
audience: internal
tags: []
---
```

---

## Quality bar

**Good:** MEMORY.md readable in one minute. Daily files that let tomorrow's agent resume mid-task. Learnings entries with a concrete "next time" a different agent could follow blind.

**Bad:** MEMORY.md as an append-only log drifting past the cap. Company facts hidden in memory files where humans never look. Learnings entries that describe the mistake but not the fix. Empty daily files written out of ritual.

---

## Edge cases

- **A learning that changes company process** (not just agent behavior): the durable home is `ops.md`, a process doc, or a `decisions/` entry — write it there and keep only the pointer here.
- **Conflicting memory vs knowledge file:** the knowledge file wins (it's the SSOT). Fix the memory entry.
- **Multiple agents writing the same day:** daily files are append-only, so interleaved appends are fine; if two agents disagree, record both observations and flag the conflict rather than overwriting.
- **Sensitive material:** the same hard prohibitions as everywhere else (no secrets, PII, financials). Memory is inside the repo; the `.gitignore` does not protect it.
