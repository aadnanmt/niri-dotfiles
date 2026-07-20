function publicip --wraps curl
    curl -s https://ifconfig.me $argv
end
