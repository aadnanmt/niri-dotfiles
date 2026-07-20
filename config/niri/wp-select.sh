#!/bin/bash
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

WPDIR="$HOME/Pictures/Wallpapers"

if pgrep -x "wofi" > /dev/null; then
    pkill -x "wofi"
    exit 0
fi

# list all wallpapers with relative path as display
WP=$(find "$WPDIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | while read f; do echo "${f#$WPDIR/}"; done | sort | wofi --dmenu -p "Wallpaper" -c ~/.config/wofi -s ~/.config/wofi/style.css)

[[ -z "$WP" ]] && exit 1

awww img "$WPDIR/$WP" --transition-type none
