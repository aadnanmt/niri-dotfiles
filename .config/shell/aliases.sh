# =============================================================================
# SHARED ALIASES — POSIX-compatible (bash/zsh)
# =============================================================================
# Fish uses conf.d/abbr.fish + conf.d/aliases.fish instead.

# Safety
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# Navigation & files
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
# alias tree='tree -I "node_modules|.git|target|.next|dist|build|.venv|__pycache__|*.egg-info"'  # optional,uncomment when tree installed
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'
alias hom='cd ~'
alias x='exit'
alias c='clear'
alias r='reset'

# Package Management (PACMAN)
alias i='sudo pacman -S'
alias in='sudo pacman -S'
alias un='sudo pacman -Rns'
alias up='sudo pacman -Syu'
alias ss='pacman -Ss'
alias qs='pacman -Qs'

# Paru
alias p='paru'
alias pi='paru -S'
alias pr='paru -Rns'
alias pu='paru -Syu'
alias ps='paru -Ss'
alias pq='paru -Qs'

# Git
alias gs='git status -sb'
alias ga='git add'
alias gal='git add .'
alias gc='git commit -m'
alias gac='git add . && git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gp='git push'
alias gpl='git pull'
alias gpf='git push --force-with-lease'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout main'
alias gsw='git switch'
alias gsm='git switch main'
alias gd='git diff'
alias gds='git diff --staged'
alias gr='git restore'
alias grs='git restore --staged'
alias glo='git log --graph --oneline --decorate --all'
alias gundo='git reset --soft HEAD~1'
alias gnuke='git reset --hard HEAD && git clean -fdx'
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

# Generate Cheatsheet
alias cheatgen='~/.config/shell/gen-cheatsheet.sh'

# Systemd
alias off='sudo shutdown now'
alias reb='sudo reboot'
alias susp='systemctl suspend'
alias se='sudo systemctl enable --now'
alias sd='sudo systemctl disable --now'
alias sst='sudo systemctl start'
alias sx='sudo systemctl stop'
alias sr='sudo systemctl restart'
alias st='systemctl status'
alias sl='journalctl -u'

# JS Dev Stack (optional, uncomment when installed)
# alias b='bun'
# alias bi='bun install'
# alias br='bun run'
# alias bx='bun x'
# alias ba='bun add'
# alias pn='pnpm'
# alias pni='pnpm install'
# alias pnr='pnpm run'
# alias pnx='pnpm dlx'
# alias pna='pnpm add'

# Containers
alias pm='podman'
alias pmc='podman-compose'
alias pml='podman logs -f'
alias pmps='podman ps'
alias pmx='podman exec -it'
alias pmi='podman images'
alias pmrm='podman rm'
alias pmpr='podman pull'

# Modern Tools
alias f='fd'
alias v='nvim'
alias .v='nvim .'

# TUI apps
alias lg='lazygit'
# alias lkd='lazydocker'  # optional, uncomment when lazydocker installed
alias cv='cava'
alias matrix='neo-matrix -D -a -s 20 -c cyan'
alias clock='peaclock --config-dir ~/.config/peaclock'
alias bonsai='cbonsai -l i -t 0.5'
alias ff='reset && fastfetch'

# System & network
# alias df='duf'  # optional, uncomment when duf installed
alias mem='free -h --si'
alias localip='ip -c a'
alias ports='sudo ss -tulanp'
alias wifi='nmcli device wifi list'
alias pingg='ping -c 5 google.com'
alias header='curl -I'

# Config shortcuts
alias cw='nvim ~/.config/waybar/config.jsonc'
alias cl='nvim ~/.config/lazygit/config.yml'

# Python
alias py='python3'
alias venv='python3 -m venv .venv'

# Pipe alias
alias pipes='pipes.sh -b -p 1 -r 120 -c 6 -c 4 -t 1 -f 30'
