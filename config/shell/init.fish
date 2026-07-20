# =============================================================================
# FISH BRIDGE — loads shared POSIX env/aliases to fish
# =============================================================================
# Only source if files exist

# Load shared env vars
if test -f "$HOME/.config/shell/env.sh"
    bash -c "source $HOME/.config/shell/env.sh && env" | while read line
        set -gx (string split -m 1 '=' -- $line)[1] (string split -m 1 '=' -- $line)[2]
    end
end

# Load shared aliases - fish uses abbr/alias in conf.d, not this
# This file mainly exists as docs that env/aliases are shared
