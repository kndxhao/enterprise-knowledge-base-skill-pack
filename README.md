---
type: skill_pack_readme
module: enterprise_knowledge_skills
permission: internal
status: active
updated: 2026-06-04
---

# Enterprise Knowledge Base Skill Pack

本目录是一套面向企业知识库项目的 Codex Skill Pack。它用于帮助团队快速启动、搭建、治理、维护和迁移一个可审计、可版本化、可被 Agent / MCP 调用的企业知识库系统。

这套 Skill Pack 不绑定特定品牌、行业或项目。它适用于消费品品牌公司，也可以扩展到其他需要长期沉淀组织知识、产品知识、品牌知识、运营知识和内部流程知识的企业。

## 1. 适用场景

适合使用这套 Skill Pack 的情况：

- 从 0 开始搭建企业知识库。
- 将已有文档、表格、会议纪要、营销资料、产品资料整理成稳定知识。
- 需要把 Obsidian、Markdown、HTML 审核台、自动化脚本和 MCP 调用边界组织成一套统一流程。
- 需要让知识库支持版本控制、审核、权限分级、证据追溯和后续增量维护。
- 需要商业化交付一套可迁移、可复用、可维护的知识库搭建方法。

不适合把它理解为：

- 单纯的 Obsidian 模板。
- 单纯的文档整理脚本。
- 单纯的 RAG 数据导入工具。
- 不需要审核和权限边界的个人笔记系统。

## 2. 包含的 Skills

| Skill | 作用 |
| --- | --- |
| `enterprise-knowledge-pipeline` | 搭建和维护七节点知识管线、canonical state、无人运行到审核台前的自动化。 |
| `knowledge-review-governance` | 设计审核台、项目看板、审批队列、正式页发布审核、权限判断和负责人流程。 |
| `stable-export-mcp-callability` | 定义 Stable Export、MCP 暴露边界、Agent 可调用规则、验收问题和权限过滤。 |
| `commercial-knowledge-delivery-audit` | 判断项目是否达到商业交付、迁移、维护期、生产运行和客户交接标准。 |

辅助脚本：

| 文件 | 作用 |
| --- | --- |
| `scripts/check_skill_pack.py` | 校验 Skill Pack 是否完整。 |
| `scripts/install_to_codex_mac.sh` | 将本 Skill Pack 一键安装到 Mac 的 Codex skills 目录。 |

## 3. 一键部署到 Mac Codex

### 3.1 前置条件

每台 Mac 需要具备：

- 已安装 Codex Desktop 或 Codex CLI。
- 可以访问本项目目录。
- 已安装 `python3`。
- Shell 环境支持 `bash`。

默认安装目标：

```bash
${CODEX_HOME:-$HOME/.codex}/skills
```

如果当前机器使用自定义 Codex 目录，可以先设置 `CODEX_HOME`：

```bash
export CODEX_HOME="/path/to/codex-home"
```

### 3.2 Dry Run

先进入项目根目录：

```bash
cd "/path/to/project"
```

执行 dry run：

```bash
bash ./scripts/install_to_codex_mac.sh --dry-run
```

预期效果：

```text
PASS 4 skills
Dry run only. Would install:
  .../enterprise-knowledge-pipeline -> .../.codex/skills/enterprise-knowledge-pipeline
  .../knowledge-review-governance -> .../.codex/skills/knowledge-review-governance
  .../stable-export-mcp-callability -> .../.codex/skills/stable-export-mcp-callability
  .../commercial-knowledge-delivery-audit -> .../.codex/skills/commercial-knowledge-delivery-audit
```

### 3.3 正式安装

确认 dry run 正常后执行：

```bash
bash ./scripts/install_to_codex_mac.sh
```

脚本会自动：

- 校验 4 个 skill 是否完整。
- 创建 Codex skills 目录。
- 备份目标目录中已有的同名 skill。
- 复制新的 skill 到 Codex 全局 skills 目录。
- 提示重启 Codex 或开启新会话。

安装完成后，重新打开 Codex 或新建会话，让 Codex 刷新 skill discovery。

### 3.4 多台 Mac 部署

这套脚本支持在所有 Mac 上重复执行。推荐流程：

1. 将本项目目录同步到目标 Mac。
2. 在每台 Mac 上运行 dry run。
3. 在每台 Mac 上运行正式安装。
4. 新开 Codex 会话验证 skill 已被识别。

如果企业有 MDM、SSH、内部脚本平台或软件分发工具，也可以将上述命令纳入统一分发流程。Skill Pack 本身不依赖 Airflow、n8n、Prefect、Dagster 等外部编排服务。

## 4. 部署后的初期效果

安装后，Codex 在相关任务中可以自动发现并调用这些 skills。初期效果包括：

