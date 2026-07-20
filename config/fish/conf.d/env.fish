# =============================================================================
#  PATH & ENVIRONMENT VARIABLES
# =============================================================================

# Cursor
set -gx XCURSOR_THEME Bibata-Modern-Ice
set -gx XCURSOR_SIZE 20

# Default apps
set -gx EDITOR nano
set -gx VISUAL nvim
set -gx TERMINAL kitty
set -gx QT_QPA_PLATFORM wayland keepassxc

# Manpages in color
if command -v bat > /dev/null
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

set -gx PAGER bat -p

# Fix gpg tty
set -gx GPG_TTY (tty)

# Encoding
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# JS eco

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
# bun end
