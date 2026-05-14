# Hermes 配置五要素体系

> 来源：2026-05-15 会话，用户系统性梳理 Hermes Agent 组成架构

## 五要素总览

| 要素 | 控制什么 | 位置 | 容量 | 用户操作 |
|------|---------|------|------|---------|
| **system_prompt** | AI 身份（我是谁） | `~/.hermes/config.yaml` | 无限制 | 手动编辑或让 Agent 修改 |
| **SOUL.md** | AI 怎么工作（纪律层） | `~/.hermes/SOUL.md` | 无限制 | Obsidian 编辑循环 |
| **MEMORY** | 我知道什么关于用户 | `~/.hermes/memories/` | USER 1,375 / MEMORY 2,200 | Agent 半自动或用户主动触发 |
| **Skill** | 具体任务怎么做 | `~/.hermes/skills/` | 无限制 | 按需加载/编写/修改 |
| **工具** | AI 能做什么 | 内置/配置 | 无限制 | 开关、配置 |

## 关系图

```
system_prompt（我是谁）
    ↓
SOUL.md（我怎么工作）
    ↓
MEMORY（我知道用户什么）
    ↓
Skill（具体任务怎么做）
    ↓
工具（用什么执行）
```

## 官方优先级（理论）

| 优先级 | 配置 |
|--------|------|
| 1 | system_prompt（身份层） |
| 2 | SOUL.md（纪律层） |
| 3 | display.personality（人格预设） |

冲突时：system_prompt > SOUL.md > personality

## Kimi 模型的实际优先级（特殊行为）

Kimi 系列模型有**强身份绑定**，system_prompt 的身份定义经常被忽略。

| 配置 | 理论优先级 | 实际效果（Kimi） |
|------|-----------|----------------|
| system_prompt | 最高 | 被忽略 |
| SOUL.md | 第二 | **实际生效** |
| personality | 最低 | 被覆盖 |

### 验证案例

用户配置 system_prompt："你是麟子"
- `/reset` 后问"你是谁" → 回答"我是 Hermes Agent"（system_prompt 无效）
- SOUL.md 添加身份强制："你的名字是麟子" → 回答"我是麟子"（SOUL.md 生效）

### 结论

使用 Kimi 时：
- **身份定义放 SOUL.md**，不要依赖 system_prompt
- system_prompt 可精简到极简（"你是麟子，Kuzen 的助手"）
- SOUL.md 承担 system_prompt 的兜底角色

## 各要素详细说明

### system_prompt

**官方定义**：身份层 — 我是谁、名字、性格、说话方式、价值观

**应该包含**：
- 身份：名字、角色
- 风格：回复长度、语气
- 价值观：真实性、直率、自主性

**不应该包含**（应放 SOUL.md）：
- 工具规则
- 输出格式
- 记忆规则
- 执行流程

### SOUL.md

**官方定义**：纪律层 — 工具规则、输出格式、记忆规则、执行流程

**当前结构示例**：
```
1. 执行纪律（行动先于解释、输出结构）
2. 技能调用（先搜 skill 再执行）
3. 系统维护（skill 组织、GitHub 备份）
4. 工具偏好（Brave Search）
5. 用户特定配置（文件创建规范）
6. 记忆规则（保存原则、写入格式）
```

**不应该包含**（应放 system_prompt）：
- 身份定义（"你是麟子"）
- 性格描述（"开门见山"）
- 价值观（"不知道就说不知道"）

### MEMORY

**两层结构**：

| 文件 | 容量 | 内容 | 写入方式 |
|------|------|------|---------|
| USER.md | 1,375 字符 | 你是谁 — 名字、角色、偏好、沟通风格 | 需主动 |
| MEMORY.md | 2,200 字符 | 我的笔记 — 环境事实、项目约定、工具怪癖 | 半自动 |

**保存原则**：
- 保存：用户纠正、偏好分享、环境事实、约定、教训
- 不保存：任务进度、临时 TODO、易重新发现的信息

### Skill

**定义**：具体任务流程文档，按需加载

**与 MEMORY 的区别**：
- Skill = 怎么做（流程、规则）
- MEMORY = 知道什么（事实、偏好）

**加载方式**：
- 不自动触发
- 执行前必须 `skills_list` 搜索
- 找到后 `skill_view` 加载

### 工具

**分类**：
- 内置工具：terminal、file、web、browser、vision...
- MCP 服务器：外部协议接口
- 插件：扩展功能

**配置位置**：`~/.hermes/config.yaml` 中的 `toolsets`

## 常见误区

| 误区 | 正确 |
|------|------|
| SOUL.md 可以覆盖身份 | SOUL.md 不能覆盖 system_prompt 的身份定义（官方） |
| system_prompt 对 Kimi 有效 | Kimi 忽略 system_prompt，SOUL.md 才是实际生效位置 |
| personality 有用 | 被 system_prompt 和 SOUL.md 完全覆盖 |
| 创作规则放 MEMORY | 创作规则放 Skill，MEMORY 只放偏好和事实 |
| Obsidian 结构放 MEMORY | 工作规范放 SOUL.md |

## 配置修改方式

| 配置 | 修改方式 |
|------|---------|
| system_prompt | 手动编辑 config.yaml 或让 Agent 修改 |
| SOUL.md | Obsidian 编辑循环（复制→编辑→同步→GitHub） |
| USER.md | `memory` 工具或手动编辑 |
| MEMORY.md | `memory` 工具或手动编辑 |
| Skill | `skill_manage` 或 Obsidian 编辑循环 |

## 备份策略

**GitHub 仓库**：`hermes-config/`

| 备份 | 不备份 |
|------|--------|
| SOUL.md | config.yaml（有 API key） |
| skills/user/ | .env（有密码） |
| memories/ | sessions/ |

## 参考文件

- `references/kimi-system-prompt-behavior.md` — Kimi 身份绑定详细案例
- `references/memory-architecture-explained.md` — 三层记忆系统官方说明
