---
name: company-brain
description: Work with this company brain through gbrain: install the company-brain schema pack so page types and relationships survive the sync, then read and update the brain under its curation tiers.
mutating: true
triggers:
  - connect this brain to gbrain
  - how do I work with this company brain
  - what page types does this brain use
  - update this brain from a meeting
  - who owns this account in this brain
---

# company-brain

This repo is a company brain: one Markdown file per customer, competitor,
supplier, distributor, person, decision, meeting and weekly brief, plus the
canonical root pages (`company.md`, `strategy.md`, `product.md`, `brand.md`,
`ops.md`, `finance.md`). `AGENTS.md` is the operating contract; read it first.

## Before you sync this brain into gbrain

gbrain's default pack (`gbrain-base-v2`) declares 15 page types and retypes
everything else to `note`, folding `product` into `company`. That silently
flattens `customer`, `decision`, `strategy`, `weekly` and the rest of this
layout, and the relationships between them collapse to generic `mentions`.

Install the **company-brain schema pack** first:
<https://github.com/mattzimak/gbrain-company-brain>

```bash
git clone https://github.com/mattzimak/gbrain-company-brain /tmp/company-brain
bun /tmp/company-brain/src/cli.ts lint .          # fix errors before syncing
mkdir -p ~/.gbrain/schema-packs/company-brain
cp /tmp/company-brain/schema/company-brain.yaml ~/.gbrain/schema-packs/company-brain/pack.yaml
gbrain schema validate company-brain
gbrain schema use company-brain                   # ask the user first: this changes typing brain-wide
gbrain sources add <company-slug> --path .
gbrain sync --source <company-slug>
gbrain extract links --source db --include-frontmatter --source-id <company-slug>
gbrain schema stats --source <company-slug>       # expect 100% typed
```

`--include-frontmatter` is required, or `owner:`, `supersedes:` and
`attendees:` never become edges.

## Reading this brain

With the pack active, these questions are answerable from typed edges rather
than from prose:

| Question | How |
|---|---|
| Who owns this account? | `gbrain graph customers/<slug> --depth 1`, read `owned_by` |
| Who is our champion there? | same graph, read `champion` |
| Why did we decide X? | the decision page plus its `decided_in` edge to the meeting |
| Is this decision still current? | a newer decision with `supersedes -> <slug>`, and the page's `status` |

Cite every page you use as `[[slug]]`. Pages with `status: superseded` or
`archived` are history, not current truth.

## Writing to this brain

`AGENTS.md` and `docs/CURATION.md` govern writes. The short version:

- Timeline appends below the `---` on entity pages, new `status: draft` stubs,
  meetings and weekly notes: commit them, always with a citation.
- `strategy.md`, `company.md`, `brand.md`, `product.md`, new decisions,
  finance, ops, any `audience` change, and edits to `status: verified` pages:
  branch plus a pull request for a human.
- Never invent numbers, dates or names. Timelines are append-only. Decisions
  are immutable once merged. Only a human sets `status: verified`.

After writing, re-run the sync and extract commands above so gbrain matches
the repo.
