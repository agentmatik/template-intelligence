# Templates

Frontmatter-scaffolded starting points, one per file type. Copy → fill → save into the target folder. Never edit a template "to use it" — copy it out.

| Template | Produces | Target folder | Full contract |
|----------|----------|---------------|---------------|
| `customer.md` | A customer/prospect page | `customers/<slug>.md` | [`../customers/README.md`](../customers/README.md) |
| `competitor.md` | A competitor page | `competitors/<slug>.md` | [`../competitors/README.md`](../competitors/README.md) |
| `person.md` | A person page | `people/<slug>.md` | [`../people/README.md`](../people/README.md) |
| `decision.md` | An ADR | `decisions/YYYY-MM-DD-<slug>.md` | [`../decisions/README.md`](../decisions/README.md) |
| `meeting.md` | A distilled meeting note | `meetings/<category>/YYYY-MM-DD-<topic>.md` | [`../meetings/README.md`](../meetings/README.md) |
| `weekly.md` | The Friday brief | `weekly/YYYY-Www.md` | [`../weekly/README.md`](../weekly/README.md) |
| `process.md` | A core-process SOP | `operating-system/processes/<slug>.md` | [`../operating-system/processes/README.md`](../operating-system/processes/README.md) |
| `rock.md` | A table row (not a file) | `operating-system/rocks.md` | [`../operating-system/README.md`](../operating-system/README.md) |

Conventions:

- The **folder README is the authority**; the template is the convenience. If they ever disagree, fix the template to match the README in the same PR.
- Templates carry `status: draft` and placeholder dates on purpose — filling in real values is part of using them.
- New file type? Add the folder README contract first, then the template, then a row here.
