#!/usr/bin/env bash

# Toggle logic
if pgrep -x "fuzzel" > /dev/null; then
    pkill -x "fuzzel"
    exit 0
fi

# Option
shutdown='Shutdown'
reboot='Reboot'
lock='Lock'
suspend='Suspend'
hibernate='Hibernate'
logout='Logout'

# Power menu logic
selected=$(echo -e "$lock\n$suspend\n$hibernate\n$logout\n$reboot\n$shutdown" | fuzzel --dmenu --prompt "Power Menu" --width 40 --lines 6)

case $selected in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$lock")
        /usr/bin/swaylock
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$hibernate")
        systemctl hibernate
        ;;
    "$logout")
        niri msg action quit --skip-confirmation
        ;;
esac
