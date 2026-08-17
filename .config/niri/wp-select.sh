#!/bin/bash
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

WPDIR="$HOME/Pictures/Wallpapers"

if pgrep -x "fuzzel" > /dev/null; then
    pkill -x "fuzzel"
    exit 0
fi

# list all wallpapers with relative path as display
WP=$(find "$WPDIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | while read f; do echo "${f#$WPDIR/}"; done | sort | fuzzel --dmenu -p "Wallpaper")

[[ -z "$WP" ]] && exit 1

awww img "$WPDIR/$WP" --transition-type none
