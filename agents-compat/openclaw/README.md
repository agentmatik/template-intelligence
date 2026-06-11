# OpenClaw workspace compatibility

This folder makes the intelligence repo usable as an [OpenClaw agent workspace](https://docs.openclaw.ai/concepts/agent-workspace). OpenClaw bootstraps each session from named files in its workspace root: `AGENTS.md` (operating instructions), `SOUL.md` (persona and boundaries), `USER.md` (who the user is), `MEMORY.md` + `memory/YYYY-MM-DD.md` (two-tier memory), `TOOLS.md` (local tool conventions).

The repo already provides the heavy pieces:

| OpenClaw file | This repo |
|---------------|-----------|
| `AGENTS.md` | [`/AGENTS.md`](../../AGENTS.md) — used as-is |
| `MEMORY.md` + `memory/` | [`/memory/`](../../memory/) — same two-tier convention OpenClaw uses (curated index + dated dailies, today+yesterday loaded) |
| `SOUL.md` | stub here — copy to workspace root and fill |
| `USER.md` | stub here — copy to workspace root and fill |
| `TOOLS.md` | stub here — copy to workspace root and fill |
| Skills | [`/skills/`](../../skills/README.md) — SKILL.md format is cross-tool; symlink or copy into the workspace `skills/` |

## Setup

Two options:

1. **Repo as workspace:** point OpenClaw's workspace at a clone of this repo, copy the three stubs from this folder to the repo root, and gitignore them if they hold personal detail you don't want in company history. `MEMORY.md` lives at `memory/MEMORY.md` here — symlink it to the root (`ln -s memory/MEMORY.md MEMORY.md`) so OpenClaw finds it.
2. **Separate workspace, repo mounted:** keep OpenClaw's default workspace and clone this repo inside it; `AGENTS.md` at the repo root governs work within the repo.

## Safety (OpenClaw's own rules, kept)

- The workspace must be a **private** repo.
- Never commit API keys, OAuth material, or anything under `~/.openclaw/`.
- Treat third-party skills as untrusted code — see [`/skills/README.md`](../../skills/README.md) § Security.
