#!/usr/bin/env bash

# -----------------------------------------------------
# --- NIRI DOTFILES RESTORE SCRIPT ---
# -----------------------------------------------------

BACKUP_PARENT="$HOME/DOTFILES"
TARGET_DIR="$HOME/.config"

# shellcheck source=scripts/colors.sh
source "$(dirname "$0")/colors.sh"

echo -e "${MAGENTA}==========================================${NC}"
echo -e "${MAGENTA}   NIRI DOTFILES RESTORE INITIATED${NC}"
echo -e "${MAGENTA}==========================================${NC}"

# Check if backup directory exists
if [ ! -d "$BACKUP_PARENT" ]; then
  echo -e "${RED}Error: Backup directory $BACKUP_PARENT not found.${NC}"
  exit 1
fi

# List available backup and filter by name
BACKUPS=$(find "$BACKUP_PARENT" -maxdepth 1 -type d -name "dotfiles_backup_*" | sort -r)

if [ -z "$BACKUPS" ]; then
  echo -e "${RED}Error: No backups found in $BACKUP_PARENT.${NC}"
  exit 1
fi

# Select backup using fzf for better interactive experience
SELECTED_BACKUP=$(echo "$BACKUPS" | fzf --prompt="Select backup to restore: " --height=10 --reverse)

if [ -z "$SELECTED_BACKUP" ]; then
  echo -e "${YELLOW}Restore cancelled.${NC}"
  exit 0
fi

echo -e "Selected backup: ${MAGENTA}$(basename "$SELECTED_BACKUP")${NC}"
echo -e "${YELLOW}Warning: this will overwrite your current configuration files.${NC}"
read -rp "Do you want to proceed with the restore? (y/n): " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo -e "${YELLOW}Restore aborted.${NC}"
  exit 0
fi

# Perform restore by copy folder
for config_path in "$SELECTED_BACKUP"/*; do
  if [ -d "$config_path" ]; then
    config_name=$(basename "$config_path")
    echo -n "Restoring: $config_name... "

    # Ensure target directory exists
    mkdir -p "$TARGET_DIR"

    # Remove exist config folder before restoring
    rm -rf "${TARGET_DIR:?}/$config_name"

    if cp -r "$config_path" "$TARGET_DIR/" 2>/dev/null; then
      echo -e "${GREEN}DONE${NC}"
    else
      echo -e "${RED}FAILED${NC}"
    fi
  fi
done

echo -e "${MAGENTA}==========================================${NC}"
echo -e "   ${GREEN}RESTORE COMPLETE!${NC}"
echo -e "${MAGENTA}==========================================${NC}"
