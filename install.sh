#!/usr/bin/env bash

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}"
echo "=========================================="
echo "  NIRI DOTFILES INSTALLER"
echo "=========================================="
echo -e "${NC}"

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Phase 1: Install Paru (AUR helper) ---
echo -e "\n${YELLOW}--- Phase 1: Paru ---${NC}"
if ! command -v paru >/dev/null; then
    echo "Installing paru..."
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru && makepkg -si --noconfirm
    cd "$REPO_DIR"
else
    echo -e "${GREEN}[OK] paru${NC}"
fi

# --- Phase 2: Install packages ---
echo -e "\n${YELLOW}--- Phase 2: Packages ---${NC}"
if [ -f "$REPO_DIR/pkglist-official.txt" ]; then
    echo "Installing official packages..."
    paru -S --needed --noconfirm - < "$REPO_DIR/pkglist-official.txt"
fi

if [ -f "$REPO_DIR/pkglist-aur.txt" ]; then
    echo "Installing AUR packages..."
    paru -S --needed --noconfirm - < "$REPO_DIR/pkglist-aur.txt"
fi

# --- Phase 3: Setup scripts ---
echo -e "\n${YELLOW}--- Phase 3: Configuration ---${NC}"
chmod +x "$REPO_DIR/setup/"*.sh
for script in "$REPO_DIR/setup"/*.sh; do
    name="$(basename "$script")"
    echo -e "\n${CYAN}Running: $name${NC}"
    bash "$script"
done

echo -e "${CYAN}"
echo "=========================================="
echo "      INSTALLATION COMPLETE!"
echo "=========================================="
echo -e "${NC}"
