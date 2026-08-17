#!/bin/bash
if pgrep -x "fuzzel" >/dev/null; then
  pkill -x "fuzzel"
  exit 0
fi

app=$(printf "kitty\nfirefox\nnautilus\nTelegram\nthunderbird\npavucontrol\ninkscape\nmpv\nkeepassxc\nobsidian" | fuzzel --dmenu -p "Apps")
[ -n "$app" ] && "$app" &
