# =============================================================================
#  FISH-ONLY ENV - shared env vars live in ~/.config/shell/env.sh (source via
#  init.fish bridg). Keep this file fish-specific to avoid double definition.
# =============================================================================

# Manpages in color
if command -v bat >/dev/null
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

# Fix gpg tty
set -gx GPG_TTY (tty)

# fnm (Node version manager, fish hook. so.. this optional, uncomment when u installed)
# if command -q fnm
#     fnm env --use-on-cd | source
# end
