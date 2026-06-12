# Operations

How the intelligence runs after setup. Daily/weekly/monthly/quarterly rituals. PR flow. Staleness. Success signals.

## Content flow

```
   raw material              PR review              canonical truth
┌──────────────┐    ┌─────────────────┐    ┌──────────────────┐
│ Granola      │ →  │ meetings/ (raw) │ →  │ customers/       │
│ Slack        │    │ or inbox/       │    │ decisions/       │
│ Decks/PDFs   │    │                 │    │ strategy.md      │
│ Linear       │    │ /update-wiki    │    │ ...              │
│ Notion       │    │ opens PR        │    └──────────────────┘
└──────────────┘    └─────────────────┘
                            │
                            ▼
                   Human reviews diff
                   on GitHub, merges
```

Raw → time-series folders (auto-commit OK). Canonical → PR required.

## Daily (10 min)

> The `/...` commands below are the starter skills — type them into Claude Code's chat (they live in `skills/`). Not technical? Your whole job is one page: [`HUMAN-JOB.md`](./HUMAN-JOB.md).

- After each meeting: run `/normalize-meeting` within 48h, while context is fresh and the transcript is still easy to retrieve
- Glance at your local `inbox/` folder (a gitignored scratch folder you create for raw drops): `/update-wiki`, or archive
- Touch one canonical page per day
- Log decisions as they happen — don't defer

## Weekly (Friday, 30 min)

- Run `/weekly-brief` → review draft → merge
- KPIs & goals check (if running `management/`): off-track items become issues; off-track 2 weeks running → decide and log to `decisions/`
- Run `scripts/check-stale.sh` — verify or archive flagged files; resolve any `[VERIFY]` tags you know the answer to (confirm → remove tag → bump `last_verified`)
- Merge open PRs — CI green (`validate` workflow: frontmatter, secrets, links)
- Spot-check: ask the agent one question whose answer changed this week — wrong answer means a file needs fixing

## Monthly (first Monday, 60 min)

- OKR/bet check-in — update `strategy.md`
- Refresh top 10 `customers/` compiled-truth blocks
- Deep pass on one competitor
- Prune `memory/learnings.md`: merge duplicates, delete disproven entries, promote standing-behavior changes to `memory/MEMORY.md` (and keep it under its 200-line cap)
- Skill-candidate sweep: any workflow appearing 3+ times in learnings/worklogs that isn't a skill yet → the agent drafts it as a PR (`skills/README.md`)
- Archive `meetings/`, `weekly/`, and `memory/` dailies older than 6 months to `<folder>/archive/YYYY/`
- Run `gitleaks detect --source .` — should be clean

## Quarterly (2 hrs)

- Rewrite `strategy.md` for the new quarter
- Roll `management/goals.md`: move the finished quarter below the `---` with final statuses, set 3-7 new goals; review `vision.md` (rewrite the 1-year plan annually)
- Prune duplicate canonical pages (merge them)
- Refresh top 20 files
- Audit MCP scopes — read-only by default
- Decide: rebuild or iterate? Don't restart the repo. Iterate.

## Staleness detection

| Type          | Fresh      | Stale      | Archive    |
|---------------|------------|------------|------------|
| Strategy      | <90 days   | 90-180     | >180       |
| Product spec  | <30 days   | 30-90      | >90        |
| Customer      | <30 days   | 30-60      | >60 inactive |
| Competitor    | <60 days   | 60-180     | >180       |
| Person        | <180 days  | 180-365    | >365       |
| Decision      | Never stale — historical |
| Meeting       | Never stale — historical |

Run `scripts/check-stale.sh` weekly.

## How PRs should look

**Good:**
- Small — one idea, one file (or tight set)
- Semantic commit: `customer(acme): update renewal status after 2026-04-15 call`
- Frontmatter `updated` and `last_verified` refreshed
- Links to evidence
- No secrets, no PII

**Bad:**
- "Various updates" across 8 files
- Rewrites timeline (timeline is immutable)
- New canonical file without frontmatter
- Raw transcript content that should have been summarized
- Touches `finance.md` from automated sync (manual only)

## Measurable signals — is this working?

At day 30, you should answer **yes** to all:

- [ ] Can Claude Code summarize current quarter priorities correctly?
- [ ] Can it name top 3 customers with current status?
- [ ] Can it identify which competitor is closest in positioning?
- [ ] Can it produce a coherent weekly brief from last week's material?
- [ ] Have we merged 10+ PRs?
- [ ] Have we caught at least one factual error via `last_verified` staleness?
- [ ] Can a new team member understand the company in <30 min from `AGENTS.md` + `company.md` + `strategy.md`?

If any answer is no, the fix is almost always **more content, not more structure**.

## Founder eval — the 20 questions

Once a quarter, run these against Claude Code:

1. What did we decide about pricing?
2. What changed in the customer narrative this month?
3. Which product risks have come up repeatedly?
4. Who's the primary champion at [customer]?
5. When does [customer]'s contract renew?
6. What's [competitor]'s differentiator vs us?
7. Who owns [domain] on the team?
8. What's our current burn rate? (should route to live sheets via MCP, not invent)
9. What were last week's wins?
10. What decisions are still open?
11. What's the onboarding for a new hire?
12. Summarize this week for an investor.
13. Draft a message to [customer] about [topic], in our voice.
14. What do we believe about [market trend]?
15. What SOPs cover [situation]?
16. What's the last thing we discussed with [person]?
17. What did [team member] accomplish last month?
18. What patterns are emerging in customer feedback?
19. What's at risk on the roadmap?
20. What would a prospective employee most want to know?

Regressions in answer quality = content rotted or structure no longer serves.

## When something breaks

**Agent makes things up:** the canonical page probably doesn't exist or is `status: draft`. Fix the file.

**Agent ignores a rule in AGENTS.md:** the file is too long. `wc -l AGENTS.md` should be ≤200. Move detailed rules to skills.

**MCP server stopped:** OAuth expired. `claude mcp list` → re-authenticate. Pin server versions to avoid breaking updates.

**Auto-sync created garbage:** revert the PR. Tighten the skill prompt. Re-run.

**Secret committed:** rotate immediately. Scrub history with `git filter-repo` or BFG Repo-Cleaner. Force-push. Enable push-protection if not already.
