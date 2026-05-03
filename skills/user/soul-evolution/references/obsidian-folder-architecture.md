# Obsidian 文件夹架构规范

## 核心原则：单一维度分类

禁止混合分类系统。文件夹层级只能有一个主维度：状态 或 主题，不能同时存在。

## 方案 A：状态主导（用户偏好）

```
01-To do/
  99-Question/
02-Doing/
03-Done/
97-Weeks/
  2026/
98-Logs/
99-Days/
  2026/
```

- Done 下面平铺，不靠子文件夹区分主题
- 主题检索用双向链接 [[ ]]、Dataview 或 MOC
- 文件名携带主题信息：`YYYY-MM-DD-topic-issue.md`

## 方案 B：主题主导（PARA）

```
Projects/
Areas/
Resources/
Archive/
```

- 状态用标签 `#todo` `#doing` `#done` 或文件名前缀
- 适合项目驱动型工作流

## 常见错误

**混合系统：**
```
03-Done/
  01-Tools/      ← 错误：主题子文件夹
  02-Plan/
  03-money/
  04-Social/
```

这导致笔记从 Doing → Done 时分类逻辑打架：按状态归档还是按主题归档？

## 修正操作

1. 把 03-Done 下的主题子文件夹里的笔记全部移到 03-Done 根级
2. 删除空的主题子文件夹
3. 文件名改为 `YYYY-MM-DD-topic-issue.md`
4. 拼写错误立即修正（如 01-Toos → 01-Tools）
