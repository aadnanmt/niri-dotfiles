#!/bin/bash
aur=$(paru -Qua 2>/dev/null | wc -l | tr -d ' ')
official=$(pacman -Qu 2>/dev/null | wc -l | tr -d ' ')
total=$((aur + official))

if [ "$total" -gt 0 ]; then
    msg=""
    [ "$official" -gt 0 ] && msg="$official official"
    [ "$aur" -gt 0 ] && msg="$msg${msg:+ + }$aur AUR"
    notify-send "󰚰 Updates" "$msg packages available"
else
    notify-send "󰚰 Updates" "System up to date"
fi
