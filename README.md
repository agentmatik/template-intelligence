# Company Intelligence — starter template

A single-source-of-truth Git repo of plain Markdown that serves three audiences at once:

- **Humans** read it in their editor, GitHub, Obsidian, or a rendered MkDocs site.
- **AI agents** (Claude Code, Cursor, Codex, OpenClaw, Gemini, Windsurf, Aider…) read it via `AGENTS.md`.
- **Live systems** (Linear, Slack, Notion, Granola, Google Workspace) plug in through MCP.

Durable truth lives here. Execution state stays in the systems that own it. Agents synthesize across both.

## What's "intelligence"?

The **intelligence** is the persistent knowledge layer your company runs on: an operating layer, not just storage. Agents and humans both read from it. Both write to it. PRs gate the truth.

## Who this is for

- **Founders** who want their AI agents to actually know their company
- **Small teams (1–20 people)** who don't need enterprise knowledge graphs
- **Consultancies and agencies** who want a reusable client template
- **Anyone** tired of repeating company context to every new chat

## What you get

```
<company>-intelligence/
├── Entry files          AGENTS.md, README.md, INDEX.md
├── Root knowledge       company.md, strategy.md, product.md, brand.md, ops.md, finance.md
├── Entity folders       customers/, competitors/, people/, sales/
├── Time-series          meetings/, decisions/, weekly/
├── Agent infrastructure skills/ (optional), templates/
└── Config               .gitignore, .github/workflows/
```

## Quick start (≤30 minutes)

See [`SETUP.md`](./SETUP.md). It walks you from empty clone to working intelligence with seeded strategy, one skill installed, and Claude Code reading the repo correctly.

## For agents starting fresh

If you're an AI agent reading this repo for the first time — your operating contract is [`AGENTS.md`](./AGENTS.md). Read it before doing anything else.

If you've been asked to **build** an intelligence repo for a company from existing files, read [`docs/AGENT-INSTRUCTIONS.md`](./docs/AGENT-INSTRUCTIONS.md). It's a complete, exhaustive operating manual for the migration task.

## How to use this as a template

1. Click **Use this template** on GitHub (or `gh repo create --template`)
2. Name the new repo `<company>-intelligence`
3. Make it **private**
4. Clone locally, run find/replace on `{{COMPANY_NAME}}`, `{{COMPANY_SHORT}}`, `{{FOUNDER_NAME}}`, etc.
5. Follow [`SETUP.md`](./SETUP.md)

For founders applying this to their own company: budget one afternoon for setup, one week for seed content. For consultancies applying it to a client: budget a 2-hour kickoff workshop plus one week of async ingestion.

## Design principles (the one-paragraph version)

One durable truth (Git) + many live sources (MCP). Prefer file-native context before retrieval systems. Separate stable rules from fluid facts. Keep always-loaded files small. Put repeatable know-how in Skills, not in the root prompt. Use subagents for isolation. Plan, then act, then compact. Use MCP for freshness and narrow writes, not as long-term memory. Assume prompt injection is real. **Don't add RAG, vector DBs, or graph DBs until your traces prove you need them.**

See [`docs/ARCHITECTURE.md`](./docs/ARCHITECTURE.md) for the full rationale.

## License

MIT for the template structure. Your content is yours.

---

**Maintained by [Agentmatik](https://agentmatik.com).** Based on consensus across independent deep research on agent-ready company context patterns (Anthropic, Cline, gbrain, Superpowers, Chroma context-rot research, LangChain context engineering, AGENTS.md standard).
