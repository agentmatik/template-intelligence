# Agent compatibility

Adapters for agent runtimes that need more than the universal `AGENTS.md` + `CLAUDE.md` pair at the repo root.

| Runtime | Status | Where |
|---------|--------|-------|
| Claude Code | Native — `CLAUDE.md` imports `@AGENTS.md`; skills in `skills/` (symlinked into `.claude/skills/`) | repo root |
| Cursor, Codex, Gemini, Windsurf, Aider | Native — read `AGENTS.md` directly | repo root |
| OpenClaw | Adapter — workspace bootstrap files (SOUL/USER/TOOLS stubs + mapping) | [`openclaw/`](./openclaw/README.md) |

Rule: `AGENTS.md` stays canonical and tool-agnostic. Anything runtime-specific lives in a shim (`CLAUDE.md`) or an adapter folder here — never as forks of the contract itself.
