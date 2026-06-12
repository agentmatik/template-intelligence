# Templates

**What this folder is:** blank file skeletons for *this repo's own file types* — the correct frontmatter block plus the section structure, so every new customer page, decision, or meeting note starts with the right shape instead of being improvised. Copy → fill → save into the target folder. Never edit a template "to use it" — copy it out.

**What this folder is NOT:** business-document templates (pitch decks, board-update formats, offer letters). The business best practice — YC-style strategy discipline, EOS-style goal setting — isn't stored here as fill-in forms; it's encoded as **generation guides** inside the files themselves (the `<!-- GENERATION GUIDE -->` comment blocks in `strategy.md`, `management/vision.md`, etc.) and as the per-folder README contracts. The know-how lives where the content lives; this folder only supplies the skeletons.

| Template | Produces | Target folder | Full contract |
|----------|----------|---------------|---------------|
| `customer.md` | A customer/prospect page | `customers/<slug>.md` | [`../customers/README.md`](../customers/README.md) |
| `competitor.md` | A competitor page | `competitors/<slug>.md` | [`../competitors/README.md`](../competitors/README.md) |
| `person.md` | A person page | `people/<slug>.md` | [`../people/README.md`](../people/README.md) |
| `decision.md` | An ADR | `decisions/YYYY-MM-DD-<slug>.md` | [`../decisions/README.md`](../decisions/README.md) |
| `meeting.md` | A distilled meeting note | `meetings/<category>/YYYY-MM-DD-<topic>.md` | [`../meetings/README.md`](../meetings/README.md) |
| `weekly.md` | The Friday brief | `weekly/YYYY-Www.md` | [`../weekly/README.md`](../weekly/README.md) |
| `process.md` | A core-process SOP | `management/processes/<slug>.md` | [`../management/processes/README.md`](../management/processes/README.md) |
| `goal.md` | A table row (not a file) | `management/goals.md` | [`../management/README.md`](../management/README.md) |

Conventions:

- The **folder README is the authority**; the template is the convenience. If they ever disagree, fix the template to match the README in the same PR.
- Templates carry `status: draft` and placeholder dates on purpose — filling in real values is part of using them.
- New file type? Add the folder README contract first, then the template, then a row here.
