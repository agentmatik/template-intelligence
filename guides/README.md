# Guides

The owner's manuals: why the repo is shaped this way, how to stand it up, and how to run it. Company *knowledge* never lives here — only documentation *about the system itself*.

## Read in this order

| Doc | Answers | Read when |
|-----|---------|-----------|
| [`ARCHITECTURE.md`](./ARCHITECTURE.md) | Why this structure — the three-layer model, twelve principles, evolution path | You want the rationale, or you're tempted to add a vector DB |
| [`SETUP.md`](./SETUP.md) | Empty clone → working intelligence in ≤30 min (two paths: agent-built or self-seeded) | Day one |
| [`DATA-ORGANIZATION-PLAYBOOK.md`](./DATA-ORGANIZATION-PLAYBOOK.md) | What goes where and why — the routing table + root-file generation contracts | You (or an agent) are sorting raw company data into the repo |
| [`AGENT-INSTRUCTIONS.md`](./AGENT-INSTRUCTIONS.md) | The eleven-phase migration procedure with human checkpoints | An agent is building the repo from existing material |
| [`OPERATIONS.md`](./OPERATIONS.md) | The rituals that keep it alive — daily/weekly/monthly/quarterly, PR standards, the 20-question eval, failure playbook | After setup, forever |
| [`CLIENT-ONBOARDING.md`](./CLIENT-ONBOARDING.md) | The consultancy/agency playbook — kickoff workshop, ingestion week, handoff | You're applying this template to a client |
| [`TEMPLATE-CHANGELOG.md`](./TEMPLATE-CHANGELOG.md) | What changed in the template itself, by version | You forked an older version and want to pull improvements |
| [`HUMAN-JOB.md`](./HUMAN-JOB.md) | The human's entire role, zero assumed tech background — incl. click-by-click PR review | You're the founder/operator (start here) |
| [`TEAM-ACCESS.md`](./TEAM-ACCESS.md) | How the whole team reads/edits without GitHub — three tiers, Slack-agent wiring, why never to two-way sync | You're rolling it out to the team |
| [`FAQ-AND-FAILURE-MODES.md`](./FAQ-AND-FAILURE-MODES.md) | Judgment calls, CI failures, anti-patterns | Something feels wrong or broke |

The split that matters: the **playbook** is *what goes where*; **agent-instructions** is *how to run the migration project*; each folder's README is *the per-file spec*. Three layers, no overlap.
