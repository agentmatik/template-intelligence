# The human's job

Agents do the file work. Your job is small, specific, and non-delegable: **answer questions, review changes, verify truth.** This page is everything you personally must know how to do — with zero assumed technical background.

## Your week at a glance

| When | What | How long |
|------|------|----------|
| After meetings | Tell the agent: *"normalize today's <topic> meeting"* | 1 min each |
| Daily | Answer anything the agent asked; glance at open PRs | ~10 min |
| Friday | Say *"/weekly-brief"*, then review and merge the draft | ~30 min |
| Monthly / quarterly | The rituals in [`OPERATIONS.md`](./OPERATIONS.md) — the agent walks you through them if you ask | 1–2 h |

Everything else — filing, formatting, cross-linking, frontmatter — is the agent's job. If you're hand-editing Markdown regularly, something is wrong: tell the agent to do it.

## How to review and merge a PR (the core skill)

A **PR (pull request)** is a proposed change to the repo's truth. Nothing becomes canonical until you approve it. Click-by-click:

1. **Find it:** github.com → your repo → **Pull requests** tab. (You'll also get an email per PR.)
2. **Open it** and click **Files changed**. You'll see the *diff*: red lines = removed text, green lines = added text. Read the green.
3. **Check three things** — you are verifying *truth*, not style:
   - Is every stated fact correct? (You're the only one who knows.)
   - Anything that shouldn't be written down — secrets, salaries, personal data?
   - Does it touch a timeline (the dated list under a `---`)? Past entries must never be edited, only added to.
4. **Check the checks:** near the merge button, automated checks report. **Green ✓** = formatting, links, and secret-scan passed. **Red ✗** = click *Details*, then ask your agent: *"CI failed on PR #N — fix it."* Don't merge red.
5. **Decide:**
   - Right → press **Merge pull request** → **Confirm**. It's now truth.
   - Wrong or unclear → write what's wrong in the comment box (plain language is fine: *"Acme's renewal is January, not March"*) → **Comment**. The agent fixes and the PR updates.
6. Delete the branch if GitHub offers to. Done.

**Rule of thumb: a PR review is a 2-minute fact-check, not an editing session.** If a PR is too big to fact-check in a few minutes, comment "split this" — small PRs are the contract.

## Marking things verified

Files the agent creates start as `status: draft` — meaning *unconfirmed*. When a draft's content is right, tell the agent: *"mark <file> verified"*. Only you promote drafts; that's what makes `verified` mean something. Same with `[VERIFY]` tags: when you see one you know the answer to, say so — the agent fixes the fact and removes the tag (a 2-minute PR).

## What you must never do

- Edit truth directly on `main` (always via PR — even you).
- Merge a PR with a red ✗.
- Put secrets, salaries, health or personal data anywhere in the repo — even in a comment.
- Rewrite history (timelines, decisions). Corrections are new dated entries.

## Asking instead of clicking

Every mechanical step above can be delegated: *"list open PRs and summarize each in one line"*, *"show me what changed in PR #12 in plain language"*, *"merge PR #12"* (after you've read the summary). The one thing you can't delegate is **knowing whether the facts are true**.
