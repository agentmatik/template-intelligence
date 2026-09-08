# inbox/extracted - staged facts from meeting transcripts

Machine-written staging area. After every processed meeting, the n8n Knowledge Extract tap commits one file here: `YYYY-MM-DD-<slug>.md` with `curated: false` and a list of structured facts (entity, fact, quote, sensitivity hint).

The **curator agent** (scheduled routine) folds uncurated files into the canonical entity pages and marks them `curated: true`. Files stay here afterwards as the audit trail - they are the provenance chain between a transcript and a canonical fact.

- File shape + the full auto-commit vs PR rules: [`../../docs/CURATION.md`](../../docs/CURATION.md)
- Humans normally never edit these files; fix wrong facts at the canonical page (new timeline entry), not here.
