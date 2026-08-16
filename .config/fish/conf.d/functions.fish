# =============================================================================
#  FUNCTIONS
# =============================================================================

# My Cheat Sheet
function cuyy
    echo -e "--- \e[36mMEMORY CMD LINE\e[0m ---"
    echo -e "\e[34m[System]\e[0m   localip, publicip, ports, wifi, reload, r, off/reb/susp"
    echo -e "\e[34m[Pkg]\e[0m      i/in/un/up/ss/qs (pacman), pi/pr/pu/ps/pq (paru), clean, cleaner"
    echo -e "\e[34m[Dev]\e[0m      mkd, mkf, extract, venv, activate"
    echo -e "\e[34m[Edit]\e[0m     v (nvim), .v (nvim .), cf (fish), cw (waybar), cnvim, cl"
    echo -e "\e[34m[Search]\e[0m   f (fd), rg (ripgrep)"
    echo -e "\e[34m[Git]\e[0m      gs, ga/gal, gc/gac/gca, gco/gcb/gcm, gd/gds, gr/grs, gst/gstp, gp/gpl, lg"
    echo -e "\e[34m[TUI]\e[0m      y (yazi), htp (htop), pipes, cv, clock, bonsai, matrix"
    echo -e "\e[34m[Notif]\e[0m    pomo"
    echo -e ------------------------------------
end

# Yazi (CWD on quit)
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Arch cleanup
function clean
    set orphans (pacman -Qtdq)
    test -n "$orphans"; and sudo pacman -Rns $orphans; or echo "No orphans to remove."
    sudo paccache -r
    test -f (which yay); and yay -Sc --noconfirm
    test -f (which paru); and paru -Sc --noconfirm
end

# Container helper
function pmstop
    set containers (podman ps -q)
    test -n "$containers"; and podman stop $containers; or echo "No podman containers."
end

# mkdir + cd
function mkd
    mkdir -p $argv[1]; and cd $argv[1]
end

# mkdir + touch file
function mkf
    mkdir -p (dirname $argv[1]); and touch $argv[1]
end
