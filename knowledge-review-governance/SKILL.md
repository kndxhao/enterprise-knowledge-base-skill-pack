---
name: knowledge-review-governance
description: Use when designing, auditing, or modifying review desks, approval queues, project dashboards, formal page release checks, permission decisions, merge records, or human review workflows for an enterprise knowledge base.
---

# Knowledge Review Governance

## Use This Skill For

- Review Desk or approval queue design.
- Project dashboard design or cleanup.
- Deciding what must enter human review.
- Formal page release review.
- Permission, owner, evidence-gap, or conflict handling.
- Preventing duplicate review and state drift.

## Review Desk Contract

Review Desk is not a data cleaning surface and not a project dashboard.

Only Review Desk items:

- Conflict with stable knowledge.
- Permission uncertainty or combination risk.
- Evidence gap needing owner judgment.
- Formal page conclusion, permission, structure, scope, or callability impact.
- Policy, workflow, permission model, knowledge structure, or MCP boundary change.

Do not show:

- Low-risk source changes.
- Metadata fixes.
- Link repairs.
- Index updates.
- Minor wording cleanup for already approved knowledge.

Human inputs should be limited to:

```text
Decision: approved / evidence_required / rejected / do_not_ingest
Permission: public / internal / confidential
Note
```

## Dashboard Contract

Project dashboard shows status. It must not approve, publish, read external systems, or become canonical state.

Show:

- Current phase.
- Transition gates.
- Blockers.
- Source pool.
- Automation health.
- Review queue status.
- Formal page stability.
- Safety boundaries.

If Review Desk count is zero, do not infer Maintenance Phase. Use transition gates.

## Formal Page Release

Trigger formal page release review only when page conclusion, permission boundary, structure, scope, callability risk, core fact, or important evidence changes.

Check:

```text
page completeness
source coverage
permission boundary
conflict status
impact scope
merge record
version record
callability risk
```

Do not re-review every approved knowledge item during page release.

## Anti-Redundancy

- Knowledge item review decides whether facts are usable.
- Page release review decides whether pages are publishable.
- `state/` owns process state.
- HTML, Markdown, Obsidian, and dashboards only display or explain state.

## References

- Read `references/review-desk-contract.md` before editing review HTML, queues, or review state.
- Read `references/page-release-contract.md` before promoting pages or marking anything stable.
