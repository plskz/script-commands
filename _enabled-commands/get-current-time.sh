#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get Current Time
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description copy the current time (HH:MM)
# @raycast.author Zai Santillan
# @raycast.authorURL https://github.com/plskz

currentTime=`date +"%H:%M"`
echo -n "$currentTime, " | pbcopy
pbpaste
