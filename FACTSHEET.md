# {{COMPANY_NAME}} - Fact Sheet (quick reference)

<!-- ============================================================
GENERATION GUIDE (delete this block once filled)

PURPOSE: The single dense "answer key". Every hard company fact and every
official link in one place, so a human or agent filling an application, form,
deck, or grant can answer "what's our X?" without hunting across files.

THIS IS A TEMPLATE. Every value below is a PLACEHOLDER or worked example.
Replace each with your company's real value, then delete this guide block.
Delete any row that doesn't apply (no DUNS? no second entity? remove the row).
Leave a field as <unknown> rather than guessing; a blank is safer than a lie.

SOURCE FROM (in priority order):
  1. Incorporation / registration docs (legal entity, numbers, address)
  2. The most recent pitch deck (team, traction, funding, market)
  3. Website footer + About page (links, contact, boilerplate)
  4. The founder confirming numbers you can't source

RULES:
  - This file is a DERIVATIVE index: each section links to its canonical page
    ([[company]], [[finance]], etc.) which holds the nuance and the sources.
    When a fact changes, change it on the canonical page first, then here.
  - Keep it dense. Tables, not prose. One screen per section.
  - No secrets. Public registration numbers (EIN, company number, DUNS) are
    fine; bank details, tax PINs, cap-table splits, and term-sheet terms are
    NOT. Those live in the encrypted store that finance.md points to.
  - No frontmatter (same as INDEX.md / README.md). This is a navigation aid,
    not a canonical knowledge page, so it's exempt from the frontmatter check.
============================================================ -->

> **This is the fact-sheet template. Fill each field below with your company's real values, and delete any row that doesn't apply.** Once filled, this becomes the single dense quick-reference (facts + official links in one place) for filling **applications, forms, decks, and grant questions**: "what's the app-store link?", "what's our company number?", "who are the founders?". Every value here is canonical; follow the linked page for nuance and sources. **If you need one company fact or link, look here first.** Keep it in sync with the linked pages when facts change.
>
> **How to use this file:** treat it as an index, not a second source of truth. Each section points to the page that owns the detail ([[company]], [[finance]], [[brand]], [[people]], [[product]], [[strategy]]). When a fact changes, update the canonical page first, then mirror the new value here. Review it whenever you fill an application or close a fundraise. Set the review date below.
>
> Last reviewed: YYYY-MM-DD.

## Identity

| Field | Value |
|-------|-------|
| Company name | **{{COMPANY_NAME}}** (legal entity: **{{LEGAL_ENTITY}}**) |
| One-liner | **"{{COMPANY_TAGLINE}}"** *(example: "Predictive maintenance for German manufacturing SMEs")* |
| What it is | One sentence: what the product is and its current stage. *(example: "Acme Labs builds IoT analytics for plant operations teams. Seed-stage, live with 12 paying customers.")* |
| Founded | **YYYY-MM-DD** (use the incorporation date as the official founding date) |
| Website | **https://{{COMPANY_DOMAIN}}** |

## Legal entity & registration  -> [[company]]

<!-- Public registration identifiers only. Delete the rows for any that don't
exist in your jurisdiction. Add jurisdiction-specific ones (VAT no., IČO,
Companies House no., Handelsregister no.) as needed. -->

| Field | Value |
|-------|-------|
| Legal entity | **{{LEGAL_ENTITY}}** *(example: Acme Labs Ltd.)* |
| Entity type | **[entity type + jurisdiction]** *(example: Delaware C-corporation)* |
| Company / file number | **[registration number]** *(or <unknown>)* |
| Tax ID (EIN / VAT / equivalent) | **[public tax id]** *(public id only, no bank/PIN data)* |
| DUNS | **[DUNS number]** *(delete row if not registered)* |
| Incorporated | **YYYY-MM-DD** |
| Registered & mailing address | **[street, city, region, postcode, country]** |
| Crunchbase | https://www.crunchbase.com/organization/{{COMPANY_SHORT}} *(delete if none)* |
| Other entity | **[name + jurisdiction + number]** *(only if a second/holding entity exists; delete otherwise)* |

## Location & contact  -> [[company]] · [[brand]]

