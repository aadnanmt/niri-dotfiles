#!/usr/bin/env bash

SOURCE_DIR="$HOME/.config"
BACKUP_DIR="$HOME/DOTFILES/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
CONFIG=("niri" "kitty" "fish" "waybar" "fuzzel" "dunst" "fastfetch" "lsd" "yazi" "cava" "swaylock" "gtk-3.0" "gtk-4.0" "cliphist" "peaclock" "bat" "btop" "htop" "kew" "lazygit" "mpv" "nvim" "pipewire" "shell" "systemd" "glow" "imv")
CONFIG_FILES=("starship.toml")

source "$(dirname "$0")/colors.sh"

echo -e "${MAGENTA}==========================================${NC}"
echo -e "${MAGENTA}   BACKUP INIT${NC}"
echo -e "${MAGENTA}==========================================${NC}"

mkdir -p "$BACKUP_DIR"

for config in "${CONFIG[@]}"; do
  if [ -d "$SOURCE_DIR/$config" ]; then
    echo -n "Backing up: $config... "
    if cp -r "$SOURCE_DIR/$config" "$BACKUP_DIR/" 2>/dev/null; then
      echo -e "${GREEN}DONE${NC}"
    else
      echo -e "${RED}FAILED${NC}"
    fi
  else
    echo -e "Skip: $config (${RED}Folder not found${NC})"
  fi
done

for config_file in "${CONFIG_FILES[@]}"; do
  if [ -f "$SOURCE_DIR/$config_file" ]; then
    echo -n "Backing up: $config_file... "
    if cp "$SOURCE_DIR/$config_file" "$BACKUP_DIR/" 2>/dev/null; then
      echo -e "${GREEN}DONE${NC}"
    else
      echo -e "${RED}FAILED${NC}"
    fi
  else
    echo -e "Skip: $config_file (${RED}File not found${NC})"
  fi
done

echo -e "${MAGENTA}==========================================${NC}"
echo -e "   ${GREEN}BACKUP DONE!${NC} Location: $BACKUP_DIR"
echo -e "${MAGENTA}==========================================${NC}"
