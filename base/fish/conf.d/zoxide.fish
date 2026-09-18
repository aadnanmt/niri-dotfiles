# zoxide: smart cd (jump by fragment, real paths still work)
if command -v zoxide >/dev/null
    zoxide init --cmd cd fish | source
    # i use alias 'cs' because easy touch in keyboard
    alias cs cdi # cs = interactive picker
end
