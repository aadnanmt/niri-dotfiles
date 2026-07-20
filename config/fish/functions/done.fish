function done
    eval $argv
    notify-send "Done" "Command already: $argv" -u low
end
