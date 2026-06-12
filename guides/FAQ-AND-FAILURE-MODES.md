# FAQ & failure modes

Judgment calls, mechanical failures, and anti-patterns — for agents and humans. When something feels wrong, check here before improvising.

## Judgment calls

**A fact in a verified file looks wrong. Do I just fix it?**
Fix it via PR with evidence linked, and append a dated timeline entry noting the correction. Never silently edit — the founder reviewing the diff *is* the verification. If you only *suspect* it's wrong, tag it `[VERIFY]` instead and flag it.

**Two files disagree. Which wins?**
Surface the conflict; don't pick silently. Precedence while you wait: `status: verified` beats `draft`; newer `last_verified` beats older; the more specific file (entity page) beats the general one (root file). The fix PR should make them agree and leave one canonical home.

**I can't tell whether something is a decision, a meeting note, or a strategy change.**
It can be all three: the meeting note records the *session*, the decision file records the *commitment*, strategy.md changes only if a priority/bet changed. When a meeting produced a decision, both files exist and link to each other.

**The user asked me to commit something the rules prohibit (a salary, an API key, a cap table).**
Refuse, cite the hard prohibitions ([`DATA-ORGANIZATION-PLAYBOOK.md`](./DATA-ORGANIZATION-PLAYBOOK.md)), and offer the correct home (encrypted store, source system). This is the one case where "the user is in control" does not apply.

**Something doesn't fit any folder.**
Re-read the routing table. Still nothing? Prefer extending an existing file over inventing structure; if structure is genuinely needed, propose it in the PR description. Never create a catch-all `notes.md`.

**I'm about to write a file >1000 words.**
Stop — you're probably pasting instead of distilling, or putting tactics where strategy belongs. Check the length caps in [`AGENT-INSTRUCTIONS.md`](./AGENT-INSTRUCTIONS.md) §3.4.

## Mechanical failures

**CI: Frontmatter contract failed.**
The error names the file and missing field. Add it, matching the folder README's contract. Locally: `make frontmatter`.

**CI: Markdown link check failed.**
A relative link points at a moved/renamed/missing file. `make links` reproduces it locally; fix the path. (Wikilinks `[[...]]` are not checked — verify those by hand when you touch them.)

**CI: Secret scan failed.**
Stop everything. The credential is **burned — rotate it first**, then scrub (see [`SECURITY.md`](../SECURITY.md)). Do not just delete the line and re-push; it's in git history.

**Push rejected (branch protection / non-fast-forward).**
You're pushing to `main` or your branch is behind. Branch → PR is the only path for canonical writes; `git pull --rebase` your branch if it's stale.

**The pre-commit hook blocks my commit.**
It found a staged secret or an `inbox/` file. Neither belongs in history. Don't bypass with `--no-verify` — fix the staged content.

**The agent can't reach Linear/Slack/Granola (MCP error).**
OAuth likely expired: `claude mcp list` → re-authenticate. Work from repo files meanwhile and state the gap in your output ("Linear unavailable — shipped list from meeting notes only").

**bootstrap.sh seems to do nothing on re-run.**
That's correct — it's idempotent. Already-filled placeholders are skipped; answer only the ones you skipped before.

## Anti-patterns (the ways this system actually dies)

1. **The repo lags reality.** Decisions get made in calls and never written. Antidote: handbook-first + normalize meetings within 48h. If you're reconstructing last month, you've already lost.
2. **Pasting instead of distilling.** Raw transcripts and dumped exports make the repo unreadable and retrieval worthless. The repo is the *compiled* knowledge.
3. **Everything stays `draft` forever.** Then `verified` means nothing and agents can't trust any file. The founder's review habit is the system's backbone.
4. **Pasted metric values.** They're stale by next week and silently lie. Definitions + dashboard links only.
5. **Structure inflation.** New folders/taxonomies before content demands them. Add structure when a file outgrows its home, never speculatively.
6. **Auto-merge creep.** "It's just the weekly" → trust erodes → nobody reads it. Time-series auto-commits; everything canonical gets human eyes.
7. **Memory hoarding.** `MEMORY.md` drifting past its 200-line cap means agents silently stop seeing the end of it. Distill, don't append.
8. **The agent re-learns the same lesson weekly.** If a correction didn't become a `learnings.md` entry, it will happen again. The learning loop is not optional.
