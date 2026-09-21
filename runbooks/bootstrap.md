---
type: runbook
title: "Bootstrap: connect an agent harness to this brain"
status: verified
owner: "{{FOUNDER_NAME}}"
created: 2026-09-16
updated: 2026-09-21
last_verified: 2026-09-21
source_of_truth: manual
tags: [gbrain, skillpack]
audience: internal
---

# Bootstrap

Post-scaffold steps for a harness connecting to this company brain. gbrain
displays this; it does not execute it. Walk the steps with the user.

1. show user: "This repo is a company brain. It ships a gbrain skill (skills/company-brain) and expects the company-brain schema pack."
2. agent: read `AGENTS.md` (the operating contract) and, if present, `docs/CURATION.md` (what may be committed and what needs a pull request).
3. agent: install and activate the company-brain schema pack, following `skills/company-brain/SKILL.md`. Ask before switching the active pack: it changes typing for the whole brain.
4. agent: lint the brain with the pack's CLI, fix errors, then `gbrain sources add`, `gbrain sync`, and `gbrain extract links --source db --include-frontmatter`.
5. agent: verify with `gbrain schema stats --source <id>` and report typed coverage. 100% typed means the sync preserved the layout.
