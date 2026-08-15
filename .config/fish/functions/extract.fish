function extract
    if not test -f "$argv[1]"
        echo "'$argv[1]' is not a valid file"
        return 1
    end

    switch "$argv[1]"
        case '*.tar.bz2';  tar xjf "$argv[1]"
        case '*.tar.gz';   tar xzf "$argv[1]"
        case '*.tar.xz';   tar xJf "$argv[1]"
        case '*.tar.zst';  tar --zstd -xf "$argv[1]"
        case '*.bz2';      bunzip2 "$argv[1]"
        case '*.rar';      unrar x "$argv[1]"
        case '*.gz';       gunzip "$argv[1]"
        case '*.xz';       xz -d "$argv[1]"
        case '*.zst';      zstd -d "$argv[1]"
        case '*.lzma';     unlzma "$argv[1]"
        case '*.tar';      tar xf "$argv[1]"
        case '*.tbz2';     tar xjf "$argv[1]"
        case '*.tgz';      tar xzf "$argv[1]"
        case '*.zip';      unzip "$argv[1]"
        case '*.Z';        uncompress "$argv[1]"
        case '*.7z';       7z x "$argv[1]"
        case '*';          echo "'$argv[1]' cannot be extracted"; return 1
    end
end
