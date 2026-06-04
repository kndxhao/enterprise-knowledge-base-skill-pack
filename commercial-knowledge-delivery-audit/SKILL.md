---
name: commercial-knowledge-delivery-audit
description: Use when judging whether an enterprise knowledge-base project is ready for commercial delivery, client handoff, production operation, migration, MCP exposure, or ongoing unattended maintenance.
---

# Commercial Knowledge Delivery Audit

## Use This Skill For

- Commercial readiness reviews.
- Client handoff checks.
- Deciding whether the project can enter Maintenance Phase.
- Finding missing modules before delivery.
- Auditing HTML surfaces, state, automation, permissions, MCP callability, and documentation.

## Commercial Standard

A deliverable knowledge project needs:

```text
Architecture
Evidence
State
Review
Publication
Stable Export
Automation
Permissions
MCP / agent boundary
Acceptance tests
Migration package
```

## Audit Checklist

| Area | Pass Condition |
| --- | --- |
| Architecture | Seven-node flow documented and followed. |
| Phase | Build/Maintenance status is explicit. |
| Evidence | Core facts have Evidence Cards. |
| State | `state/` or transitional state sources are explicit. |
| Review Desk | Only risk-bearing items enter review. |
| Dashboard | Shows phase, gates, blockers, automation health. |
| Publish Commit | Merge/version records exist for published changes. |
| Stable Export | Has acceptance questions and permission filtering. |
| Automation | Can run unattended to Review Desk without state drift. |
| Permissions | Public/internal/confidential rules are enforced. |
| MCP | Ordinary agents only get Stable Export. |
| Migration | Files needed for knowledge, state, evidence, scripts, and MCP are identified. |

## Red Flags

- Review queue is empty but phase gates are not checked.
- HTML stores decisions without backend state refresh.
- Draft or ChangeSet is used as stable context.
- Public source is treated as automatically public output.
- Formal pages are marked stable without release review.
- Automation claims publication when it only generated candidates.
- No acceptance question set exists.
- No canonical or transitional state source is identified.
- External orchestration is added before local pipeline convergence.

## Delivery Levels

| Level | Meaning |
| --- | --- |
| Prototype | Pages and scripts exist; governance incomplete. |
| Build-ready | Architecture and review rules are set; core pages still stabilizing. |
| Maintenance-ready | Transition gates pass; short-path maintenance can run. |
| Commercial-ready | State, automation, review, publish, Stable Export, MCP boundary, and migration package are tested. |

## References

- Read `references/commercial-acceptance.md` for delivery evidence requirements.
- Read `references/migration-package.md` before handoff or migration.
