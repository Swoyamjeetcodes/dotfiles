if status is-interactive
    set -g fish_greeting
    
    # Disable starship + fastfetch in VS Code terminal
    if test "$TERM_PROGRAM" != "vscode"
        starship init fish | source
        fastfetch
    end

    # Aliases
    alias ps="sudo pacman -Ss"
    alias pi="sudo pacman -S"
    alias pr="sudo pacman -Rns"
    alias ys="paru -Ss"
    alias yi="paru -S"

    # WARP functions
    function warpup
        echo "[+] Starting warp-svc..."
        sudo systemctl start warp-svc
        echo "[+] Waiting for service to initialize..."
        sleep 2
        echo "[+] Connecting to Cloudflare WARP..."
        sudo warp-cli connect
        echo "[+] Checking status..."
        warp-cli status
    end

    function warpdown
        echo "[+] Disconnecting WARP..."
        sudo warp-cli disconnect
        warp-cli status
    end
end
