# Apple Notes JXA Pattern

## Creating Notes with Tables

```javascript
const Notes = Application("Notes");
const folder = Notes.folders.byName("Notes");
Notes.make({new: "note", at: folder, withProperties: {
    name: "🍗 Title",
    body: "<h1>Title</h1><div><br></div><table>...</table>"
}});
```

## Key Points

- Body is HTML: `<div>` for line breaks, `<table>` for tables
- Emoji in title for visual scanning
- Default folder is `"Notes"` even on Chinese macOS
- Batch creation may timeout; create individually

## Updating Existing Notes

```javascript
const note = folder.notes.byName("Title");
note.body = "<h1>New content</h1>...";
```

## Pitfall: Name Auto-Modification

Notes.app may auto-modify note names. Always verify after creation:
```javascript
folder.notes().forEach(n => console.log(n.name()));
```

## Data Sync: Skill References ↔ Apple Notes

User maintains two copies of lifestyle data:
1. **Skill references/** — canonical source, agent-readable
2. **Apple Notes** — user-facing, cross-device (iPhone/iPad/Mac)

**When user updates baseline data** (weight, products, routine):
1. Update skill reference file first
2. Sync to Apple Notes immediately via JXA
3. Confirm both locations match

**When user asks "我现在多少斤/用什么产品"**:
- Check Apple Notes first (most likely to be current)
- If discrepancy, ask user which is correct, then sync both
