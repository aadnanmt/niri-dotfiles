#!/usr/bin/env bash

source "$(dirname "$0")/colors.sh"

echo -e "${MAGENTA}==========================================${NC}"
echo -e "${MAGENTA}   SHELL SELECTION${NC}"
echo -e "${MAGENTA}==========================================${NC}"

SHELLS=("fish" "zsh" "bash")

echo -e "Available option:"
for i in "${!SHELLS[@]}"; do
  echo -e "$((i + 1)). ${SHELLS[$i]}"
done

echo -e "${MAGENTA}==========================================${NC}"
read -p "Enter shell name or number: " choice

SELECT_SHELL=""
if [[ "$choice" =~ ^[0-3]+$ ]] && [ "$choice" -gt 0 ] && [ "$choice" -le "${#SHELLS[@]}" ]; then
  SELECT_SHELL="${SHELLS[$((choice - 1))]}"
else
  SELECT_SHELL="$choice"
fi

SHELL_PATH=$(command -v "$SELECT_SHELL")

if [ -z "$SHELL_PATH" ]; then
  echo -e "${RED}Error: Shell '$SELECT_SHELL' is not installed or not in PATH.${NC}"
  exit 1
fi

echo -e "Target Shell: ${GREEN}$SELECT_SHELL${NC}"
echo -e "Binary Path: ${MAGENTA}$SHELL_PATH${NC}"

echo -e "\n${YELLOW}Attempting to change default shell...${NC}"

if command -v chsh >/dev/null; then
  if chsh -s "$SHELL_PATH"; then
    echo -e "${GREEN}Success: Default shell updated to $SELECT_SHELL.${NC}"
  else
    echo -e "${RED}Error: Failed to change shell. Manual action may be required.${NC}"
  fi
else
  echo -e "${RED}Error: 'chsh' command not found${NC}"
fi

echo -e "${MAGENTA}==========================================${NC}"
read -p "Do you want to switch to $SELECT_SHELL now? (y/n): " exec_now
if [[ "$exec_now" =~ ^[Yy]$ ]]; then
  exec "$SHELL_PATH"
fi