| Field | Value |
|-------|-------|
| Operational HQ | **[city, country]** |
| Registered address | **[country]** (full address above) |
| General email | **hello@{{COMPANY_DOMAIN}}** |
| Phone | **[+CC number]** *(delete if none public)* |
| Applications filled by | **{{FOUNDER_NAME}}** ({{FOUNDER_EMAIL}}) |
| Program / form participants | **[names + roles]** *(who's named on grant/accelerator applications)* |

## Team  -> [[people]]

<!-- One line of context, then a row per founder. Ownership % is sensitive: a
rough split is usually shareable for applications, but exact cap-table detail
lives in the encrypted store (see finance.md), not here. Delete the column if
you'd rather not surface it. -->

[N] founders, [full-time / part-time]; team of [N]. Full directory: [[people]].

| Founder | Role | Email | LinkedIn | Ownership |
|---------|------|-------|----------|-----------|
| **{{FOUNDER_NAME}}** | [CEO] | {{FOUNDER_EMAIL}} | linkedin.com/in/[handle] | [~XX%] |
| **[Co-founder name]** | [CTO] | [email] | linkedin.com/in/[handle] | [~XX%] |

[N]% ESOP reserved. **Advisors:** [name, one-line credential] *(delete if none)*. Team photo: [link to source file].

## Official links & channels  -> [[brand]]

<!-- The canonical URL for every public channel. Delete rows for channels you
don't run; add ones you do (App Store, Play Store, Product Hunt, Substack…). -->

| Channel | URL |
|---------|-----|
| **Website** | https://{{COMPANY_DOMAIN}} (privacy: https://{{COMPANY_DOMAIN}}/privacy) |
| **Primary product / app** | **[store or app URL]** *(example: App Store / Play Store / web app link)* |
| **LinkedIn (company)** | https://www.linkedin.com/company/{{COMPANY_SHORT}}/ |
| **X / Twitter** | https://x.com/[handle] |
| **GitHub** | https://github.com/{{GITHUB_ORG}} *(delete if private/none)* |
| **YouTube** | https://www.youtube.com/@[handle] *(delete if none)* |
| **Discord / community** | [invite URL] *(delete if none)* |
| **Demo video** | [URL: the link to share for "a quick demo"] |

## Funding & finance  -> [[finance]]

<!-- Round headlines are shareable; exact terms are not. Pull figures from
finance.md (which itself points to the encrypted store). No raw cap-table or
bank data here. -->

| Field | Value |
|-------|-------|
| Stage | **[pre-seed / seed / Series A / bootstrapped / profitable]** |
| Raised to date | **[$ amount + source]** *(example: $500k pre-seed, or "bootstrapped")* |
| In-kind / credits | **[e.g. cloud credits, program perks]** *(delete if none)* |
| Monthly burn | **[≈ $ amount]** *(or <unknown>)* |
| Seeking | **[$ range, if raising]** *(delete if not raising)* |
| Revenue model | **[subscription / one-time / usage / services / marketplace]** |
| MRR / ARR | **[$ amount, or "not yet applicable"]** |

## Business model & pricing  -> [[finance]] · [[product]]

<!-- The headline pricing a form or deck would ask for. Detail + rationale live
in sales/pricing.md and product.md. -->

- **Pricing:** [tier names + prices] *(example: Free / Team $X per seat per mo / Enterprise custom)*.
- **What's monetized:** [the core paid unit] *(example: per-seat SaaS subscription)*.
- **Other:** [referral / affiliate / add-ons, if any] *(delete if none)*.

## Traction & metrics  -> [[finance]] · [[customers/README]]

<!-- The 2-4 numbers an application asks for. Use real figures from the deck /
dashboards, or <unknown>. Don't inflate. -->

- [Headline traction metric] *(example: ~6,000 sign-ups, ~50 paying teams)*.
- [Engagement / retention signal] *(example: 40% WAU/MAU; NRR 115%)*.
- [Validation signal] *(example: 10 design-partner interviews; 1 LOI)*. *(Delete rows that don't apply.)*

## Accolades  -> [[company]] · [[finance]]

<!-- Accelerators, grants, awards, notable programs. Delete the section if none
yet; blanks beat filler. -->

- [Accelerator / program]: [cohort, year, any notable terms].
- [Grant / award]: [amount, year].
- [Other recognition]: [detail].

## Product & tech  -> [[product]]

| Field | Value |
|-------|-------|
| Platforms | **[where it runs]** *(example: web, iOS, Android)* |
| Core capabilities | **[the 2-4 things it does]** |
| Technical baseline | **[stack / key facts]** *(example: Next.js + Postgres; SOC 2 in progress)* |
| AI scope | **[what AI does, precisely, and what it does NOT]** *(if AI is a small part, say so; don't overclaim)* |

## Market  -> [[finance]] · [[strategy]]

<!-- The TAM/SAM/SOM line a deck/application asks for. Cite the source on the
canonical page. -->

- **TAM** [market + $] -> **SAM** [segment + $] -> **SOM** [reachable + $] *(entry wedge)*. *(example: TAM $6.3B global X -> SAM $3.3B online X -> SOM ~$400M gamified X)*.

## Positioning / taglines  -> [[brand]]

<!-- The approved one-liners to paste into copy. Keep in sync with brand.md. -->

- "{{COMPANY_TAGLINE}}" · "[alt tagline]" · "[BD/elevator variant]".
- Competitive matrix: [[competitors/README]] ({{COMPANY_SHORT}} vs [main competitors]).
