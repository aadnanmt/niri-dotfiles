function ports --wraps 'sudo ss'
    sudo ss -tulanp $argv
end
