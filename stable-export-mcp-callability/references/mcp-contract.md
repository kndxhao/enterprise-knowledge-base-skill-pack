---
type: skill_reference
module: stable_export_mcp_callability
permission: internal
status: active
updated: 2026-06-04
---

# MCP Contract

## Default Access

Default MCP context must come from Stable Export. Never point ordinary agents at raw, drafts, unreviewed changesets, or full review queues.

## Resource Contract

Resources should be read-only and permission-filtered:

```text
company://stable/context
company://stable/page/{page_id}
company://evidence/{evidence_id}
company://version/{page_id}
company://permissions
company://schema/{schema_name}
```

Resource responses should include:

- `permission`
- `source_page`
- `evidence_ids`
- `version`
- `not_for_external_use` when applicable

## Tool Contract

Tools may act only within role boundaries:

| Tool | Default Access |
| --- | --- |
| search_stable_knowledge | ordinary |
| get_evidence_for_claim | ordinary if evidence permission allows |
| get_page_version | ordinary if page permission allows |
| check_permission_risk | ordinary |
| list_review_items | review or maintenance |
| submit_review_decision | review owner |
| create_publish_commit | maintenance |
| apply_publish_commit | high permission |

## Prompt Contract

Prompts must state permission boundary and citation requirements. They must refuse to use draft or unreviewed ChangeSet as stable facts.
