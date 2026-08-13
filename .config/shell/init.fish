# Bridge: parse shell/env.sh => fish set -gx
if test -f "$HOME/.config/shell/env.sh"
    bash -c "source $HOME/.config/shell/env.sh && env" | while read -l line
        string match -qr '^[A-Z_]+=' $line
        and set -gx (string split -m 1 '=' -- $line)[1] (string split -m 1 '=' -- $line)[2]
    end
end

true
