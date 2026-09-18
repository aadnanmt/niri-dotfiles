#!/bin/bash
containers=$(podman ps --format '{{.Names}} ({{.Status}})' 2>/dev/null)
if [ -z "$containers" ]; then
    notify-send "󰡨 Podman" "No running containers"
else
    notify-send "󰡨 Podman" "$containers"
fi
