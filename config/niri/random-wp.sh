#!/bin/bash
CACHE="$HOME/.cache/random-wp"
ORDER="$CACHE/order"
mkdir -p "$CACHE"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

WPDIR="$HOME/Pictures/Wallpapers"

if [[ ! -s "$ORDER" ]]; then
    find "$WPDIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \) | shuf > "$ORDER"
fi

WP=$(head -1 "$ORDER")
sed -i '1d' "$ORDER"

awww img "$WP" --transition-type none
