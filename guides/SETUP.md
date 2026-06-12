# Setup — from empty to working intelligence

> **Not technical? You don't have to run any of this yourself.** After Step 1, open Claude Code in the repo folder and say: *"Read guides/SETUP.md and walk me through it — run the commands for me and interview me for the seed content."* The agent executes; you answer questions and review. The steps below are the manual path for technical users (and the agent's own playbook).

## Two paths

**Path A:** I have existing files (decks, notes, docs) and want an agent to build the v1 for me.
→ Use [`guides/AGENT-INSTRUCTIONS.md`](./AGENT-INSTRUCTIONS.md). Open it in Claude Code, point at your source folder, and follow Phase 0 onwards.

**Path B:** I'm starting fresh and want to seed it myself.
→ Continue reading.

## Prerequisites

- GitHub account (private repos are free)
- Claude Code installed — [`code.claude.com/docs/en/setup`](https://code.claude.com/docs/en/setup) — and the GitHub CLI (`gh`), which Claude Code can install for you
- Optional: 1Password CLI with the Claude Code shell plugin (for secrets) — [`developer.1password.com/docs/cli/shell-plugins/claude-code`](https://developer.1password.com/docs/cli/shell-plugins/claude-code)

## Step 1 — Use this template (3 min)

On GitHub: click **Use this template** → create new repo `<company>-intelligence` → **private**.

```bash
gh repo clone <org>/<company>-intelligence
cd <company>-intelligence
```

## Step 2 — Fill placeholders (2 min)

```bash
./scripts/bootstrap.sh
```

Interactive: fills every `{{PLACEHOLDER}}` across the repo, stamps scaffold dates with today, and offers to install the gitleaks pre-commit hook. Idempotent — skip a question to fill it later.

The placeholders, if you prefer manual find/replace:

| Placeholder                  | Example                      |
|------------------------------|------------------------------|
| `{{COMPANY_NAME}}`           | Acme Labs Ltd.               |
| `{{COMPANY_SHORT}}`          | acme                         |
| `{{COMPANY_TAGLINE}}`        | AI-native analytics for SMEs |
| `{{FOUNDER_NAME}}`           | Sarah Reinhardt              |
| `{{FOUNDER_EMAIL}}`          | sarah@acme.co                |
| `{{GITHUB_ORG}}`             | acme-labs                    |
| `{{GITHUB_FOUNDER_HANDLE}}`  | sarahreinhardt (CODEOWNERS)  |

## Step 3 — Seed the ten minimum files (60 min)

Fill the minimum that makes the intelligence useful from day 1:

- [ ] `company.md` — mission, stage, team. Mark `status: verified`.
- [ ] `strategy.md` — north-star metric + top 3 priorities this quarter. Mark `status: verified`.
- [ ] `product.md` — one paragraph, link to Linear roadmap.
- [ ] `brand.md` — 3 dos, 3 don'ts, voice example.
- [ ] `ops.md` — cadence, decision rights, tools.
- [ ] `finance.md` — pointers to where the money truth lives (never numbers).
- [ ] `customers/<top-customer>.md` — use `templates/customer.md`.
- [ ] `competitors/<top-competitor>.md` — use `templates/competitor.md`.
- [ ] `people/<cofounder>.md` — use `templates/person.md`.
- [ ] `decisions/<today>-adopt-company-intelligence.md` — log this decision.
- [ ] `weekly/<this-week>.md` — write your first weekly brief.

Also decide now (5 min — optional, but the weekly ritual reads them):

- **`management/`** — fill `goals.md` (this quarter's 3–7 goals) and `kpis.md` (your weekly numbers) if you track them; otherwise leave the scaffolds.
- **`memory/MEMORY.md`** — add 3–5 standing preferences ("always PRs, never direct pushes", your name, your timezone).
- Create a local **`inbox/`** folder (gitignored) — your drop zone for raw files the agent files via `/update-wiki`.

Don't aim for comprehensive. Aim for **accurate**. Blanks are better than guesses.

## Step 4 — Secure the repo (5 min)

GitHub Settings → Security:
- ✅ Secret scanning + Push protection
- ✅ Dependabot alerts
- ✅ Branch protection on `main` (require PR review) — note: free-plan **private** repos don't enforce this; until upgraded, no-direct-pushes is self-enforced (agents via AGENTS.md, humans via [`HUMAN-JOB.md`](./HUMAN-JOB.md))
- ✅ Add CODEOWNERS if multi-person

Local pre-commit:

```bash
brew install gitleaks
ln -sf ../../scripts/pre-commit.sh .git/hooks/pre-commit
chmod +x scripts/pre-commit.sh
```

## Step 5 — Configure MCP (10 min)

In Claude Code, add MCP servers one at a time:

```bash
claude mcp add --transport http linear https://mcp.linear.app/mcp
claude mcp add --transport http notion https://mcp.notion.com/mcp
claude mcp add --transport http github https://api.githubcopilot.com/mcp
# Granola, Slack, Google Workspace: each publishes its own MCP server —
# search "<tool> MCP server" for install docs, or ask Claude Code to add them
```

OAuth in browser when prompted. Test:

```
> In Claude Code: Read AGENTS.md and summarize how this company is organized.
```

If wrong, fix the files (not the prompt).

## Step 6 — Try a real task

Skills are invoked as slash commands — type them into Claude Code's chat:

```
> /weekly-brief
```

Or just ask in plain language:

```
> Brief me on <customer> before tomorrow's call.
```

Iterate. Add Skills when a workflow repeats. Add MCP servers as needed.

## Week 1 — fill the structure

| Day | Focus                                                                              |
|-----|------------------------------------------------------------------------------------|
| 1   | Steps 1–6 above                                                                    |
| 2   | Add 3-5 more customers + competitors                                               |
| 3   | Write 3 recent decisions you've made                                               |
| 4   | Add Granola MCP + normalize last 5 meetings                                        |
| 5   | Add team members to `people/`                                                      |
| 6   | First proper Friday weekly brief via `/weekly-brief`                         |
| 7   | Audit what's draft vs verified                                                     |
