# Apple Reminders Recurrence Pitfall

## Problem

Setting `reminder.recurrence = "FREQ=DAILY"` via JXA throws `-1700` (type conversion error). The `recurrence` property exists but is a complex internal object, not a writable string.

## Symptom

```
execution error: Error: Error: 不能转换类型。 (-1700)
```

## Fix

Use `remindctl` for creation, then manually set repeat in Reminders.app (info icon → 重复 → 每天). Or use Apple Calendar events for daily repeating reminders instead.

## Workaround for Daily Reminders

- `remindctl add --title "X" --due "YYYY-MM-DD HH:mm"` — creates single reminder
- Calendar events support `recurrence` via AppleScript: `set evt's recurrence to "FREQ=DAILY;BYDAY=MO"`
- For agent-managed daily alerts, use `cronjob` tool instead

## Rule

When user asks for "每天提醒", default to Calendar events (repeatable) or cronjobs, not Reminders.
