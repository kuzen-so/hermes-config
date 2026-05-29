-- AppleScript: Create recurring weekly workout events in Apple Calendar
-- Usage: osascript /Users/kuzen/.hermes/skills/user/lifestyle-protocol/references/apple-calendar-workout-events.scpt
--
-- IMPORTANT: Check calendar name first. The user's calendar is "Hermes", not "Home".
-- Verify with: osascript -e 'tell app "Calendar" to name of every calendar'
--
-- iCloud vs Local pitfall:
--   - Events created via AppleScript default to the LOCAL calendar account
--   - If user needs events on iPhone, they must be in an iCloud calendar
--   - Check: Calendar.app → Preferences → Accounts → iCloud must be enabled
--   - If no iCloud calendar exists, user must create one manually in Calendar.app
--     (File → New Calendar → select iCloud account)
--   - Moving events from local to iCloud after creation is unreliable via AppleScript
--   - Best practice: create events directly in the correct calendar from the start

tell application "Calendar"
    tell calendar "Hermes"
        -- Calculate next Monday
        set today to current date
        set weekdayNum to weekday of today as integer
        set daysUntilMon to (9 - weekdayNum) mod 7
        if daysUntilMon = 0 then set daysUntilMon to 7
        set nextMon to today + daysUntilMon * days
        set time of nextMon to 20 * hours
        
        -- Monday: Upper Push
        set monEvent to make new event with properties {summary:"💪 上肢推训练", start date:nextMon, end date:nextMon + 45 * minutes, description:"哑铃卧推 4×12
哑铃肩推 4×12
俯卧撑 3×力竭
三头臂屈伸 3×15
平板支撑 3×60秒", allday event:false}
        set monEvent's recurrence to "FREQ=WEEKLY;BYDAY=MO"
        make new display alarm at end of display alarms of monEvent with properties {trigger interval:-15}
        
        -- Wednesday: Lower Body
        set nextWed to nextMon + 2 * days
        set wedEvent to make new event with properties {summary:"🦵 下肢训练", start date:nextWed, end date:nextWed + 45 * minutes, description:"哑铃深蹲 4×15
哑铃硬拉 4×12
哑铃弓步蹲 3×12/腿
臀桥 3×15
小腿提踵 3×20", allday event:false}
        set wedEvent's recurrence to "FREQ=WEEKLY;BYDAY=WE"
        make new display alarm at end of display alarms of wedEvent with properties {trigger interval:-15}
        
        -- Friday: Upper Pull + Core
        set nextFri to nextMon + 4 * days
        set friEvent to make new event with properties {summary:"🎯 上肢拉+核心", start date:nextFri, end date:nextFri + 45 * minutes, description:"哑铃划船 4×12/侧
哑铃弯举 3×12
哑铃侧平举 3×15
卷腹 3×20
俄罗斯转体 3×20", allday event:false}
        set friEvent's recurrence to "FREQ=WEEKLY;BYDAY=FR"
        make new display alarm at end of display alarms of friEvent with properties {trigger interval:-15}
    end tell
end tell
