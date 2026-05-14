# Obsidian 结构追踪规范

## 目的

用户要求我能回答"我的 XX 记录在哪"。为此需要定期扫描 Obsidian 目录结构，存到 SOUL.md 或 MEMORY 中。

## 扫描范围

```
/Users/kuzen/Documents/Obsidian/
├── 1-Inbox/                    ← 收件箱
├── 2-Box/                      ← 暂存
├── 10-Content Factory/         ← 内容工厂
│   ├── clip/                   ← 剪藏
│   ├── draft/                  ← 草稿
│   ├── idea/                   ← 灵感
│   ├── rule/                   ← 创作规则
│   └── voice/                  ← 成稿
│       ├── 微信公众号/
│       └── Days/YYYY/          ← 日记
├── 11-Processing/              ← 处理中
├── 12-Output/                  ← 输出
├── 96-Archive/                 ← 归档
├── 97-Weeks/2026/              ← 周报
└── 98-Logs/                    ← 日志
```

## 关键路径

| 内容 | 路径 |
|------|------|
| 日记 | `10-Content Factory/voice/Days/YYYY/YYYY-MM-DD.md` |
| 创作规则 | `10-Content Factory/rule/` |
| 已发布文章 | `12-Output/` |
| 处理中 | `11-Processing/` |
| 收件箱 | `1-Inbox/` |
| 周报 | `97-Weeks/2026/` |

## 扫描命令

```bash
# 查看目录结构
find /Users/kuzen/Documents/Obsidian -maxdepth 2 -type d | sort

# 查看所有 md 文件
find /Users/kuzen/Documents/Obsidian -type f -name "*.md" | head -50

# 查看根目录 md 文件
ls /Users/kuzen/Documents/Obsidian/*.md
```

## 更新时机

1. **用户要求时**："扫描我的 Obsidian"
2. **发现结构变化时**：用户提到新文件夹、新路径
3. **定期**：每周一次（cronjob 或手动触发）

## 存储位置

| 信息 | 存储位置 |
|------|---------|
| 文件夹结构 | SOUL.md 第 5 章（用户特定配置） |
| 具体文件位置 | MEMORY.md（环境事实） |

## 用户规范

- 日记文件：`10-Content Factory/voice/Days/YYYY/YYYY-MM-DD.md`
- 其他文件：Obsidian 根目录（扁平）
- 命名：不加时间/状态/目的前缀
- 结构：扁平，不加子文件夹（时间维度除外）

## 变化记录

- v1.0：只记录日记路径
- v2.0：增加所有文件夹，按实际结构更新
