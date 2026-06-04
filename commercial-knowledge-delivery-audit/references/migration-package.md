---
type: skill_reference
module: commercial_knowledge_delivery_audit
permission: internal
status: active
updated: 2026-06-04
---

# Migration Package

## Include

```text
vault/
pipeline/raw/
pipeline/evidence/
pipeline/changeset/
pipeline/review/
pipeline/publish/
pipeline/stable/
state/
schemas/
tools/
html/
mcp_server/
docs/
agent.md
manifest.json
```

## Do Not Migrate Only Markdown

Markdown alone loses:

- process state,
- evidence chain,
- review decisions,
- permissions,
- merge responsibility,
- version history,
- automation scripts,
- MCP contracts,
- acceptance tests.

## Handoff Checklist

- Confirm file paths do not rely on one local absolute path.
- Confirm permissions can be enforced after migration.
- Confirm Stable Export can be regenerated.
- Confirm review queue can be reconstructed.
- Confirm evidence lookup works.
- Confirm all external connectors are documented as read-only or writable.
