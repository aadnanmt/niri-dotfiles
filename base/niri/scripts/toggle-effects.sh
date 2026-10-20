#!/usr/bin/env bash
set -euo pipefail

DIR="$HOME/.config/niri/modules"
LINK="$DIR/effects.kdl"
DUNST="$HOME/.config/dunst/dunstrc"
FUZZEL="$HOME/.config/fuzzel/fuzzel.ini"
KITTY="$HOME/.config/kitty/kitty.conf"

current=$(readlink "$LINK")

if [[ "$current" == "effects-blur.kdl" ]]; then
  ln -sf effects-solid.kdl "$LINK"
  mode="solid"
  sed -i 's/corner_radius = .*/corner_radius = 0/' "$DUNST"
  sed -i 's/^tab_powerline_style .*/tab_powerline_style slanted/' "$KITTY"
  sed -i 's/transparency = .*/transparency = 0/' "$DUNST"
  sed -i 's/background = "#050505[0-9a-f][0-9a-f]"/background = "#050505ff"/' "$FUZZEL"
  sed -i 's/radius = .*/radius = 0/' "$FUZZEL"
else
  ln -sf effects-blur.kdl "$LINK"
  mode="blur"
  sed -i 's/corner_radius = .*/corner_radius = 12/' "$DUNST"
  sed -i 's/^tab_powerline_style .*/tab_powerline_style round/' "$KITTY"
  sed -i 's/transparency = .*/transparency = 80/' "$DUNST"
  sed -i 's/background = "#050505ff"/background = "#050505cc"/' "$FUZZEL"
  sed -i 's/radius = .*/radius = 12/' "$FUZZEL"
fi

niri msg action load-config-file
killall dunst 2>/dev/null && dunst &>/dev/null &
kitty @ load-config 2>/dev/null || pkill -USR1 kitty 2>/dev/null
echo "mode: $mode"
