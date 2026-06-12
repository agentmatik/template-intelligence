# Setup — from empty to working intelligence

## Two paths

**Path A:** I have existing files (decks, notes, docs) and want an agent to build the v1 for me.
→ Use [`docs/AGENT-INSTRUCTIONS.md`](./AGENT-INSTRUCTIONS.md). Open it in Claude Code, point at your source folder, and follow Phase 0 onwards.

**Path B:** I'm starting fresh and want to seed it myself.
→ Continue reading.

## Prerequisites

- GitHub account (private repo is free with limits, $4/mo Pro otherwise)
- Claude Code installed — [`code.claude.com/docs/en/setup`](https://code.claude.com/docs/en/setup)
- 1Password CLI with Claude Code shell plugin (for secrets) — [`developer.1password.com/docs/cli/shell-plugins/claude-code`](https://developer.1password.com/docs/cli/shell-plugins/claude-code)
- (Optional) Obsidian for local Markdown editing

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
- [ ] `strategy.md` — top 3 priorities for this quarter. Mark `status: verified`.
- [ ] `product.md` — one paragraph, link to Linear roadmap.
- [ ] `brand.md` — 3 dos, 3 don'ts, voice example.
- [ ] `ops.md` — cadence, decision rights, tools.
- [ ] `customers/<top-customer>.md` — use `templates/customer.md`.
- [ ] `competitors/<top-competitor>.md` — use `templates/competitor.md`.
- [ ] `people/<cofounder>.md` — use `templates/person.md`.
- [ ] `decisions/<today>-adopt-company-intelligence.md` — log this decision.
- [ ] `weekly/<this-week>.md` — write your first weekly brief.

Don't aim for comprehensive. Aim for **accurate**. Blanks are better than guesses.

## Step 4 — Secure the repo (5 min)

GitHub Settings → Security:
- ✅ Secret scanning + Push protection
- ✅ Dependabot alerts
- ✅ Branch protection on `main` (require PR review)
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
# Granola, Slack, Workspace per current docs at github.com/<provider>/mcp-server
```

OAuth in browser when prompted. Test:

```
> In Claude Code: Read AGENTS.md and summarize how this company is organized.
```

If wrong, fix the files (not the prompt).

## Step 6 — Try a real task

```
> /skill weekly-brief
```

Or:

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
| 6   | First proper Friday weekly brief via `/skill weekly-brief`                         |
| 7   | Audit what's draft vs verified                                                     |
