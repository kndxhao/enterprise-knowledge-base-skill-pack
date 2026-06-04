---
type: skill_reference
module: commercial_knowledge_delivery_audit
permission: internal
status: active
updated: 2026-06-04
---

# Commercial Acceptance

## Required Evidence

For commercial-ready status, collect:

- Architecture summary.
- Agent rules.
- Source registry or transitional source map.
- Evidence Card baseline.
- Review queue summary.
- Review submission records.
- Publish Commit / merge records.
- Page status and version registry.
- Permission registry.
- Evidence gap register.
- Stable Export acceptance report.
- Project dashboard.
- Review Desk page.
- Automation health report.
- Migration package inventory.

## Minimum Tests

- HTML surfaces render and contain the current seven-node flow.
- Review submission updates backend state or records failure visibly.
- Low-risk changes are not sent to review.
- High-risk changes are sent to review.
- Approved changes do not silently mark stable.
- Ordinary agent context excludes raw, draft, unreviewed changes, and confidential material.
- Stable Export passes question set and permission filtering.

## Commercial Blockers

- Missing owner model.
- Missing permission model.
- No evidence baseline.
- No merge/version records.
- No dashboard/review state synchronization.
- No automation failure handling.
- No MCP permission boundary.
- No migration inventory.
