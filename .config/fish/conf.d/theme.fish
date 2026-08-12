# =============================================================================
#  MY CYAN THEME
# =============================================================================

# Fish colors
set -g fish_color_command 00ffff
set -g fish_color_param 00d7d7
set -g fish_color_keyword 008080
set -g fish_color_quote 5fffff
set -g fish_color_redirection d7ffff
set -g fish_color_error ff005f
set -g fish_color_end 00afaf
set -g fish_color_comment 005f5f
set -g fish_color_match --background=008080
set -g fish_color_search_match --background=005f5f
set -g fish_color_operator 00afaf
set -g fish_color_escape 00ffff
set -g fish_color_autosuggestion 005f5f

# FZF cyan style
set -gx FZF_DEFAULT_OPTS "--color=bg+:#005f5f,bg:#0a0a0a,spinner:#00ffff,hl:#00d7d7,fg:#00ffff,header:#00ffff,info:#00afaf,pointer:#00ffff,marker:#00ffff,fg+:#ffffff,prompt:#00ffff,hl+:#00ffff"

# App themes
set -gx BAT_THEME "base16"
set -gx PARU_PAGER "bat"
