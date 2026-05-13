---
name: xhs-image-generation
description: Xiaohongshu配图生成工作流 - Gemini/nanobanana
version: 1.1
---

# 小红书配图生成工作流

## 关键发现
- Gemini/nanobanana 对全中文提示词支持差，会返回 PNG 占位符图标
- **必须用英文主体描述 + 中文文本用引号包裹指定**
- 参考 `content-factory/references/gemini-hand-drawn-prompt-format.md` 获取完整格式规范

## 提示词格式（正确）

```
Vertical portrait orientation, 9:16 aspect ratio, tall composition.
Hand-drawn notebook style, cream paper with light gray ruling lines,
rough deckled edges, warm medium-brown wooden table with visible grain.

Big bold brush-marker style purple ink text: "中文标题".
Below in gray handwritten marker: "中文副标题" with double underline.

Center: [插图元素，全英文描述]
Bottom left: small gray text "中文小字".

Deep purple headline, dark gray text, black illustrations,
off-white paper, warm wood background.
Imperfect authentic handcrafted feel.
```

## 常见失败

| 错误 | 结果 |
|------|------|
| 全中文提示词 | 返回 PNG 文件占位符图标 |
| 中英文混杂描述画面 | 风格偏离，文字渲染错误 |
| 缺少 `9:16` / `vertical portrait` | 生成横版图 |

## 已验证有效的图类型
1. **痛点场景**：火柴人 + 具体数字 + 焦虑表情
2. **流程图**：箭头连接图标（收件箱→机器人→对话气泡）
3. **封面钩子**：大字标题 + 反常识副标题 + 信任小字
4. **对话截图**：模拟聊天界面，左用户右AI
5. **AI收件箱**：乱纸→箱子→机器人→问答
6. **安全提示**：垃圾桶 + STOP手势 + 底线指令（如"删之前先扔垃圾桶"）
7. **互动引导**：提问式互动，避免客服感（"有问题/评论区交流/你的笔记怎么整理的？"）

## 生成后管理

图片默认输出到 `/Users/kuzen/Downloads/`，文件名格式 `Gemini_Generated_Image_*.png`。

### 检查与重命名流程

```bash
# 1. 列出最新生成的图片并编号
ls -lt ~/Downloads/ | grep Gemini | awk '{print $NF}' | nl

# 2. 用 vision_analyze 逐一查看内容
# 3. 确认与文案匹配后，重命名为语义化文件名
cd ~/Downloads && mv Gemini_Generated_Image_xxx.png xiaohongshu_01_xxx.png
```

**⚠️ 文件名重置问题：**
nanobanana/Gemini 有时会生成后将文件名重置为 hash 值（如 `3bb2bdf7...png`）。
**处理：** 生成后不要依赖文件名，立即用 `vision_analyze` 识别内容，再重命名。

**注意**：nanobanana/Gemini 有时会重置文件名回 hash 值，生成后需立即检查。

### 文案-配图匹配检查表

| 检查项 | 通过标准 |
|--------|---------|
| 文字正确性 | 中文文字无乱码、无遗漏 |
| 风格一致性 | 与系列其他图保持统一（纸张、木纹、紫色马克笔） |
| 主题相关性 | 不混入无关主题（如"坟墓or大脑"混入效率工具系列） |
| 情绪一致性 | 痛点图要有焦虑感，解决图要有释放感 |

## 安全提示图

当文案包含重要安全提醒（如AI删除文件）时，独立生成：

```
Vertical portrait orientation, 9:16 aspect ratio, tall composition.
Hand-drawn notebook style, cream paper with light gray ruling lines,
rough deckled edges on right side, placed on warm medium-brown wooden table
with visible grain. Slightly aged paper.

Big bold brush-marker style purple ink text: "删之前".
Below in gray handwritten marker: "先扔垃圾桶" with wavy underline.

Center: hand-drawn trash can with crumpled paper inside,
small robot hand pulling paper back with "STOP" speech bubble,
red exclamation mark doodle above.

Bottom: small gray text "给AI的底线指令".
Scattered warning triangles, stars, and squiggly lines.

Deep purple headline, dark gray text, black illustrations,
off-white paper, warm wood background.
Imperfect authentic handcrafted feel.
```

## 互动引导图生成

当文案需要评论区互动时，生成结尾引导图：

```
Big bold brush-marker style purple ink text: "有问题".
Below in gray handwritten marker: "评论区交流" with wavy underline.
Center: large speech bubble doodle with "?" inside,
small stick figure with pencil, arrow pointing to comment box.
Bottom: small gray text "你的笔记怎么整理的？".
```

**避免**："看到都会回"等客服感表达，改用提问式互动。

## 配图与文案匹配原则

| 文案段落 | 推荐配图类型 |
|---------|------------|
| 痛点引入 | 焦虑场景图（数字冲击+困惑表情） |
| 转折顿悟 | "我悟了"封面图或"不用整理"观点图 |
| 解决方案 | 流程图或AI收件箱图 |
| 工具推荐 | 放评论区，正文不配 |
| 结尾金句 | 核心观点图或互动引导图 |

## 工具
- nanobanana CLI
- Gemini CLI
- 输出路径：/Users/kuzen/Downloads/