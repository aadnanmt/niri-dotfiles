# =============================================================================
#  FUNCTIONS
# =============================================================================

# My Cheat Sheet
function cuyy
    echo -e "--- \e[36mMEMORY CMD LINE\e[0m ---"
    echo -e "\e[34m[System]\e[0m   localip, publicip, ports, wifi, reload, off/reb/susp"
    echo -e "\e[34m[Pkg]\e[0m      i/in (pacman), pi/pr/pu (paru), ss (search), clean"
    echo -e "\e[34m[Dev]\e[0m      mkd, mkf, extract, venv, activate, uv/uvs"
    echo -e "\e[34m[Edit]\e[0m     v (nvim), .v (nvim .), cf (fish), cw (waybar), cnvim, cl"
    echo -e "\e[34m[Search]\e[0m   f (fd), rg (ripgrep)"
    echo -e "\e[34m[Git]\e[0m      gs, ga, gc, gco, gst/gstp/gstl, gp/gpl, lg"
    echo -e "\e[34m[Stack]\e[0m    b/bi/br (bun), pn/pni/pnr (pnpm), pm/pmc/pml/pmx"
    echo -e "\e[34m[Secrets]\e[0m  xage, lock, unlk, decf, cloud-push/pull, vk"
    echo -e "\e[34m[Notif]\e[0m    pomo, remind <min> <msg>, batmon"
    echo -e "\e[34m[TUI]\e[0m      y (yazi), lg/top/lkd, pipes, cv, matrix"
    echo -e "------------------------------------"
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

# Universal extract
function extract
    if test -f "$argv[1]"
        switch "$argv[1]"
            case '*.tar.bz2'; tar xjf "$argv[1]"
            case '*.tar.gz';  tar xzf "$argv[1]"
            case '*.bz2';     bunzip2 "$argv[1]"
            case '*.rar';     unrar x "$argv[1]"
            case '*.gz';      gunzip "$argv[1]"
            case '*.tar';     tar xf "$argv[1]"
            case '*.tbz2';    tar xjf "$argv[1]"
            case '*.tgz';     tar xzf "$argv[1]"
            case '*.zip';     unzip "$argv[1]"
            case '*.Z';       uncompress "$argv[1]"
            case '*.7z';      7z x "$argv[1]"
            case '*';         echo "'$argv[1]' cannot be extracted"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# Arch cleanup
function clean
    set orphans (pacman -Qtdq)
    test -n "$orphans"; and sudo pacman -Rns $orphans; or echo "No orphans to remove."
    test -f (which yay); and yay -Sc --noconfirm
    test -f (which paru); and paru -Sc --noconfirm
end

# Container helpers
function dkstop
    set containers (docker ps -q)
    test -n "$containers"; and docker stop $containers; or echo "No docker containers."
end

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

function serve-docs
    cd $HOME/docs/python-fastapi
    python -m http.server 8080 >/dev/null 2>&1 &
    set PID (jobs -p)
    sleep 0.5
    w3m http://localhost:8080
    kill $PID
end
