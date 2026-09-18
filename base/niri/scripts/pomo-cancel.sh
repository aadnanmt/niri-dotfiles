#!/bin/bash
PIDFILE="/tmp/pomo.pid"
if [ -f "$PIDFILE" ]; then
  kill "$(cat "$PIDFILE")" 2>/dev/null
  rm -f "$PIDFILE"
  notify-send " 󰄉 Pomodoro" "Cancelled"
else
  notify-send " 󰄉 Pomodoro" "Not running"
fi
