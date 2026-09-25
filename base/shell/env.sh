# shellcheck shell=bash
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Optional, only if you use the systemd user ssh-agent service (arch wiki pattern).
# SSH_AUTH_SOCK from ssh-agent.service; shell never spawn ssh-agent :>
# export SSH_AUTH_SOCK="${SSH_AUTH_SOCK:-$XDG_RUNTIME_DIR/ssh-agent.socket}"
export BROWSER="firefox"
export MOZ_ENABLE_WAYLAND=1
export TERMINAL="kitty"
export QT_QPA_PLATFORM="wayland"
# Optional toolchains, soo.. uncomment when installed
# export PNPM_HOME="$HOME/.local/share/pnpm"
# export BUN_INSTALL="$HOME/.bun"
export CARGO_HOME="$HOME/.cargo"
export PARU_PAGER="bat"
export PAGER="bat -p"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# GitHub Dark Default palette (shared: fish/bash/zsh)
export FZF_DEFAULT_OPTS="--color=bg+:#161b22,bg:#050505,spinner:#58a6ff,hl:#f85149,fg:#c9d1d9,header:#3fb950,info:#58a6ff,pointer:#58a6ff,marker:#58a6ff,fg+:#f0f6fc,prompt:#58a6ff,hl+:#f85149"

export PATH="$CARGO_HOME/bin:$HOME/.local/bin:$PATH"
# Same too this optional toolchain paths, uncomment with the exports above
# export PATH="$PNPM_HOME:$BUN_INSTALL/bin:$PATH"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export GPG_TTY
# last line must exit 0: non-tty (fish -c/scripts) would kill init.fish's `source && env`
GPG_TTY=$(tty) || GPG_TTY=""
