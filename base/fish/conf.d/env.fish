# =============================================================================
#  FISH-ONLY ENV - shared env vars live in ~/.config/shell/env.sh (source via
#  init.fish bridge). Keep this file fish-specific to avoid double definition.
# =============================================================================

# Manpages in color
if command -v bat >/dev/null
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end
