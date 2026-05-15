# Skill 边界纪律 — 会话记录

## 背景

2026-05-15 会话中，用户清理了 skill 库，明确了 skill 与 SOUL.md 的边界。本文件记录该纪律，防止未来重复犯错。

## 核心规则

**Skill = Workflow**。一个 skill 必须包含：
1. 触发条件
2. 执行步骤
3. 输出产物

缺任何一个，就不配做 skill。

## 什么进 SOUL.md

- 系统级交互规则（沟通纪律、执行纪律）
- 信息摄入纪律（外部内容评估标准）
- 决策辅助纪律（trade-off 框架、防拖延机制）
- 记忆规则（保存/不保存原则）

## 什么进 Skill

- 有明确输入→处理→输出的 workflow
- 需要多步骤协作完成的任务
- 有特定领域知识和最佳实践的任务

## 已删除的错误 Skill（案例）

| Skill 名称 | 错误原因 | 正确归属 |
|-----------|---------|---------|
| content-curation | 只有判断标准，无 workflow | SOUL.md §8 信息摄入纪律 |
| decision-assist | 只有交互规则，无 workflow | SOUL.md §9 决策辅助纪律 |
| user-communication-protocol | 只有沟通纪律，无 workflow | SOUL.md §2 沟通纪律 |
| soul-evolution | 是 SOUL.md 的维护手册，不是 workflow | 删除，需要时直接读 SOUL.md |
| typography-workflow | 太薄，只是 Typora 使用说明 | 删除，需要时直接查 |
| user-project-coaching | 三个模式混在一起，应拆成三个 | 待拆分（Builder/Startup/Action） |

## 创建 Skill 前的确认流程

**必须执行**：创建 skill 前问用户"这个配做 skill 吗？"

用户确认标准：
- 有触发条件吗？
- 有执行步骤吗？
- 有输出产物吗？
- 三个都是 yes → 可以创建
- 任一 no → 进 SOUL.md 或 memory

## 用户明确指令

> "以后创建 skill 前先跟你确认"

此指令已写入 memory，每次创建 skill 前必须执行。
