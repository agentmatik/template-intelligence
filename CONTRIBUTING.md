# Contributing

How changes enter this repo - for humans and agents alike. This page is pointers; the linked contracts govern.

1. **Nobody writes canonical truth to `main`.** Branch → PR → human review → merge. Only meeting notes and memory worklogs auto-commit. ([`AGENTS.md`](./AGENTS.md) § Operating rules)
2. **One idea per PR**, semantic title (`customer(acme): update renewal after 2026-04-15 call`), the *why* in the body. Agent-authored commits carry a `Co-Authored-By: <agent>` trailer - provenance is part of the audit trail. The PR template carries the full checklist.
3. **Before opening a PR, run `bash scripts/validate-frontmatter.sh` and `bash scripts/pre-commit.sh`** - the same frontmatter and secrets checks CI runs (`.github/workflows/validate.yml` adds an offline link check). Red CI on a PR? The job name tells you which contract failed; see [`docs/OPERATIONS.md`](./docs/OPERATIONS.md).
4. **Follow the folder contract.** Every folder's `README.md` is the complete spec for files in it (frontmatter, structure, quality bar). On conflict, the folder README wins over general rules.
5. **Handbook-first.** Change the repo, then announce with a link - never the reverse.
6. **History is append-only.** Never rewrite a timeline entry or an ADR; correct with a new dated line or a superseding decision.
7. **Reviewing instead of writing?** The human's job - what to check, how to merge - is in [`docs/OPERATIONS.md`](./docs/OPERATIONS.md) under "How PRs should look".
