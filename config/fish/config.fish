if status is-interactive
    # Starship Prompt
    starship init fish | source
    
    # Remove greeting fish
    set -g fish_greeting ""
end

# Init fish
source ~/.config/shell/init.fish 2>/dev/null
