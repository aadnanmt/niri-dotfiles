function rinit --description 'Setup local keypair for rage encryption'
    set -l key_dir "$HOME/.config/age"
    set -l priv_key "$key_dir/secret.key"
    set -l pub_key "$key_dir/public.key"

    mkdir -p $key_dir

    if test -f $priv_key
        echo (set_color yellow)"[-] Now, secret key in $priv_key, bray!"(set_color normal)
        return 0
    end

    echo "[+] Create new keypair using rage.."
    rage-keygen -o $priv_key
    rage-keygen -y $priv_key >$pub_key

    chmod 700 $key_dir
    chmod 600 $priv_key $pub_key

    echo (set_color green)"[+] Setup success! your public key: "(cat $pub_key)(set_color normal)
end
