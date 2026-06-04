---
name: stable-export-mcp-callability
description: Use when exposing a knowledge base to MCP, agents, AI answer generation, permission-filtered search, stable context packs, evidence lookup, version lookup, or callability acceptance tests.
---

# Stable Export MCP Callability

## Use This Skill For

- Designing MCP Resources, Tools, or Prompts for a knowledge base.
- Deciding what agents may read.
- Creating Stable Export context packs.
- Checking whether a page is callable.
- Building acceptance questions or RAG-style quality checks.

## Callability Rule

Only Stable Export is default callable.

Ordinary agents may read:

```text
Stable Export
Evidence lookup
Version lookup
Permission-filtered search
```

Ordinary agents must not read:

```text
Raw
Draft
Unreviewed ChangeSet
Full Review Desk
Confidential material
Unpublished pages
```

## MCP Surface

Recommended resources:

```text
company://stable/context
company://stable/page/{page_id}
company://evidence/{evidence_id}
company://version/{page_id}
company://permissions
```

Recommended tools:

```text
search_stable_knowledge
get_evidence_for_claim
get_page_version
check_permission_risk
submit_review_decision
```

## Roles

```text
Ordinary agent reads stable.
Review agent reads review.
Maintenance agent creates ChangeSet.
High-permission agent can publish.
```

## Acceptance

Stable Export must not be accepted only because files exist. It must pass test questions and permission filtering.

Evaluate:

```text
faithfulness
context precision
context recall
answer correctness
permission safety
```

## References

- Read `references/mcp-contract.md` before defining MCP surfaces.
- Read `references/acceptance-contract.md` before declaring Stable Export complete.
