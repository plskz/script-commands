#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Logseq Today's JW
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📆

# Documentation:
# @raycast.author Zai Santillan
# @raycast.authorURL https://github.com/plskz

today=$(date +%Y-%m-%d)
IFS='-' read -r year month day <<< "$today"

uri="logseq://graph/.life-archive?page=${year}/${month}/${day}"
echo "$uri"
echo "Opening Logseq JW Today: $today"

open "$uri"
