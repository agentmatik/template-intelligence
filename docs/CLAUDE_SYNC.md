# Syncing this repo into Claude (project knowledge)

How to select files when adding this intelligence repo as project knowledge in
Claude (claude.ai → "Add content from GitHub") to get the **best company context**.

## The principle

This repo is **compiled truth + raw sources**. The root knowledge files and entity
folders already distill every meeting and document into current facts. The raw
transcripts in `meetings/`, any auto-imported extracts, and any chart images are
*sources* — their content is already captured in the compiled pages.

> The calls are **not** summarised file-by-file in place — but their substance
> already lives in the compiled pages. The compiled pages *are* the summary of
> every call.

Two costs, not one:
1. **Capacity** — raw transcripts and images are large and can blow past the limit.
2. **Signal** — even with headroom, low-value files dilute what the AI retrieves.
   **Text = high signal per token; chart images = low.**

## The three tiers

### ✅ Always sync — the compiled brain (small, pure signal)
- Root knowledge: `company.md` · `strategy.md` · `product.md` · `brand.md` · `ops.md` · `finance.md`
- Entity folders: `customers/` · `competitors/` · `people/` · `sales/`
- `decisions/` — the **curated** decision records (one per file)
- `weekly/` — weekly summaries (already condensed)
- `INDEX.md` · `README.md`

This selection alone is complete company context.

### 🔶 Optional — only if you have capacity headroom
Cheap (all text), adds detail, but lower-signal than the compiled pages:
- `decisions/imported/` *(if present)* — granular auto-imported extracts; noisier
  than the curated decision records.
- The **last 2–4 weeks** of the most strategic `meetings/` (leadership / product /
  model) — recent raw detail that may not be fully compiled yet.

### ❌ Don't sync
- `meetings/` bulk — **especially routine standups**. Once populated this is the
  single biggest capacity hog, and its content is already compiled.
- any `figures/` / chart images (`*.png`) — disproportionate capacity for little
  LLM value; conclusions belong in (and should live in) the text pages.
- `.github/` · `scripts/` · `skills/` · `templates/` — CI/config, helper scripts,
  agent capabilities, and doc shapes — not company context.

## Notes

- Claude's GitHub picker is **manual** (it does not read an ignore file), so this
  is a recommended selection you re-apply on each sync, not enforced config.
- Re-sync after a meaningful batch of merges so the compiled pages stay current.
