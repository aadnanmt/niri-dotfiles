# shellcheck shell=bash
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Optional, only if you use the systemd user ssh-agent service (arch wiki pattern).
# SSH_AUTH_SOCK from ssh-agent.service; shell never spawn ssh-agent :>
# export SSH_AUTH_SOCK="${SSH_AUTH_SOCK:-$XDG_RUNTIME_DIR/ssh-agent.socket}"

# Dynamic browser via xdg default, fallback to common browsers
if command -v xdg-settings > /dev/null 2>&1; then
  BROWSER="$(xdg-settings get default-web-browser 2> /dev/null | sed 's/\.desktop$//')"
  export BROWSER
fi
export BROWSER="${BROWSER:-librewolf}"
# fallback; keep in sync with niri/scripts/open-browser.sh
if ! command -v "$BROWSER" > /dev/null 2>&1; then
  for b in librewolf firefox chromium google-chrome; do
    command -v "$b" > /dev/null 2>&1 && BROWSER="$b" && break
  done
fi
export BROWSER
export MOZ_ENABLE_WAYLAND=1
export TERMINAL="kitty"
export QT_QPA_PLATFORM="wayland"
# Dev toolchain (auto-detect, only if installed)
command -v cargo > /dev/null 2>&1 && export CARGO_HOME="$HOME/.cargo"
command -v pnpm > /dev/null 2>&1 && export PNPM_HOME="$HOME/.local/share/pnpm"
export PARU_PAGER="bat"
export PAGER="bat -p"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# GitHub Dark Default palette (shared: fish/bash/zsh)
export FZF_DEFAULT_OPTS="--color=bg+:#161b22,bg:#050505,spinner:#58a6ff,hl:#f85149,fg:#c9d1d9,header:#3fb950,info:#58a6ff,pointer:#58a6ff,marker:#58a6ff,fg+:#f0f6fc,prompt:#58a6ff,hl+:#f85149"

# PATH: prepend toolchain only if missing (bridge re-source must not dup)
path_prepend() {
  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$1:$PATH" ;;
  esac
}
[ -n "$CARGO_HOME" ] && path_prepend "$CARGO_HOME/bin"
[ -n "$PNPM_HOME" ] && path_prepend "$PNPM_HOME" && path_prepend "$PNPM_HOME/bin"
path_prepend "$HOME/.local/bin"
export PATH
unset -f path_prepend

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GPG_TTY
# last line must exit 0: non-tty (fish -c/scripts) would kill init.fish's `source && env`
GPG_TTY=$(tty) || GPG_TTY=""
