#!/usr/bin/env sh
# Dynamic browser launcher; uses system default
browser=$(xdg-settings get default-web-browser 2>/dev/null)
browser="${browser%.desktop}"
command -v "$browser" >/dev/null && exec "$browser"
# Fallback: try common browsers
for b in librewolf firefox chromium google-chrome; do
  command -v "$b" >/dev/null && exec "$b"
done
