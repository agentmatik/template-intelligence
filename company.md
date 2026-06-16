---
type: company
title: "{{COMPANY_NAME}}"
status: draft
owner: "{{FOUNDER_NAME}}"
created: 2026-04-22
updated: 2026-04-22
last_verified: 2026-04-22
source_of_truth: manual
tags: []
audience: internal
---

<!-- ============================================================
GENERATION GUIDE (delete this block once filled)

PURPOSE: The 30-second answer to "what is this company?" The first file
any human or agent reads to orient. Keep it tight: a reader should
understand the company in under a minute.

SOURCE FROM (in priority order):
  1. Most recent pitch deck (cover + problem + solution + traction slides)
  2. Website About / homepage hero
  3. Founder's own one-paragraph description
  4. Incorporation docs (legal entity, founding date — full entity/VAT/
     address/structure detail goes in legal.md, not here)

RULES:
  - status: draft when generated from raw data; a human promotes to verified.
  - last_verified: use the SOURCE document's date, not today, if generated.
  - Never invent stage, headcount, or dates. Use <unknown> if absent.
  - The "what we don't do" section matters as much as "what we do" — it
    defines the boundary. Always fill it; pull from positioning/strategy docs.
============================================================ -->

# {{COMPANY_NAME}}

<!-- One paragraph: what the company is, who it serves, where it sits, current
stage. Two sentences if you can. Source: pitch deck cover + problem slides.
Example: "Acme Labs builds IoT analytics for German manufacturing SMEs. Seed-stage,
12 people, selling to plant operations teams who need predictive maintenance
without a data-science hire." -->

## Stage and shape

<!-- Source each from: deck, Crunchbase, incorporation docs, founder. Use
<unknown> rather than guessing. -->

- **Founded:** YYYY
- **Stage:** pre-seed | seed | series A | bootstrapped | profitable
- **Team size:** N
- **HQ:** city, country
- **Legal entity:** name + jurisdiction
- **Primary revenue model:** subscription | services | marketplace | usage | …

## Core team

<!-- Founders + key leadership only. One line each. Full directory lives in people/.
Source: deck team slide, website team page, org chart. -->

- {{FOUNDER_NAME}} — role (e.g. CEO, founder)
- See [`people/`](./people/) for the full directory.

## What we do, in one sentence

<!-- The one-liner you'd put on a billboard. Source: the company's own tagline
or the clearest sentence in the deck. Should pass the "would a stranger get it?" test. -->

## What we don't do

<!-- Equally important — this is the negative space that defines the company.
Three bullets. Source: positioning docs, strategy doc "non-goals", or infer from
what the deck deliberately excludes. Example: "We don't serve enterprise (>1000
staff). We don't build custom integrations. We don't compete on price." -->

- ...
- ...
- ...

## Why now

<!-- The market / technology / regulatory shift that makes this company possible
or necessary now. The YC "why now" question. Source: deck "why now" slide,
market-timing arguments. One short paragraph. -->

---

<!-- APPEND-ONLY TIMELINE. Company-level events only: incorporation, fundraises,
major milestones, pivots, key hires at exec level. Reverse-chronological.
Never edit or delete past entries. -->

- 2026-04-22: Established the company intelligence repo.
