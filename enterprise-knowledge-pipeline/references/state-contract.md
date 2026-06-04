---
type: skill_reference
module: enterprise_knowledge_pipeline
permission: internal
status: active
updated: 2026-06-04
---

# Canonical State Contract

## Rule

`state/` is the process-state authority.

```text
HTML only reads/submits.
Markdown only explains.
Obsidian only stores knowledge.
state/ owns process state.
```

## Required Files

```text
state/
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

## Minimal Record Shapes

Pipeline run:

```json
{"run_id":"...","started_at":"...","ended_at":"...","phase":"build","status":"pass|attention|fail","nodes":{"discover":"pass"}}
```

Evidence Card:

```json
{"evidence_id":"...","source_id":"...","captured_at":"...","permission":"public|internal|confidential","summary":"...","raw_ref":"..."}
```

ChangeSet:

```json
{"changeset_id":"...","evidence_ids":["..."],"change_type":"add|modify|remove|conflict","affected_pages":["..."],"risk_flags":[]}
```

Review queue item:

```json
{"review_id":"...","changeset_id":"...","owner":"...","reason":"conflict|permission|evidence_gap|page_impact|policy","status":"pending|approved|evidence_required|rejected"}
```

Publish queue item:

```json
{"publish_id":"...","review_ids":["..."],"target_pages":["..."],"status":"candidate|published|blocked","requires_page_release":false}
```

Stable export:

```json
{"export_id":"...","page_id":"...","version":"...","permission":"public|internal|confidential","acceptance_status":"pass|fail|blocked"}
```