- 能识别企业知识库项目的标准七节点流程。
- 能区分搭建期和维护期。
- 能避免把 HTML、Markdown、Obsidian、JSON 各自维护成多套状态。
- 能把审核台限制为只处理高风险或需要负责人判断的事项。
- 能明确 Stable Export 才是普通 Agent 默认可调用层。
- 能按商业交付标准检查项目是否具备迁移、维护和 MCP 暴露能力。

安装本 Skill Pack 不会自动生成完整知识库。它提供的是 Agent 工作规则、流程判断、治理边界和搭建方法。新项目仍需要执行初始化、资料接入、状态文件建设、审核台配置和 Stable Export 验收。

## 5. 新知识库项目启动动作

建议每个新项目按以下顺序启动。

### 5.1 建立项目根目录

推荐基础结构：

```text
project-root/
  agent.md
  skills/
  state/
  tools/
  vault/
  raw/
  review/
  exports/
  docs/
```

目录含义：

| 目录 | 作用 |
| --- | --- |
| `agent.md` | 项目级 Agent 规则，记录本项目必须遵守的流程、权限、阶段和边界。 |
| `skills/` | 项目本地 skill 源文件，可复制安装到 Codex 全局 skills。 |
| `state/` | canonical state，保存流程状态。 |
| `tools/` | 自动化脚本、同步脚本、审核台服务、导出脚本。 |
| `vault/` | Obsidian 或 Markdown 知识库正文。 |
| `raw/` | 原始资料、只读快照、来源证据。 |
| `review/` | 审核队列、审核提交、merge candidate。 |
| `exports/` | Stable Export、MCP context pack、迁移包。 |
| `docs/` | 项目说明、SOP、交付文档。 |

### 5.2 写入项目规则

在 `agent.md` 中至少写清楚：

- 项目定义。
- 七节点流程。
- 搭建期和维护期标准。
- 阶段切换闸门。
- 审核台规则。
- 权限分级。
- Stable Export 和 MCP 调用边界。
- 自动化可以做什么，不能做什么。

### 5.3 建立 canonical state

推荐最小状态文件：

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

硬规则：

```text
HTML only reads/submits.
Markdown only explains.
Obsidian only stores knowledge.
state/ owns process state.
```

### 5.4 接入资料来源

每个来源必须进入来源注册表，并生成 Evidence Card。来源可以包括：

- 文档。
- PDF。
- 表格。
- 图片。
- 会议纪要。
- 电商后台数据。
- 用户反馈。
- 公开网页。
- 内部制度。
- 产品资料。
- 品牌资料。

不要让原始资料直接进入正式知识页。

### 5.5 生成 ChangeSet

每次新增、修改或删除知识，都应形成 ChangeSet。ChangeSet 至少包含：

- 变化类型。
- 影响页面。
- 权限影响。
- 证据 ID。
- 冲突情况。
- 是否需要负责人审核。

### 5.6 通过 Gate Router 分流

Gate Router 自动决定：

- `auto_archive`：低风险归档。
- `pending_review`：需要负责人判断。
- `evidence_gap`：证据不足。
- `publish_candidate`：可以生成发布候选。
- `policy_review`：涉及权限、流程、制度或 MCP 边界。

低风险项目不进入人工审核台。

### 5.7 使用 Review Desk

审核台只让负责人判断必要事项。推荐字段：

```text
Decision: approved / evidence_required / rejected / do_not_ingest
Permission: public / internal / confidential
Note
```

不要让负责人处理低风险清洗、链接修复、索引更新或重复发布判断。

### 5.8 发布知识

Publish Commit 负责：

- 更新正式知识页。
- 写入 merge 记录。
- 写入版本记录。
- 更新页面状态。
- 记录负责人和发布时间。

不要静默把页面标记为 stable。

### 5.9 生成 Stable Export

Stable Export 是普通 Agent 和 MCP 默认可调用层。它只能包含：

- 已审核知识。
- 已明确权限。
- 可追溯证据。
- 已通过验收问题的页面或知识块。

Stable Export 不应暴露：

- Raw。
- Draft。
- 未审核 ChangeSet。
- 完整审核台。
- 机密资料。
- 未发布正式页。

## 6. 搭建期和维护期

### 6.1 搭建期

搭建期重点是建立系统：

- 架构。
- 核心页面。
- 权限规则。
- 负责人模型。
- 证据基线。
- 审核和发布规则。
- Stable Export 验收问题。

搭建期审核重点：

```text
Review pages.
Review rules.
Review core facts.
```

### 6.2 维护期

维护期重点是处理增量：

- 新来源。
- 新事实。
- 冲突。
- 权限风险。
- 正式页影响。

维护期审核重点：

```text
Review changes.
Review conflicts.
Review permission risk.
```

