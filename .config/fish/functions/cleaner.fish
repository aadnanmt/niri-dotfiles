function cleaner
    echo "Cleaning system..."
    sudo pacman -Scc --noconfirm
    sudo journalctl --vacuum-time=2d
    find ~/.cache /tmp -mindepth 1 -delete 2>/dev/null
    functions -q paru; and paru -Scc --noconfirm
    echo "Done."
end
