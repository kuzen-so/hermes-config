# Obsidian 文件夹架构 v3.0 — 纯知识流（状态流移除）

## 背景

用户判定 `01-To do`、`02-Doing`、`97-Weeks`、`98-Logs`、`99-Days` 是日程管理，不是知识管理。日程管理应该用日历/提醒事项，不属于 Obsidian 知识库。

## 当前架构（v3.0）

```
知识流（input → output）：
  10-Inbox/
    voice/        ← 语料库（你说过的话）
    clip/         ← 素材库（金句/概念/拆解）
    idea/         ← 选题池
    draft/        ← 创作中
    rule/         ← 方法论/数据复盘
  11-Processing/  ← 复杂项目在写但还没成型
  12-Output/      ← 已发布
```

## 关键变更（v2.0 → v3.0）

| 删除 | 原因 |
|------|------|
| 01-To do | 日程管理，用 Apple Reminders |
| 02-Doing | 和 draft/ 重叠 |
| 97-Weeks | 用户拒绝周报系统 |
| 98-Logs | 零维护，不需要 |
| 99-Days | 零维护，不需要 |

## 语料库系统（新增）

用户受推文启发建立四层知识库：

| 文件夹 | 内容 | 示例 |
|--------|------|------|
| voice/ | 你说过的话、聊天记录、录音转写 | `voice-me.md` |
| clip/ | 可复用的概念、金句、拆解 | `clip-bookmark-rate.md` |
| idea/ | 选题池，随时能写的选题 | `idea-ai-content-system.md` |
| draft/ | 正在写的文章 | `draft-xiaohongshu-story.md` |
| rule/ | 从数据提炼的方法论 | `rule-title-formula.md` |

**流转规则：**
- voice/clip → idea/（提炼选题）
- idea/ → draft/（开始写）
- draft/ → 12-Output/（发布完移过去）
- 所有发布 → rule/（数据复盘提炼方法论）

**移动方式：** 改名+mv，不拖文件夹
```
idea-codex-guide.md → draft-codex-guide.md → 12-Output/pub-codex-guide.md
```

## 平铺 vs 文件夹

用户原始偏好：内部绝对平铺，无子文件夹。
本次例外：语料库必须建文件夹，否则文件移动混乱。
→ 命名前缀方案（voice-xxx.md 平铺）被否决
→ 最终：5个子文件夹，但内部仍平铺

## 与 SOUL.md 的对应关系

- 知识流 → SOUL 4.7 知识管理（拒绝 Collector's Trap）
- 语料库系统 → 用户特定配置（内容创作）
