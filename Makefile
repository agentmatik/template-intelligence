# One command = the same checks CI runs. Agents: run `make verify` before
# opening any PR (AGENTS.md / CONTRIBUTING.md).

.PHONY: verify frontmatter links secrets stale

verify: frontmatter links secrets
	@echo "✅ verify passed (frontmatter, links, secrets). Staleness is advisory: make stale"

frontmatter:
	@bash scripts/validate-frontmatter.sh

links:
	@bash scripts/check-links.sh

secrets:
	@if command -v gitleaks >/dev/null 2>&1; then \
		gitleaks detect --source . --redact --no-banner; \
	else \
		echo "⚠️  gitleaks not installed (brew install gitleaks) — secrets check skipped locally; CI still runs it"; \
	fi

stale:
	@bash scripts/check-stale.sh
