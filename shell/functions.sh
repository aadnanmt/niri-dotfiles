# =============================================================================
# SHARED FUNCTIONS — POSIX-compatible (bash/zsh/fish via compat)
# =============================================================================
# Fish versions are in fish/functions/ — keep both in sync.

# mkdir + cd
mkd() { mkdir -p "$1" && cd "$1"; }

# mkdir + touch
mkf() { mkdir -p "$(dirname "$1")" && touch "$1"; }

# Universal extract
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.rar)     unrar x "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.tbz2)    tar xjf "$1" ;;
            *.tgz)     tar xzf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1" ;;
            *)         echo "'$1' cannot be extracted" ;;
    esac
  else
        echo "'$1' is not a valid file"
  fi
}

# Arch cleanup
clean() {
    orphans=$(pacman -Qtdq)
    [ -n "$orphans" ] && sudo pacman -Rns $orphans || echo "No orphans to remove."
    command -v paru > /dev/null && paru -Sc --noconfirm
}
