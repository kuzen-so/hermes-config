# Obsidian 文件夹架构 v2.0 — 状态流 + 知识流双轨制

## 背景

用户是内容创作者，input → output 是核心循环。旧架构只有状态流（01-To do / 02-Doing / 03-Done），无法承载知识处理流程，导致知识笔记被迫塞进 03-Done，语义矛盾。

## 当前架构（v2.0）

```
状态流（事，有生命周期）：
  01-To do        ← 待办事项
  02-Doing        ← 进行中的项目/文章
  03-Done         ← 已完成的项目/文章（平铺，无子文件夹）

知识流（input → output，无生命周期）：
  10-Inbox        ← 临时捕获，24-48h 内必须处理
  11-Processing   ← 正在消化/重写/连接的信息
  12-Output       ← 已发布的/交付的内容（最终形态）

时间流（记录）：
  97-Weeks/2026/
  98-Logs
  99-Days/2026/
```

## 关键纪律

### 10-Inbox
- 只放还没看过的/还没决定要不要处理的
- 满了就清，不清就堵
- 24-48h 内必须分流到 Processing 或删除

### 11-Processing
- 每篇笔记开头必须写：`Output: [具体文章/视频/决策]`
- 回答不了 → 回 10-Inbox 或直接删
- 内部可粗分文件夹（如 Tools/Content），但内部平铺，不用全局数字编号

### 12-Output
- 已交付，不再动
- 是最终形态，不是草稿

### 03-Done
- 已完成的项目/文章平铺
- **禁止主题子文件夹**（如 Tools/Plan/money/Social）
- 主题检索用链接、MOC、Dataview，不是文件夹层级

## 命名规则

- 放弃全局数字编号（01-Obsidian、02-Homebrew）
- 用自然文件名：`Obsidian.md`、`Homebrew.md`
- 需要排序时，用时间前缀：`2025-04-Obsidian.md`
- 或手动优先级（极少）：`A-Obsidian.md`

## 错误示范（已发生）

```
03-Done/
  01-Tools/          ← 主题子文件夹，和状态流打架
    01-Obsidian.md   ← 全局编号，插入/删除成本高
    02-Homebrew.md
  02-Plan/           ← 空的，占位置
  03-money/
  04-Social/
```

## 正确迁移示例

```
# 旧位置
03-Done/01-Tools/01-Obsidian.md
03-Done/01-Tools/02-Homebrew.md
03-Done/03-money/Dnf搬砖.md

# 新位置
11-Processing/Tools/Obsidian.md      ← 工具参考，持续使用/更新
11-Processing/Tools/Homebrew.md
11-Processing/Content/Dnf搬砖.md    ← 或 12-Output/Content/Dnf搬砖.md（若已发布）
```

## 与 SOUL.md 的对应关系

- 状态流 → SOUL 4.1 日报系统（任务管理部分）
- 知识流 → SOUL 4.7 知识管理（拒绝 Collector's Trap）
- 时间流 → SOUL 4.1-4.3 日报/周报/总结
