function mem --wraps free
    free -h --si $argv
end
