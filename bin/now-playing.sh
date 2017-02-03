#! /bin/bash
song=$(osascript -e 'if application "iTunes" is running then tell application "iTunes" to "♪ " & artist of current track & " - " & name of current track & " "')
echo $song | awk -v len=40 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'



