# 管家备忘录资料库结构

## Apple Notes 备忘录清单

| 备忘录 | 内容 | 更新方式 |
|--------|------|---------|
| 💰 账单 | 月度收支明细、分类统计 | 用户说"花了"/"收入"时追加 |
| 💪 训练记录 | 身体数据、饮食计划、训练日志、渐进负荷 | 用户反馈训练后追加 |
| 🧴 护肤记录 | 皮肤类型、产品清单、护理流程、反应记录 | 用户反馈皮肤状态后追加 |

## 备忘录创建脚本

使用 JXA (JavaScript for Automation)：

```javascript
const Notes = Application("Notes");
const folder = Notes.folders.byName("Notes");
Notes.make({new: "note", at: folder, withProperties: {
    name: "💰 账单",
    body: "<h1>账单</h1>..."
}});
```

## 追加内容脚本

```javascript
const note = folder.notes.byName("💰 账单");
note.body = note.body() + "\n<div>新记录</div>";
```

## 注意事项

- Notes.app 可能修改备忘录名称（去掉 emoji），用 `notes().forEach(n => console.log(n.name()))` 确认实际名称
- 备忘录内容用 HTML 格式
- 表格用 `<table><tr><td>...</td></tr></table>`
