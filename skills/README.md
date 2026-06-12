# Skills

Cross-tool agent skills. Each subfolder is one skill containing a `SKILL.md`. This README is the contract for what skills are, when to add them, and how to write one.

**The template ships four first-party starter skills** (below) — the workflows every intelligence repo runs from week one. Delete any you don't use. **Beyond those, do not pre-create skills:** add one only when a workflow has repeated enough to be worth codifying.

---

## What a skill is

A skill is a reusable, on-demand procedure an agent loads only when relevant. It follows the cross-tool `SKILL.md` convention (Claude Code, OpenClaw, Cursor, Codex). Structure:

```
skills/<skill-name>/
├── SKILL.md           # Required. YAML frontmatter + markdown body.
├── references/        # Optional. Supporting docs the skill can pull in.
└── examples/          # Optional. Example inputs and outputs.
```

Progressive disclosure: only the `description` field loads at session start; the full body loads when the skill is actually invoked. This keeps context lean.

---

## When to create a skill

Create one when **all** of these hold:

- You've done the same multi-step workflow 3+ times
- It has a clear trigger ("when the user asks for X")
- It benefits from consistent execution (same steps, same output shape)

**Do NOT create a skill for:** one-off tasks, things a single prompt handles, or anything you haven't actually done yet. Premature skills are dead weight.

---

## The four shipped starter skills

| Skill | Trigger | What it does |
|-------|---------|--------------|
| [`normalize-meeting`](./normalize-meeting/SKILL.md) | "process this meeting / transcript" | Transcript → distilled `meetings/` note + one PR to affected entity/decision files |
| [`weekly-brief`](./weekly-brief/SKILL.md) | "draft the weekly" | Synthesize week's meetings, decisions, Linear, PRs → `weekly/YYYY-Www.md` draft PR |
| [`customer-brief`](./customer-brief/SKILL.md) | "brief me on <customer>" | One-page customer summary for a call/board/investor from the customer file + recent activity |
| [`update-wiki`](./update-wiki/SKILL.md) | "reconcile the inbox" | Route raw dropped material to canonical homes via one reviewable PR |

**Claude Code wiring:** Claude Code discovers skills under `.claude/skills/`; this repo keeps `skills/` canonical and symlinks each one into `.claude/skills/` (already done for the four starters — repeat for new skills: `ln -s ../../skills/<name> .claude/skills/<name>`). On Windows, copy instead of symlinking. Other runtimes (OpenClaw, Cursor, Codex) read `skills/` directly or per their docs.

---

## SKILL.md frontmatter contract

```yaml
---
name: normalize-meeting
description: >
  One or two sentences describing what the skill does and when to use it.
  This is the ONLY part loaded at session start, so make the trigger explicit.
  Start with "Use when..." so the agent can match it.
version: 1.0.0
---
```

Keep `description` under ~40 words and lead with the trigger condition.

---

## SKILL.md body structure

| Section | What goes here |
|---------|----------------|
| **Purpose** | One paragraph: what this skill accomplishes |
| **Inputs** | What the skill expects (a transcript path, a customer slug, etc.) |
| **Steps** | Numbered, deterministic procedure |
| **Output** | Exactly what it produces and where (which folder, what filename pattern) |
| **Guardrails** | What it must NOT do; when to stop and ask |
| **Example** | One worked input → output |

Keep the body under ~500 lines. Overflow goes in `references/`.

---

## Worked example

`skills/customer-brief/SKILL.md`:

```markdown
---
name: customer-brief
description: >
  Use when the user asks to be briefed on a customer before a call, board
  meeting, or investor update. Produces a one-page summary from the customer
  file plus recent meetings and pipeline.
version: 1.0.0
---

# Customer brief

## Purpose
Generate a tight, one-page briefing on a single customer so the founder can
walk into a conversation prepared.

## Inputs
- A customer slug or name (resolve to `customers/<slug>.md`).

## Steps
1. Read `customers/<slug>.md` (compiled truth + timeline).
2. Pull the last 3 meeting notes referencing this customer from `meetings/`.
3. Check `sales/pipeline.md` for any open deal.
4. Summarize into: who they are, relationship status, recent activity,
   open items, risks, and 3 talking points for the upcoming conversation.

## Output
A markdown brief printed in chat (not saved as a file unless asked).
≤1 page. Lead with the single most important thing.

## Guardrails
- Never invent contract values or contacts not in the source files.
- If `last_verified` is >30 days old, flag the brief as possibly stale.
- No compensation or internal-only people data in a brief that might be shared.

## Example
Input: "brief me on Acme before my 3pm"
Output: one-page summary drawn from customers/acme-labs.md + recent meetings.
```

---

## Portability

Skills written here are compatible with OpenClaw, Cursor, and Codex unmodified, unless they depend on a client-specific hook. For OpenClaw workspace use, symlink or copy this folder into the OpenClaw workspace `skills/` directory.

---

## Security — treat third-party skills as untrusted code

Skill supply-chain attacks are real and recent (ClawHavoc, Feb 2026: ~341 malicious skills; a Snyk audit found 283 leaking credentials). Rules:

- **First-party by default.** Write your own.
- **Read every line** of any third-party `SKILL.md` before installing — the `description` field is a prompt-injection vector.
- **Pin versions.** Never auto-update a skill that touches a production gateway.
- **Sandbox** non-first-party skills (OpenClaw Docker mode) when possible.
- **Least privilege:** a skill should only touch the folders and MCP scopes it genuinely needs.
