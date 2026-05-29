---
name: weight-tracking
title: 麟子体重记录
description: 当用户说"减重"时，自动读取 Apple Notes 备忘录，汇报当前进度，并协助记录当日晨重。
triggers:
  - keyword: "减重"
  - keyword: "体重"
  - keyword: "减肥"
  - keyword: "今天体重"
---

# 体重追踪备忘录模式（Reference）

## 目标
用户说"减重"时，零废话自动读取备忘录、汇报状态、等待当日数据并记录。

## 执行步骤

### Step 1: 读取备忘录
用 `osascript -l JavaScript` 读取 Apple Notes 中标题为「麟子减肥监督记录」的备忘录内容。

```javascript
const Notes = Application("Notes");
const accounts = Notes.accounts();
let targetNote = null;
for (const account of accounts) {
    const folders = account.folders();
    for (const folder of folders) {
        const notes = folder.notes();
        for (const note of notes) {
            if (note.name() === "麟子减肥监督记录") {
                targetNote = note;
                break;
            }
        }
        if (targetNote) break;
    }
    if (targetNote) break;
}
// targetNote.body() 获取 HTML 内容
```

### Step 2: 解析当前进度
从备忘录 body 中提取：
- 开始日期
- 目标体重（55 kg）
- 最后一条记录的日期和体重
- 计算今天距离开始日期的天数 = Day N

如果备忘录中没有实际记录（只有空模板），则今天是 Day 1。

### Step 3: 向用户汇报状态
用极简格式回复，例如：
```
当前进度：Day 3
上次体重：61.40 kg（2026-04-23）
距离目标：6.40 kg

今天晨重多少？直接发数字或截图。
```

### Step 4: 等待用户提供今日体重
用户可能回复：
- 纯数字（如 `61.2` 或 `61.20`）
- 一张体脂秤截图（包含体重数字）

**关键约束**：不要看到任意图片就触发记录，必须是在用户说了"减重"之后的上下文里，才解析图片中的体重数字。

### Step 5: 解析体重并写入备忘录
- 如果是纯数字，直接使用。
- 如果是图片，用 vision 工具读取图片中的体重数字。
- 计算距目标差值 = 今日体重 - 55 kg。
- 用 JXA 更新备忘录 body，在记录区追加新条目：

```html
<div>2026-04-24（Day 2）</div>
<div>晨重：61.20 kg</div>
<div><br></div>
```

追加规则：在 `<div><b>记录区：</b></div>` 之后，或在最后一条记录后面插入新的 `<div>` 块。

### Step 6: 确认记录成功
回复确认，例如：
```
✅ 已记录 Day 2（2026-04-24）
晨重：61.20 kg
距离目标还差 6.20 kg
```

## 关键约束
1. **只响应明确包含触发词的消息**"减重"，不要自动分析所有图片。
2. 每次追加记录时保持原有备忘录格式不变。
3. 日期使用 `YYYY-MM-DD` 格式。
4. 体重统一保留两位小数（如 `61.40 kg`）。

## 备忘录结构参考
```html
<div><b><span style="font-size: 24px">麟子减肥监督记录</span></b></div>
<div><br></div>
<div>性别：女</div>
<div>身高：169 cm</div>
<div>目标体重：55 kg</div>
<div>开始日期：2026年4月23日</div>
<div><br></div>
<div>========================</div>
<div><br></div>
<div><b>记录区：</b></div>
<div><br></div>
<div>2026-04-23（Day 1）</div>
<div>晨重：61.40 kg</div>
<div><br></div>
```
