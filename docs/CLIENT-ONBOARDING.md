# Client onboarding — the consultancy playbook

How an agency or consultant stands up a company intelligence repo **for a client**, from kickoff to handoff. Founders building their own repo use [`SETUP.md`](./SETUP.md) instead; this doc wraps the same mechanics in an engagement structure.

**Total footprint: a 2-hour kickoff workshop + one week of async ingestion + a 1-hour handoff.**

---

## Phase 1 — Before kickoff (you, 30 min)

1. Create the client repo from the template: `gh repo create <client-org>/<client>-intelligence --template <your-org>/template-intelligence --private`. **Private, always.** Prefer the client's own org — they must own their truth; you get collaborator access.
2. Run `./scripts/bootstrap.sh` with the client's details.
3. Enable repo security: secret scanning + push protection, branch protection on `main` requiring PR review, CODEOWNERS pointing at the client founder (and you, for the engagement's duration).
4. Send the client a **source-material request** ahead of the workshop: latest pitch deck, planning/OKR doc or board update, brand guide (if any), customer list or CRM export, team list, last 30 days of meeting notes/transcripts, tool inventory. Plus the exclusion question: *"Anything you do NOT want in the repo (HR, comp, NDA folders)?"*

## Phase 2 — Kickoff workshop (2 hours, with the founder)

The goal is the **verbal truth the documents don't contain**. Work through, in order, capturing rough notes live:

| Segment | Time | Produces (later) |
|---------|------|------------------|
| What the company is, what it's not — the boundary | 20 min | `company.md` incl. "what we don't do" |
| North-star metric + this quarter's top 3, force-ranked | 25 min | `strategy.md` |
| Who decides what without committee | 15 min | `ops.md` decision rights → `operating-system/accountability.md` |
| Top 5 customers + top 3 competitors, one honest sentence each | 25 min | seeds for `customers/`, `competitors/` |
| Voice: 3 dos, 3 don'ts, one real example of "that's not us" | 15 min | `brand.md` |
| Cadence & tools walkthrough (their calendar tells the truth) | 10 min | `ops.md` |
| Long-horizon (10-year target, 3-year picture) — only if the founder has real answers | 10 min | `operating-system/vision.md`, else `<not yet set>` |

Close by agreeing the **review rhythm**: the founder commits to reviewing draft PRs within the ingestion week, ~30 min/day.

## Phase 3 — Ingestion week (you + an agent, async)

Run the standard migration: point your coding agent at the source material with [`AGENT-INSTRUCTIONS.md`](./AGENT-INSTRUCTIONS.md) (the eleven-phase procedure) and [`DATA-ORGANIZATION-PLAYBOOK.md`](./DATA-ORGANIZATION-PLAYBOOK.md). Engagement-specific rules on top:

- **Everything lands as `status: draft` PRs.** Only the *client* promotes to `verified` — the consultant never vouches for client facts.
- Batch PRs by domain (one for root files, one per entity folder) so the founder's daily review stays under 30 min.
- Workshop notes outrank stale documents when they conflict; note each conflict in the handoff.
- Sensitive material discovered in sources goes in the handoff's quarantine list — never in the repo, even "temporarily".

Day 5: run the **smoke test** — ask the agent the first 10 of the 20 founder-eval questions ([`OPERATIONS.md`](./OPERATIONS.md)). Fix content (not prompts) where answers are wrong.

## Phase 4 — Handoff (1 hour, with the founder)

1. Walk `MIGRATION-HANDOFF.md`: what was migrated, skipped, quarantined, and the prioritized review list.
2. Live demo, in the client's own Claude Code (or tool of choice): "Read AGENTS.md and summarize how this company is organized" · "Brief me on <their top customer>" · "Draft this week's brief". The demo lands the value better than any document.
3. Hand over the **operating habit**, not just the repo: the daily/weekly/monthly table in [`OPERATIONS.md`](./OPERATIONS.md), and the four starter skills as their entry points.
4. Agree what happens to your access: remove, or keep for a maintenance retainer (below).

## Ongoing (optional retainer)

A natural light-touch retainer shape: weekly — review the client's merged PRs, run `check-stale.sh`, tend `memory/learnings.md`; monthly — the OPERATIONS monthly ritual + a content-quality pass; quarterly — re-run the full 20-question eval and report regressions.

## Engagement guardrails

- **The client owns the repo and the truth.** You own the process. Never be the only person who can operate it.
- Your improvements to the *template* (better contracts, new scripts) flow back to your template repo — generic up, specific down. Client-specific content never leaves their repo.
- One client = one repo. Never share context, skills with embedded client facts, or MCP scopes across client repos.
- Track your own engagement state (tasks, hours, notes) in **your** systems, not in the client's intelligence repo.
