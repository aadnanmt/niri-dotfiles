#!/bin/bash

# Toggle logic
if pgrep -x "fuzzel" >/dev/null; then
  pkill -x "fuzzel"
  exit 0
fi

# Fuzzel emoji picker; extracts data from wofi-emoji, pipes to fuzzel
EMOJI=$(sed '1,/^### DATA ###$/d' /usr/bin/wofi-emoji | fuzzel --dmenu -p "emoji" | cut -d ' ' -f 1 | tr -d '\n')
[ -n "$EMOJI" ] && wtype "$EMOJI" && wl-copy "$EMOJI"
