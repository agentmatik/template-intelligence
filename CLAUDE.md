# CLAUDE.md

@AGENTS.md

This file adds **Claude-Code-specific** guidance on top of the universal rules in `AGENTS.md`. Read `AGENTS.md` first.

## Read order at session start

1. `AGENTS.md` (loaded via the import above)
2. `INDEX.md` for a curated map of entry points
3. **`FACTSHEET.md`** - the dense quick-reference for any specific company fact or official link (store/socials/registration/funding/founders). **Reach for it first when asked to fill an application/form/deck or to produce a specific fact or URL**; don't hunt across files.
4. If the task is recent-work-related: the most recent file in `weekly/`
5. If the task touches a specific domain: that root file or folder
6. Only then use MCP for fresh operational state

## Claude-Code features - when to reach for each

| Feature             | Use for                                                            |
|---------------------|--------------------------------------------------------------------|
| **CLAUDE.md**       | Always-on repo rules. Short. Imports `AGENTS.md`.                  |
| **Skills**          | Reusable workflows. On-demand, not always loaded.                  |
| **Slash commands**  | User-triggered shortcuts. `/weekly-brief`, `/customer-brief`       |
| **Subagents**       | Isolated research or triage. Returns a compact summary.            |
| **Hooks**           | Automation around events - lint, validate, import, notify.        |
| **Output styles**   | Tone/format changes. Not for repo rules or knowledge.              |
| **MCP**             | Live reads and narrow writes. Not long-term memory.                |

## Session management

- Use **plan mode** for large restructures or cross-domain changes.
- **Compact aggressively** once a long task has stable plan and stable notes.
- Don't assume anything from previous chat survives unless written to a file or persisted by a configured tool.

## Thinking levels

- `think` - default; routine queries, transcript summaries.
- `think hard` - competitive analysis, strategy questions.
- `ultrathink` - fundraising memos, board prep, architectural decisions.

## What does NOT belong here

Do not add to `CLAUDE.md`:

- Long procedures → put in `skills/<name>/SKILL.md`
- Service-specific playbooks → put in `ops.md` or a dedicated runbook
- Vendor docs or large reference material → not in this repo at all; fetch via MCP
- Company knowledge → put in the appropriate knowledge file

## Local overrides

Personal per-machine overrides (sandbox URLs, local paths, preferred thinking mode) go in `CLAUDE.local.md`. That file is gitignored.

@CLAUDE.local.md

## Copy style (house rule, example)
- In all human-facing copy (guides, posts, emails, client deliverables, docs) use a plain hyphen `-`. Never use em-dashes or en-dashes; replace them with `-` or rephrase the sentence. Keep or change this rule when you instantiate the template.
