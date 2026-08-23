#!/usr/bin/env bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$REPO_DIR/setup/colors.sh"

echo -e "${MAGENTA}"
echo "=========================================="
echo "  NIRI DOTFILES INSTALLER"
echo "=========================================="
echo -e "${NC}"

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Phase 1: Install Paru (AUR helper) ---
echo -e "\n${YELLOW}--- Phase 1: Paru ---${NC}"
if ! command -v paru >/dev/null; then
	echo "Installing paru..."
	sudo pacman -S --needed --noconfirm base-devel
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
	paru -S --needed --noconfirm - <"$REPO_DIR/pkglist-official.txt"
fi

if [ -f "$REPO_DIR/pkglist-aur.txt" ]; then
	echo "Installing AUR packages..."
	paru -S --needed --noconfirm - <"$REPO_DIR/pkglist-aur.txt"
fi

# --- Phase 3: Setup scripts ---
echo -e "\n${YELLOW}--- Phase 3: Configuration ---${NC}"
if [ -d "$REPO_DIR/setup" ]; then
	chmod +x "$REPO_DIR/setup/"*.sh
	for script in "$REPO_DIR/setup"/*.sh; do
		name="$(basename "$script")"
		echo -e "\n${MAGENTA}Running: $name${NC}"
		bash "$script"
	done
fi

echo -e "${MAGENTA}"
echo "=========================================="
echo "      INSTALLATION COMPLETE!"
echo "=========================================="
echo -e "${NC}"
