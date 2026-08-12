export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export BROWSER="firefox"
export MOZ_ENABLE_WAYLAND=1
export TERMINAL="kitty"
export QT_QPA_PLATFORM="wayland"
# Optional toolchains, soo.. uncomment when installed
# export PNPM_HOME="$HOME/.local/share/pnpm"
# export BUN_INSTALL="$HOME/.bun"
export CARGO_HOME="$HOME/.cargo"
export BAT_THEME="base16"
export PARU_PAGER="bat"
export PAGER="bat -p"

export PATH="$CARGO_HOME/bin:$HOME/.local/bin:$PATH"
# Same too this optional toolchain paths, uncomment with the exports above
# export PATH="$PNPM_HOME:$BUN_INSTALL/bin:$PATH"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
