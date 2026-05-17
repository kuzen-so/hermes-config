---
name: weekly-report
description: 自由职业者周报生成器。触发后根据用户提供的本周信息生成结构化周报，格式和规则从用户记忆动态读取。
version: 2.0.0
author: Kuzen
tags: [productivity, writing, report, freelancer]
---

# 自由职业者周报生成器（最小结构版）

## 触发条件

用户说以下任一表达时加载本 skill：
- "生成周报"
- "写周报"
- "帮我整理周报"
- "周报"
- "weekly report"
- "复盘"
- "本周总结"

## 执行规则

1. **信息收集**：追问本周完成、下周计划、遇到的问题、关键数据（最多 3 个问题，合并提问）
2. **格式读取**：优先从 memory 读取用户偏好的周报格式。无记录时，使用下方默认模板
3. **生成输出**：按格式填充内容，遵循减法主义（无填充句、量化结果、问题带行动）
4. **自动保存**：生成后立即写入 `97-Weeks/YYYY/YYYY-第X周.md`，覆盖已存在文件
5. **记忆更新**：用户纠正或补充时，更新 memory 记录偏好

## 保存规则

- **路径**：`~/Documents/Obsidian/97-Weeks/YYYY/`
- **文件名**：`YYYY-第X周.md`（例如：`2026-第19周.md`）
- **行为**：覆盖已存在文件，不提示确认
- **年份文件夹**：如不存在，自动创建

## 默认模板

```markdown
# 周报 · [日期范围]

## 本周概览
> [一句话总结核心成果]

## ✅ 本周完成
- [事项]：[成果/数据]
- [事项]：[成果/数据]

## 📊 关键数据
- [指标]：[数据] | 环比：[变化]

## 🚧 问题与调整
- [问题] → [下一步动作]

## 📅 下周计划
1. [计划] — 目标：[验收标准]
```

## 记忆键（供 AI 读取/写入）

- `weekly-report/format`：用户偏好的周报结构
- `weekly-report/rules`：特殊规则（如不写收入、不加数据栏等）
- `weekly-report/last-template`：上次使用的模板类型

## 条件路由

- 用户提到"数据""指标""数字" → 询问是否需要数据栏，不强加
- 用户提到"问题""卡住""困难" → 进入问题分析模式，追问具体场景
- 用户说"下周""计划""todo" → 进入计划模式，要求验收标准
- 用户只给零散信息 → 用追问模板补全，最多3个问题

## 修改流程

用户说"改周报 skill"或"修改周报模板"时：
1. 复制当前 skill 到 `~/Documents/Obsidian/weekly-report.md`
2. 用户在 Obsidian 修改
3. 用户说"同步" → 覆盖回 `~/.hermes/skills/user/weekly-report/SKILL.md`

## Skill 创建纪律

**创建 skill 前必须确认**：用户明确说"以后创建 skill 前先跟你确认"

判断标准：
- 有触发条件？
- 有执行步骤？
- 有输出产物？
- 三个都是 yes → 可以创建
- 任一 no → 进 SOUL.md 或 memory

参考：`references/skill-boundary-discipline.md`（content-factory skill 下）