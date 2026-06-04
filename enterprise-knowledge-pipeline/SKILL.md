---
name: enterprise-knowledge-pipeline
description: Use when building, maintaining, or refactoring an enterprise knowledge-base pipeline with source discovery, evidence tracking, change routing, review queues, publication, stable export, canonical state, or unattended automation.
---

# Enterprise Knowledge Pipeline

## Use This Skill For

- Designing or refactoring the seven-node knowledge pipeline.
- Deciding whether work is Build Phase or Maintenance Phase.
- Turning source changes into Evidence Cards, ChangeSets, Review Desk items, Publish Commit candidates, or Stable Export.
- Auditing automation boundaries and canonical state.
- Consolidating scattered scripts into one pipeline entrypoint.

## Operating Contract

Always enforce:

```text
Discover -> Evidence Card -> ChangeSet -> Gate Router -> Review Desk -> Publish Commit -> Stable Export
```

Hard maturity limit:

```text
Unattended automation may run to Review Desk.
Do not call the system a complete enterprise pipeline until unified entrypoint,
canonical state, Publish Commit, Stable Export, and acceptance checks are closed.
```

## Phase Rule

Use **Build Phase** when core pages, rules, evidence baseline, canonical state, automation, or callability are not stable.

Use **Maintenance Phase** only after all transition gates pass:

- Formal page stability.
- Architecture lock.
- Evidence baseline.
- Automation reliability.
- Callability acceptance.

If unsure, stay in Build Phase.

## Node Duties

| Node | Duty | Must Not Do |
| --- | --- | --- |
| Discover | Find new/changed sources. | Create formal conclusions. |
| Evidence Card | Preserve proof and permission estimate. | Become a long narrative summary. |
| ChangeSet | Describe change and impact. | Act as formal fact. |
| Gate Router | Route to archive/review/gap/publish/policy. | Replace owner judgment. |
| Review Desk | Ask humans for minimal decisions. | Handle low-risk metadata work. |
| Publish Commit | Write page changes and responsibility records. | Mark stable silently. |
| Stable Export | Expose callable stable context. | Export unreviewed or confidential data. |

## State Rules

Read/write process state through `state/` once available. Before `state/` is complete, treat local JSON summaries as transitional state sources only.

Required state targets:

```text
pipeline_runs.jsonl
source_registry.json
evidence_cards.jsonl
changesets.jsonl
gate_decisions.jsonl
review_queue.json
review_submissions.jsonl
publish_queue.json
page_status.json
version_registry.json
permission_registry.json
evidence_gap_register.json
stable_export.json
```

## Unified Entrypoint

If asked to make the system more commercial, converge scripts behind:

```text
tools/run_knowledge_pipeline.py
```

Do not rewrite existing node scripts first. Wrap them, lock runs, write state, then refactor.

Minimum sequence:

```text
lock -> config -> Discover -> Evidence Card -> ChangeSet -> Gate Router
-> Review Desk -> Publish Commit candidates -> Stable Export checks
-> pipeline_runs.jsonl -> dashboard summary
```

## When Not To Add External Orchestration

Do not add Airflow, Prefect, Dagster, n8n, or similar services unless the project needs cross-machine execution, SLA, visual DAGs, task-level audit, large parallel scheduling, or operation outside the local desktop environment.

## References

- Read `references/pipeline-contract.md` for the full phase, node, automation, and state contract.
- Read `references/state-contract.md` when creating or editing `state/` files or schemas.
