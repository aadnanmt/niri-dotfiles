#!/bin/bash
iface=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $5; exit}')
[ -z "$iface" ] && iface=$(compgen -G '/sys/class/net/*' -G '*/statistics/rx_bytes' | head -1 | sed 's|/sys/class/net/||;s|/statistics.*||')

rx=$(cat "/sys/class/net/$iface/statistics/rx_bytes")
tx=$(cat "/sys/class/net/$iface/statistics/tx_bytes")

fmt() {
  local b=$1
  if [ "$b" -ge 1073741824 ]; then
    awk "BEGIN {printf \"%.1fG\", $b/1073741824}"
  elif [ "$b" -ge 1048576 ]; then
    awk "BEGIN {printf \"%.1fM\", $b/1048576}"
  elif [ "$b" -ge 1024 ]; then
    awk "BEGIN {printf \"%.1fK\", $b/1024}"
  else
    echo "${b}B"
  fi
}

notify-send "󰒊 Net Stats ($iface)" "↓ $(fmt "$rx")  ↑ $(fmt "$tx")"
