# Skills

Cross-tool agent skills. Each subfolder = one skill with a `SKILL.md`.

## Suggested starter skills

Bootstrap these when workflows repeat (don't pre-create them):

- `normalize-meeting/` — Granola transcript → structured meeting note + entity PRs
- `weekly-brief/` — Friday weekly draft from week's material
- `customer-brief/` — One-page customer summary for sales/board/investor
- `update-wiki/` — Reconcile inbox → structured tree via PRs

## How skills work

```
skills/<skill-name>/
├── SKILL.md           # YAML frontmatter + markdown body
├── references/        # (Optional) supporting docs
└── examples/          # (Optional) example inputs/outputs
```

Claude Code auto-discovers skills via progressive disclosure: only the `description` field loads at session start; the body loads on invocation.

## Portability

Skills authored here are compatible with OpenClaw, Cursor, Codex plugins. Same SKILL.md ports unchanged unless it depends on client-specific hooks.

## Security

Treat third-party skills as **untrusted code**. Recent supply-chain attacks (ClawHavoc Feb 2026, ~341 malicious skills; Snyk found 283 credential-leaking) make this real, not theoretical. Rules:

- First-party by default
- Read every line of any third-party SKILL.md before installing
- Pin versions; don't auto-update skills touching production
- Run untrusted in sandbox (OpenClaw Docker mode if applicable)
