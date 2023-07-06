#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Desktop Icons
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🖥
# @raycast.packageName System

# Documentation:
# @raycast.description A script command to show and hide icons of Desktop folder
# @raycast.author Zai Santillan
# @raycast.authorURL https://github.com/plskz

-- try
--     set VisibleFiles to do shell script "defaults read com.apple.finder CreateDesktop"
-- on error
--     set VisibleFiles to "1"
-- end try

-- if VisibleFiles is "1" then
--     set NewSet to false
-- else
--     set NewSet to true
-- end if

-- do shell script "defaults write com.apple.finder CreateDesktop -bool " & NewSet
-- do shell script "killall Finder"

--

try
  set CurSet to do shell script "defaults read com.apple.finder CreateDesktop"
on error
  set CurSet to "1"
end try

if CurSet is "1" then
  set NewSet to false
else
  set NewSet to true
end if

do shell script "defaults write com.apple.finder CreateDesktop -bool " & NewSet

tell application "Finder" to quit

set inTime to current date
repeat
    -- check Finder process not exist
    tell application "System Events"
        if "Finder" is not in (get name of processes) then exit repeat
    end tell
    -- if repeat run for 10s, exit repeat
    if (current date) - inTime is greater than 10 then exit repeat
    delay 0.2
end repeat

tell application "Finder" 
  try
    activate
  end try
end tell