---
type: skill_reference
module: enterprise_knowledge_pipeline
permission: internal
status: active
updated: 2026-06-04
---

# Pipeline Contract

## Core Principle

Build Phase reviews pages, rules, and core facts. Maintenance Phase reviews changes, conflicts, and permission risk.

## Seven Nodes

```text
Discover
-> Evidence Card
-> ChangeSet
-> Gate Router
-> Review Desk
-> Publish Commit
-> Stable Export
```

## Build Phase

Use Build Phase when:

- Core formal pages are not stable.
- Permission rules or owner model are still changing.
- Evidence baseline is incomplete.
- Review Desk, dashboard, and state may drift.
- Automation has not run stably.
- Stable Export has not passed acceptance questions.

Build Phase requires more human review. Do not optimize away page release or rule confirmation.

## Maintenance Phase

Use Maintenance Phase only after:

- Formal page stability gate passes.
- Architecture lock gate passes.
- Evidence baseline gate passes.
- Automation reliability gate passes.
- Callability acceptance gate passes.

Maintenance Phase short path:

| Change | Route |
| --- | --- |
| Low-risk source change | Evidence Card -> auto archive |
| Metadata/link/index fix | ChangeSet -> Gate Router -> Publish Commit |
| Low-risk factual supplement | ChangeSet -> Gate Router -> Publish Commit candidate |
| Conflict | ChangeSet -> Review Desk |
| Permission uncertainty | ChangeSet -> Review Desk |
| Evidence missing | ChangeSet -> Evidence Gap |
| Formal page impact | ChangeSet -> Review Desk -> Publish Commit -> Stable Export Check |
| Policy / permission model / structure change | Architecture or Policy Review |

## Automation Boundary

Allowed unattended:

- Discover.
- Evidence Card candidate.
- ChangeSet candidate.
- Gate Router.
- Review Desk refresh.
- Applying submitted review state.
- Publish Commit candidate.

Forbidden unattended:

- Publishing confidential content.
- Changing policy rules.
- Changing permission model.
- Writing unreviewed content into formal pages.
- Marking pages stable.
- Exposing Draft or ChangeSet to ordinary agents.

## External Orchestration

Use local scheduled tasks, local scripts, and local service management first.

Evaluate external orchestration only for:

- Cross-machine execution.
- SLA and retry requirements.
- Visual DAG and dependency observability.
- Multi-person operations.
- Task-level audit.
- Large-scale parallel source scheduling.
