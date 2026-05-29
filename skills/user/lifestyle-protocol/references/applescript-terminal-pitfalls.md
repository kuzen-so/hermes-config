# AppleScript Terminal Execution Pitfalls

## Problem

Running AppleScript directly in terminal with `osascript -e '...'` frequently fails due to:
- Single quotes inside the script conflicting with shell quoting
- Newlines being interpreted by bash instead of AppleScript
- Special characters (`&`, `|`, `$`, backticks) being shell-expanded

## Symptoms

```
syntax error: "脚本的结尾"不能跟在"标识符"之后 (-2740)
/bin/bash: eval: line 48: syntax error near unexpected token `('
make: *** No rule to make target `new'. Stop.
```

## Solution

**Always write AppleScript to a `.scpt` file first, then execute:**

```bash
# Write to file
write_file(path="/tmp/script.scpt", content="...")

# Execute
osascript /tmp/script.scpt
```

## Additional Rules

1. **Never assume calendar name is "Home"**. Always check first:
   ```bash
   osascript -e 'tell app "Calendar" to name of every calendar'
   ```

2. **Calendar account type matters**. Events created via AppleScript land in the LOCAL account by default. If user needs sync to iPhone, must use an iCloud calendar. Check Calendar.app → Preferences → Accounts.

3. **Recurrence strings**: Use iCal format (`FREQ=WEEKLY;BYDAY=MO`). Test by inspecting created events in Calendar.app.

4. **Alarms**: `display alarm` with `trigger interval:-15` for 15-min reminder. Must be attached to event object.

## Reference

- Full working example: `references/apple-calendar-workout-events.scpt`
