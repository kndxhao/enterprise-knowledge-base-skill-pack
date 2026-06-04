---
type: skill_reference
module: knowledge_review_governance
permission: internal
status: active
updated: 2026-06-04
---

# Review Desk Contract

## Purpose

The Review Desk is the smallest possible human judgment interface.

It handles:

```text
facts that may be wrong
permissions that may be unsafe
evidence that may be insufficient
changes that may affect formal pages
rules that may affect the system
```

## Required UI Behavior

- Make knowledge review and policy/architecture review visibly different.
- Pre-fill recommended permission and decision when safe.
- Keep notes always visible.
- Provide a button to adopt recommended action into notes.
- Submit to backend state; do not rely on browser-only storage.
- After submit, refresh review queue and dashboard summaries.

## Prohibited UI Behavior

- Do not include low-risk metadata chores.
- Do not ask humans to approve every source.
- Do not show old approved items as pending.
- Do not let HTML be the source of truth.
- Do not directly merge or mark stable from Review Desk.

## Decision Mapping

| UI Decision | Backend Meaning |
| --- | --- |
| approved | may generate Publish Commit candidate |
| evidence_required | write Evidence Gap |
| rejected | record rejection and remove from candidate path |
| do_not_ingest | record exclusion; do not write knowledge |

## Permission Mapping

| UI Permission | Meaning |
| --- | --- |
| public | safe for external or consumer-facing output after stable export |
| internal | internal operating knowledge only |
| confidential | restricted; not default-callable by ordinary agents |
