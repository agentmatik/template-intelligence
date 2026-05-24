# Customers

One file per named customer or active prospect. Use `templates/customer.md`.

## Rules

- One file = one customer
- Compiled-truth above `---` (mutable), dated timeline below (append-only)
- Active customers and prospects only — churned go to `customers/archive/` or just mark `status: archived`
- For sensitive accounts (NDA, enterprise procurement): mark `audience: internal`
- Don't mirror Linear tickets here — those live in Linear, referenced via MCP

## What goes in the compiled-truth block

- What they do (one sentence)
- Relationship (customer/prospect/churned + since-date)
- Primary champion + role + email
- Plan + pricing + renewal date
- Health signal (Green/Yellow/Red)
- Unmet needs (1–3 bullets)
- Risk signals
