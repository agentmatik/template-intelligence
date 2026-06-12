# Glossary

Every term this repo uses, defined. If a word here is unclear anywhere in the docs, the docs failed — open a PR adding or improving the entry. Two sections: the system's own vocabulary (ships with the template), and your company's terms (you grow it).

## System terms

| Term | Meaning |
|------|---------|
| **SSOT** | Single source of truth — each fact lives in exactly one canonical place; everything else links to it. This repo is the company's SSOT. |
| **Agent** | An AI assistant (Claude Code, OpenClaw, Cursor…) that reads and writes this repo on your behalf. You talk to it; it does the file work. |
| **PR (pull request)** | GitHub's "proposed change" mechanism: a bundle of edits you review as a diff and accept with the **Merge** button. How all canonical truth enters this repo. See [`guides/HUMAN-JOB.md`](./guides/HUMAN-JOB.md) for the click-by-click. |
| **Merge** | Accepting a PR — the moment a proposed change becomes truth on `main`. |
| **CI** | Continuous integration — automated checks that run on every PR (here: frontmatter, secrets, links, staleness). Green check = safe to merge; red = something's wrong. |
| **Diff** | The before/after view of a change, shown line by line in a PR. |
| **Frontmatter** | The `--- … ---` block of metadata (type, status, owner, dates) at the top of every durable file. Lets agents route and lets staleness be measured. |
| **Compiled truth** | The top half of an entity page (above the `---` rule): the current best understanding, rewritten freely as you learn. |
| **Timeline** | The bottom half of an entity page: dated, append-only history. Never edited, never deleted — corrections are new dated lines. |
| **ADR** | Architecture decision record — the format `decisions/` files use: context, the decision, consequences, alternatives. Despite the name, used for *any* significant decision, not just technical ones. |
| **Wikilink** | `[[customers/acme-co]]` — an agent navigation convention pointing at another file, repo-root-relative, no `.md`. GitHub renders them as plain text; agents resolve them. |
| **MCP** | Model Context Protocol — the standard that lets agents read/write live systems (Slack, Linear, Notion, Granola…) directly. The repo holds durable truth; MCP fetches live state. |
| **Skill** | A reusable agent procedure in `skills/<name>/SKILL.md`. In Claude Code you invoke one by typing its name as a slash command (e.g. `/weekly-brief`) in the chat. |
| **Handbook-first** | Document the change in this repo, *then* announce it with a link — never the reverse. |
| **North-star metric** | The single number the whole company optimizes — defined in `strategy.md`. If it moves, everything is working. |
| **KPI** | Key performance indicator — one of the 5–15 weekly numbers in `management/kpis.md` (definitions and dashboard links live there; the values stay in dashboards). |
| **Goal (quarterly)** | One of the 3–7 owned, binary-done quarterly goals in `management/goals.md`. EOS calls these *Rocks*. |
| **Seat** | A role in `management/accountability.md` with exactly one accountable owner — "when two people are accountable, nobody is." |
| **EOS** | Entrepreneurial Operating System (Gino Wickman, *Traction*) — one of the frameworks the `management/` pack is compatible with. You don't need to know it. |
| **L10 / Level 10 Meeting™** | EOS's weekly leadership meeting format: segue (good news) → KPI review → goal review → headlines → to-dos → IDS → conclude. |
| **IDS** | Identify–Discuss–Solve — EOS's issue-processing method: name the real issue, discuss it once, decide. The point is issues get *solved*, not re-discussed weekly. |
| **Segue** | The opening minutes of an L10: each person shares one piece of good news. Jargon for "check-in." |
| **`[VERIFY]`** | Inline tag marking a fact that came from an unconfirmed source (auto-transcription, inference). Anyone who knows the answer confirms it, removes the tag, bumps `last_verified`. `[INFERENCE]` marks a reasoned guess. |
| **Staleness** | How long since a file's `last_verified` date. `scripts/check-stale.sh` flags files past their type's threshold. |
| **gitleaks** | The secret scanner that blocks commits/PRs containing API keys, tokens, or credentials. |
| **ISO week** | Week numbering where week 1 contains the year's first Thursday — keeps `weekly/2026-W17.md` files sorting correctly across years. |
| **Clone** | Downloading a copy of the repo to your computer (`git clone …`) so agents can work in it. |
| **Inbox** | A local, gitignored scratch folder (`inbox/`) you create for raw drops — files you want the agent to file properly via the `update-wiki` skill. Never committed. |

## Company terms

<!-- Your domain vocabulary: product names, internal shorthand, market terms.
One row each. Agents: when you meet an undefined company term, add it here
(PR) rather than guessing. -->

| Term | Meaning |
|------|---------|
