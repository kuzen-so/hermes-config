# Apple Notes 同步模式

## JXA 创建带表格的备忘录

```javascript
const Notes = Application("Notes");
const folder = Notes.folders.byName("Notes");
Notes.make({new: "note", at: folder, withProperties: {
    name: "🍗 标题",
    body: "<h1>标题</h1><div><br></div><table>...</table>"
}});
```

## 关键点

- **Body 是 HTML**：`<div>` 换行，`<table>` 表格
- **标题加 Emoji**：`🍗` `💪` `🧴` `📋` 便于视觉扫描
- **默认文件夹**：即使中文系统也是 `"Notes"`，不是 `"备忘录"`
- **批量创建可能超时**：建议逐个创建

## 更新现有备忘录

```javascript
const note = folder.notes.byName("标题");
note.body = "<h1>新内容</h1>...";
```

## 陷阱

- Notes.app 可能自动修改备忘录名称，创建后务必验证
- `recurrence` 属性只读，无法通过 JXA 设置重复提醒
