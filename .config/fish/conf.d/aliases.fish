# =============================================================================
#  ALIASES
# =============================================================================

# Safety
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# Navigation & files
alias ls='lsd --ignore-glob="node_modules" --ignore-glob=".git" --ignore-glob="target" --ignore-glob=".next" --ignore-glob="dist" --ignore-glob="build" --ignore-glob=".venv" --ignore-glob="__pycache__" --ignore-glob="egg-info"'
alias ll='lsd -l --ignore-glob="node_modules" --ignore-glob=".git" --ignore-glob="target" --ignore-glob=".next" --ignore-glob="dist" --ignore-glob="build" --ignore-glob=".venv" --ignore-glob="__pycache__" --ignore-glob="egg-info"'
alias la='lsd -a --ignore-glob="node_modules" --ignore-glob=".git" --ignore-glob="target" --ignore-glob=".next" --ignore-glob="dist" --ignore-glob="build" --ignore-glob=".venv" --ignore-glob="__pycache__" --ignore-glob="egg-info"'
alias lla='lsd -la --ignore-glob="node_modules" --ignore-glob=".git" --ignore-glob="target" --ignore-glob=".next" --ignore-glob="dist" --ignore-glob="build" --ignore-glob=".venv" --ignore-glob="__pycache__" --ignore-glob="egg-info"'
alias lsa='lsd -la'
alias tree='lsd --tree --ignore-glob="node_modules" --ignore-glob="dist" --ignore-glob=".git" --ignore-glob="target" --ignore-glob=".next" --ignore-glob="build" --ignore-glob=".venv" --ignore-glob="__pycache__" --ignore-glob="egg-info"'

if command -v bat > /dev/null
    alias cat='bat'
    alias catp='bat -pp'
else
    alias cat='command cat'
    alias catp='command cat'
end

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'
alias hom='cd ~'
alias x='exit'
alias c='clear'
alias r='reset'
alias reload='source ~/.config/fish/config.fish && echo "Shell reloaded, Cuyy!"'

# TUI apps rice
alias lg='lazygit'
# alias lkd='lazydocker'  # optional, uncomment when lazydocker installed
alias cv='cava'
alias pipes='pipes.sh -b -p 1 -r 120 -c 4 -c 5 -t 1 -f 30'
alias clock='peaclock --config-dir ~/.config/peaclock'
alias bonsai='cbonsai -l i -t 0.5'
alias matrix='neo-matrix -D -a -s 20 -c blue'
alias htp='htop'

# System & network
# alias df='duf'  # optional,  uncomment when duf installed
alias mem='free -h --si'
alias localip='ip -c a'                      
alias publicip='curl -s https://ifconfig.me'
alias ports='sudo ss -tulanp'
alias wifi='nmcli device wifi list'
alias pingg='ping -c 5 google.com'       
alias header='curl -I'

# Config shortcuts
alias cf='nvim ~/.config/fish/config.fish'
alias cw='nvim ~/.config/waybar/config.jsonc'
alias cnvim='cd ~/.config/nvim/ && nvim .'
alias cl='nvim ~/.config/lazygit/config.yml'

# Python
alias py='python3'
alias venv='python3 -m venv .venv'
alias activate='source .venv/bin/activate.fish'
