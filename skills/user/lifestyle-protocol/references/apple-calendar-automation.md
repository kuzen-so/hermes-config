---
name: apple-calendar
description: Manage Apple Calendar events on macOS via AppleScript. Read, list, create, and delete events across local and subscribed calendars.
---

# Apple Calendar 自动化（Reference）

macOS does not provide a native CLI for Calendar.app, but AppleScript has full read/write access.

## Prerequisites
- macOS with Calendar.app
- Hermes must have Automation permission for Calendar.app (granted on first use)

## Listing Calendars

```applescript
tell application "Calendar"
  set allCals to every calendar
  repeat with c in allCals
    log "Calendar: " & (name of c) & " | Events: " & (count events of c)
  end repeat
end tell
```

Run via: `osascript -e '...'`

## Listing Events

```applescript
tell application "Calendar"
  set c to calendar "CALENDAR_NAME"
  set evs to events of c
  repeat with e in evs
    log (summary of e) & " | " & (start date of e)
  end repeat
end tell
```

Event properties available: `summary`, `start date`, `end date`, `description`, `location`, `allday event`.

## Creating an Event

```applescript
tell application "Calendar"
  set c to calendar "CALENDAR_NAME"
  tell c
    make new event with properties {summary:"EVENT_TITLE", start date:date "DATE_STRING", end date:date "DATE_STRING"}
  end tell
end tell
```

Date string format example: `"2026-04-22 15:00:00"`

**Reliable format tip:** `YYYY-MM-DD` (e.g. `date "2026-07-01"`) is the most reliable format across locales. Verbose English strings like `"Wednesday, July 1, 2026 at 12:00:00 AM"` will throw a syntax error on non-English systems.

### All-Day Events

```applescript
tell application "Calendar"
  set c to calendar "CALENDAR_NAME"
  make new event at end of events of c with properties {summary:"TITLE", start date:date "2026-07-01", end date:date "2026-07-02", allday event:true}
end tell
```

Note: for all-day events, set `end date` to the **day after** the actual date (Calendar.app stores all-day events with an exclusive end date).

## Deleting Events

### Single Calendar — Reliable Method
`delete every event of calendar "NAME"` sometimes leaves events behind. Use a loop:

```applescript
tell application "Calendar"
  set c to calendar "CALENDAR_NAME"
  set evs to events of c
  repeat with e in evs
    delete e
  end repeat
end tell
```

### Bulk Delete Pitfall: Subscription Calendars
Subscription calendars (e.g. `中国大陆节假日`, US Holidays) often contain hundreds of events synced from a remote server. Deleting them one-by-one via AppleScript will **timeout** (30s+ for 200+ events) and the events may re-sync anyway.

**Do not** attempt bulk deletion on subscription calendars. Instead:
- Offer to unsubscribe/hide the calendar from the user's account settings, OR
- Advise the user to manually uncheck the calendar in Calendar.app sidebar.

### Calendar Deletion Restrictions
Some calendars are system-managed and **cannot be deleted** via AppleScript at all:

- **Integration calendars** (e.g. `计划的提醒事项` / Reminders integration): Error `-10025` "不能更改或删除该日历"
- **Birthdays**, **Siri Found in Apps**, **Family** calendars

If `delete calendar "NAME"` fails with a permissions or restriction error, explain to the user that the calendar is locked by the system and can only be hidden, not removed.

## Complete Cleanup Workflow

When a user asks to "clear all calendars":
1. List all calendars and event counts.
2. Show the user what's inside local calendars before deleting.
3. Delete local calendars' events using the loop method.
4. For subscription calendars with >50 events, explain they are server-synced and offer to hide/unsubscribe instead of deleting individual events.

## Example: Full Status Report

```applescript
tell application "Calendar"
  repeat with c in (every calendar)
    log (name of c) & ": " & (count events of c) & " events"
  end repeat
end tell
```

## Lunar Calendar (农历)

AppleScript **cannot reliably convert Gregorian dates to lunar dates**. Attempts via `NSCalendarIdentifierChinese` in JXA return `undefined` for year/month/day components, and `NSDateFormatter` with Chinese locale still outputs Gregorian dates.

**Workaround:** Use Python `zhdate`:
```bash
pip3 install zhdate
python3 -c "from zhdate import ZhDate; print(ZhDate.today())"
```

Then create the corresponding Gregorian event via AppleScript. Example flow:
```python
from zhdate import ZhDate
lunar = ZhDate(2026, 5, 17)
gregorian = lunar.to_datetime().strftime("%Y-%m-%d")
# Pass gregorian to AppleScript event creation
```

## Reminders Visibility in Calendar

Apple Reminders **only appear in Calendar.app if they have a due date**. Reminders with no due date live exclusively in the Reminders app and will not show in any Calendar view, even if the user has enabled "Show Reminders" in Calendar.

When a user wants a unified Calendar+Reminders view, either:
- Add due dates to reminders (they then appear on that date in Calendar), or
- Accept that no-due reminders require opening the Reminders app.

## Permissions Note
If AppleScript returns an error like "Not authorized to send Apple events to Calendar", the user needs to grant Automation permission in **System Settings > Privacy & Security > Automation**.