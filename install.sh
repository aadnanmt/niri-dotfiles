#!/usr/bin/env bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$REPO_DIR/setup/colors.sh"

# --- Parse flags ---
PROFILE="base"
for arg in "$@"; do
  case "$arg" in
  --all) PROFILE="all" ;;
  --base) PROFILE="base" ;;
  --dry-run) DRY_RUN=true ;;
  esac
done

echo -e "${MAGENTA}"
echo "=========================================="
echo "  NIRI DOTFILES INSTALLER"
echo "  Profile: $PROFILE"
$DRY_RUN && echo "  Mode: DRY RUN (no changes)"
echo "=========================================="
echo -e "${NC}"

run() {
  if $DRY_RUN; then
    echo -e "${YELLOW}[DRY] $*${NC}"
  else
    "$@"
  fi
}

# --- Phase 1: Install Paru (AUR helper) ---
echo -e "\n${YELLOW}--- Phase 1: Paru ---${NC}"
if ! command -v paru >/dev/null; then
  echo "Installing paru..."
  run sudo pacman -S --needed --noconfirm base-devel
  run git clone https://aur.archlinux.org/paru.git /tmp/paru
  (cd /tmp/paru && run makepkg -si --noconfirm)
else
  echo -e "${GREEN}[OK] paru${NC}"
fi

# --- Phase 2: Install packages ---
echo -e "\n${YELLOW}--- Phase 2: Packages ---${NC}"
if [ -f "$REPO_DIR/pkglist-base.txt" ]; then
  echo "Installing base packages..."
  run paru -S --needed --noconfirm - <"$REPO_DIR/pkglist-base.txt"
fi

if [ "$PROFILE" = "all" ]; then
  if [ -f "$REPO_DIR/pkglist-rice.txt" ]; then
    echo "Installing rice packages..."
    run paru -S --needed --noconfirm - <"$REPO_DIR/pkglist-rice.txt"
  fi
  if [ -f "$REPO_DIR/pkglist-dev.txt" ]; then
    echo "Installing dev packages..."
    run paru -S --needed --noconfirm - <"$REPO_DIR/pkglist-dev.txt"
  fi
fi

# --- Phase 3: Deploy base/ (always) ---
echo -e "\n${YELLOW}--- Phase 3: Deploy base ---${NC}"
for dir in "$REPO_DIR/base/"*/; do
  name="$(basename "$dir")"
  echo -n "base/$name → ~/.config/$name ... "
  if $DRY_RUN; then
    echo -e "${YELLOW}[DRY]${NC}"
  else
    mkdir -p "$HOME/.config/$name"
    if cp -r "$dir"* "$HOME/.config/$name/" 2>/dev/null; then
      echo -e "${GREEN}OK${NC}"
    else
      echo -e "${RED}FAIL${NC}"
    fi
  fi
done

if [ -f "$REPO_DIR/base/starship.toml" ]; then
  if $DRY_RUN; then
    echo -e "${YELLOW}[DRY] base/starship.toml → ~/.config/${NC}"
  else
    cp "$REPO_DIR/base/starship.toml" "$HOME/.config/"
    echo "Copied starship.toml"
  fi
fi

# --- Phase 4: Deploy rice/ (all only) ---
if [ "$PROFILE" = "all" ] && [ -d "$REPO_DIR/rice" ]; then
  echo -e "\n${YELLOW}--- Phase 4: Deploy rice ---${NC}"
  for dir in "$REPO_DIR/rice/"*/; do
    name="$(basename "$dir")"
    echo -n "rice/$name → ~/.config/$name ... "
    if $DRY_RUN; then
      echo -e "${YELLOW}[DRY]${NC}"
    else
      mkdir -p "$HOME/.config/$name"
      if cp -r "$dir"* "$HOME/.config/$name/" 2>/dev/null; then
        echo -e "${GREEN}OK${NC}"
      else
        echo -e "${RED}FAIL${NC}"
      fi
    fi
  done
fi

# --- Phase 5: Deploy dev/ (all only) ---
if [ "$PROFILE" = "all" ] && [ -d "$REPO_DIR/dev" ]; then
  echo -e "\n${YELLOW}--- Phase 5: Deploy dev ---${NC}"
  for dir in "$REPO_DIR/dev/"*/; do
    name="$(basename "$dir")"
    echo -n "dev/$name → ~/.config/$name ... "
    if $DRY_RUN; then
      echo -e "${YELLOW}[DRY]${NC}"
    else
      mkdir -p "$HOME/.config/$name"
      if cp -r "$dir"* "$HOME/.config/$name/" 2>/dev/null; then
        echo -e "${GREEN}OK${NC}"
      else
        echo -e "${RED}FAIL${NC}"
      fi
    fi
  done
fi

# --- Phase 6: Deploy Wallpapers ---
echo -e "\n${YELLOW}--- Phase 6: Wallpapers ---${NC}"
if [ -d "$REPO_DIR/Wallpapers" ]; then
  echo -n "Wallpapers → ~/Pictures/Wallpapers ... "
  if $DRY_RUN; then
    echo -e "${YELLOW}[DRY]${NC}"
  else
    mkdir -p "$HOME/Pictures/Wallpapers"
    if cp -r "$REPO_DIR/Wallpapers/"* "$HOME/Pictures/Wallpapers/" 2>/dev/null; then
      echo -e "${GREEN}OK${NC}"
    else
      echo -e "${RED}FAIL${NC}"
    fi
  fi
fi

# --- Phase 7: Setup scripts ---
echo -e "\n${YELLOW}--- Phase 6: Configuration ---${NC}"
if [ -d "$REPO_DIR/setup" ]; then
  chmod +x "$REPO_DIR/setup/"*.sh
  for script in "$REPO_DIR/setup"/*.sh; do
    name="$(basename "$script")"
    echo -e "\n${MAGENTA}Running: $name${NC}"
    run bash "$script"
  done
fi

echo -e "${MAGENTA}"
echo "=========================================="
$DRY_RUN && echo "      DRY RUN COMPLETE (no changes made)"
! $DRY_RUN && echo "      INSTALLATION COMPLETE!"
echo "      Profile: $PROFILE"
echo "=========================================="
echo -e "${NC}"
