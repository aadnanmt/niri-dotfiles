#!/bin/bash
# Fuzzel clipboard history, type + copy selected item

# Toggle logic
if pgrep -x "fuzzel" >/dev/null; then
  pkill -x "fuzzel"
  exit 0
fi

SELECTED=$(cliphist list | fuzzel --dmenu -p "clipboard" | cliphist decode)
[ -n "$SELECTED" ] && wtype "$SELECTED" && wl-copy "$SELECTED"
