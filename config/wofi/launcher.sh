#!/bin/bash
if pgrep -x "wofi" > /dev/null; then
    pkill -x "wofi"
    exit 0
fi

app=$(printf "kitty\nfirefox\npavucontrol\nvirt-manager\nbtop\nnvim\nkeepassxc\nobsidian" | wofi --dmenu -p "Apps")
[ -n "$app" ] && "$app" &