### 6.3 切换条件

必须通过 5 个闸门后才能进入维护期：

| Gate | 通过标准 |
| --- | --- |
| Formal Page Stability Gate | 核心正式页具备来源、负责人、权限、merge 记录、版本记录和页面发布审核。 |
| Architecture Lock Gate | 七节点流程、负责人模型、权限模型、policy rules 和 state uniqueness 已确认。 |
| Evidence Baseline Gate | 核心事实都有 Evidence Card，P0 证据缺口清零。 |
| Automation Reliability Gate | 自动化连续稳定运行，不丢提交、不漂移状态、不绕过权限。 |
| Callability Acceptance Gate | Stable Export 通过验收问题，且能按权限过滤。 |

## 7. 后续自动化建设

推荐中期收敛为统一入口：

```text
tools/run_knowledge_pipeline.py
```

最小执行顺序：

```text
lock
-> config
-> Discover
-> Evidence Card
-> ChangeSet
-> Gate Router
-> Review Desk refresh
-> Publish Commit candidates
-> Stable Export checks
-> pipeline_runs.jsonl
-> dashboard summary
```

当前阶段建议用：

- Codex automation。
- 本地 Python scripts。
- 本地 HTML 审核台服务。
- macOS LaunchAgent 保活。

暂不建议引入外部编排服务，除非出现：

- 跨机器运行。
- SLA 要求。
- 可视化 DAG。
- 任务级审计。
- 多人运维。
- 大量并行来源。
- 长期脱离桌面环境运行。

## 8. MCP 和 Agent 调用边界

默认只暴露 Stable Export。

推荐 MCP Resources：

```text
company://stable/context
company://stable/page/{page_id}
company://evidence/{evidence_id}
company://version/{page_id}
company://permissions
```

推荐 MCP Tools：

```text
search_stable_knowledge
get_evidence_for_claim
get_page_version
check_permission_risk
submit_review_decision
```

角色边界：

| 角色 | 默认权限 |
| --- | --- |
| Ordinary agent | 读取 Stable Export。 |
| Review agent | 读取审核队列和必要证据。 |
| Maintenance agent | 创建 Evidence Card 和 ChangeSet。 |
| High-permission agent | 在授权后执行 Publish Commit。 |

## 9. 商业交付验收

一个项目达到商业交付标准前，应至少具备：

- 七节点流程已落地。
- `agent.md` 清晰可执行。
- `state/` 或过渡状态源明确。
- Review Desk 只处理风险事项。
- 项目看板显示阶段、闸门、阻塞和自动化健康。
- Publish Commit 有 merge 和 version 记录。
- Stable Export 有权限过滤和验收问题。
- 自动化可以无人运行到审核台前。
- MCP / Agent 只能调用 Stable Export。
- 迁移包包含知识、状态、证据、脚本、文档、Skill Pack 和启动说明。

## 10. 常见问题

### 安装后 Codex 没有识别 skill

处理方式：

1. 确认 skill 已复制到 `${CODEX_HOME:-$HOME/.codex}/skills`。
2. 确认每个 skill 目录都有 `SKILL.md`。
3. 重启 Codex 或新开会话。
4. 重新运行：

```bash
python3 skills/scripts/check_skill_pack.py
```

### 是否可以直接把这套 Skill Pack 给新项目使用

可以。推荐复制整个 `skills/` 目录和项目级 `agent.md` 模板，再根据新项目改写业务信息、权限规则、来源配置和验收问题。

### 是否安装后就会自动生成知识库

不会。Skill Pack 让 Agent 知道应该如何搭建和维护知识库，但新项目仍需要资料来源、项目规则、状态文件、审核台、发布脚本和 Stable Export。

### 是否必须使用 Obsidian

不必须。Obsidian 可以作为 Markdown 知识库和人工阅读界面，但流程状态必须由 `state/` 管理。后续迁移到其他文档系统、知识库系统或 MCP 服务时，Stable Export 和 state 才是关键资产。

### 是否可以开放给普通 Agent 读取全部资料

不可以。普通 Agent 默认只能读取 Stable Export。Raw、Draft、未审核 ChangeSet、完整审核台、机密资料和未发布正式页都不应作为默认上下文。

## 11. 维护建议

每次升级 Skill Pack 后执行：

```bash
python3 skills/scripts/check_skill_pack.py
bash ./scripts/install_to_codex_mac.sh --dry-run
```

确认无误后再重新安装：

```bash
bash ./scripts/install_to_codex_mac.sh
```

如果这套 Skill Pack 进入商业交付，建议同步维护：

- 版本号。
- 变更日志。
- 安装说明。
- 验收清单。
- 示例项目。
- 迁移包模板。
- MCP 示例服务。
