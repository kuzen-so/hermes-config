# Gemini 手绘涂鸦风提示词格式

## 关键发现

用户纠正：Gemini/nanobanana 对全中文提示词支持差，会返回 PNG 占位符图标。

**正确格式：英文主体描述 + 中文文本用引号包裹指定**

## 已验证有效的完整提示词结构

```
Vertical portrait orientation, 9:16 aspect ratio, tall composition.
Hand-drawn notebook style, cream paper with light gray ruling lines,
rough deckled edges on right side, placed on warm medium-brown wooden table
with visible grain. Slightly aged paper.

Big bold brush-marker style purple ink text: "中文标题".
Below in gray handwritten marker: "中文副标题" with double underline.

Center: [插图元素描述，全英文]
Bottom left: small gray text "中文小字".

Scattered stars and sparkles around [元素].
Small squiggly accent marks, doodle lines.

Deep purple headline, dark gray text, black illustrations,
off-white paper, warm wood background.
Imperfect authentic handcrafted feel.
```

## 关键规则

| 元素 | 处理方式 | 示例 |
|------|---------|------|
| 画面风格/构图/材质 | 全英文描述 | `Hand-drawn notebook style, cream paper...` |
| 图片内要显示的中文文字 | 引号包裹，嵌入英文描述 | `Big bold purple ink text: "不用整理"` |
| 颜色/位置/字体样式 | 英文形容词 | `brush-marker style`, `double underline` |
| 情绪/氛围 | 英文收尾 | `Imperfect authentic handcrafted feel` |

## 常见失败

| 错误 | 结果 |
|------|------|
| 全中文提示词 | 返回 PNG 文件占位符图标 |
| 中英文混杂描述画面 | 风格偏离，文字渲染错误 |
| 缺少 `9:16` / `vertical portrait` | 生成横版图 |

## 本次会话生成的5张图对应文案

| 图 | 核心文字 | 用途 |
|:---|:---|:---|
| Obsidian+AI流程 | "Obsidian + AI" / "丢进去，对话找回" / "活着的笔记库" | 正文插图 |
| 封面钩子 | "笔记过千后我悟了" / "不用花时间整理" / "替你试完47个工具" | 封面 |
| 痛点场景 | "3000条笔记" / "找一条靠运气" / "分类200小时" | 正文插图 |
| 核心观点 | "不用整理" / "直接问AI" / "笔记的价值是随时能问到" | 封面/核心页 |
| AI收件箱 | "AI收件箱" / "不想整理的丢进来" / "问AI就行" | 正文插图 |

## 生成后管理

图片默认输出到 `/Users/kuzen/Downloads/`，文件名格式 `Gemini_Generated_Image_*.png`。

建议生成后立即编号检查：
```bash
ls -lt ~/Downloads/ | grep Gemini | awk '{print $NF}' | nl
```

然后用 vision_analyze 逐一查看内容，确认与文案匹配后再使用。
