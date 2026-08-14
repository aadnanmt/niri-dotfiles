# =============================================================================
# BASH
# =============================================================================

eval "$(starship init bash)"

for f in "$HOME/.config/shell"/{env,aliases,functions}.sh; do
    [ -f "$f" ] && source "$f"
done

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
