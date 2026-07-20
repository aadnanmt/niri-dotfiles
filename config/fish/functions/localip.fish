function localip --wraps ip
    ip -c a $argv
end
