---
type: skill_reference
module: knowledge_review_governance
permission: internal
status: active
updated: 2026-06-04
---

# Page Release Contract

## Rule

A stable page becomes default callable context. Treat page release as a publication decision, not a formatting task.

## Release Trigger

Run page release review when:

- Page conclusion changes.
- Permission boundary changes.
- Page structure changes.
- Scope changes.
- Callability risk changes.
- Core fact is replaced.
- Evidence is removed or invalidated.

## Release Checks

Each page needs:

- Owner.
- Permission.
- Source coverage.
- Merge record.
- Version record.
- Conflict status.
- Evidence gaps.
- Acceptance questions.

## Status Meaning

| Status | Meaning |
| --- | --- |
| draft | not formal knowledge |
| published | written to knowledge page with responsibility record |
| release_required | needs page-level release check |
| stable | passed release and acceptance; callable by default according to permission |
| deprecated | replaced or retired |

## Prohibited

- Do not mark stable from draft.
- Do not mark stable from review approval alone.
- Do not skip version and merge records.
- Do not expose confidential pages through ordinary Stable Export.
