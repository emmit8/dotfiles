#! /bin/bash
osascript -e 'tell application "iTunes" to if player state is playing then "♪ " & artist of current track & " - " & name of current track & " "'


