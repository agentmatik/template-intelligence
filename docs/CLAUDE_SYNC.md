# Syncing this repo into Claude (project knowledge)

How to select files when adding this intelligence repo as project knowledge in
Claude (claude.ai → "Add content from GitHub") so you get the **best company
context within the capacity limit**.

## The principle

This repo is **compiled truth + raw sources**. The root knowledge files and entity
folders already distill every meeting and document into current facts. The raw
transcripts in `meetings/` and any auto-imported extracts are *sources* — their
content is already captured in the compiled pages, so you do **not** need them for
context, and they are what blow past the capacity limit (raw transcripts and any
chart/image files are the biggest consumers).

> The calls are **not** summarised file-by-file in place — but their substance
> already lives in the compiled pages. **The compiled pages *are* the summary of
> every call.**

## Include (the company brain — small + high-signal)

- Root knowledge: `company.md` · `strategy.md` · `product.md` · `brand.md` · `ops.md` · `finance.md`
- Entity folders: `customers/` · `competitors/` · `people/` · `sales/`
- `decisions/` — the **curated** decision records (one per file)
- `weekly/` — weekly summaries (already condensed)
- `INDEX.md` · `README.md`

## Skip (raw sources, capacity hogs, machinery)

| Path | Why skip |
|------|----------|
| `meetings/` | Raw transcripts — content already compiled into the files above. Once populated this is the single biggest capacity hog. |
| `decisions/imported/` *(if present)* | Raw auto-imported extracts — superseded by the curated decision records. |
| any `figures/` / chart images (`*.png`) | Images consume disproportionate capacity for little LLM value. |
| `.github/` · `scripts/` · `skills/` · `templates/` | CI/config, helper scripts, agent capabilities, and doc shapes — not company context. |

## If you want recency from raw calls (optional)

Re-add only the **last 2–4 weeks** of the most strategic `meetings/` (leadership /
product / model), never the routine standups. Older transcripts are low-value,
high-cost — especially if auto-transcribed (ASR noise).

## Notes

- Claude's GitHub picker is **manual** (it does not read an ignore file), so this
  is a recommended selection you re-apply on each sync, not enforced config.
- Re-sync after a meaningful batch of merges so the compiled pages stay current.
