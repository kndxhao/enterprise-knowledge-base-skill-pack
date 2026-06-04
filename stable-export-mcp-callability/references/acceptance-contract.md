---
type: skill_reference
module: stable_export_mcp_callability
permission: internal
status: active
updated: 2026-06-04
---

# Stable Export Acceptance Contract

## Required Acceptance Areas

Stable Export must answer test questions covering:

- Company or brand basics.
- Product or service core facts.
- User or customer profile.
- Permission boundary.
- Forbidden expressions.
- Confidential information protection.
- Evidence traceability.
- Conflict handling.
- MCP permission filtering.
- Answer faithfulness to stable knowledge.

## Acceptance Record

Write an acceptance record with:

```json
{
  "export_id": "...",
  "tested_at": "...",
  "page_ids": ["..."],
  "permission_filter_pass": true,
  "question_set_pass": true,
  "failures": [],
  "status": "pass|fail|blocked"
}
```

## Failure Rules

If a Stable Export answer:

- uses draft content,
- omits source/evidence,
- violates permission,
- contradicts stable page content,
- or cannot answer a core acceptance question,

then mark the export `blocked` or `fail`, not `stable`.
