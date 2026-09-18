# Init fish - source shared env from env.sh (MUST be before fnm)
source ~/.config/shell/init.fish 2>/dev/null

if status is-interactive
    # Starship Prompt
    starship init fish | source

    # Remove greeting fish
    set -g fish_greeting ""
end
