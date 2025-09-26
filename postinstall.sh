
echo -e "Config by www.github.com/egordebug\nloading..."

# ------------------------------------------------------------------

backupfunc() {
    BACKUP_DIR="$HOME/backup_egordebugtheme"
    mkdir -p "$BACKUP_DIR"

    files=(.bashrc .zshrc .tmux.conf .p10k.zsh)
    ff_config="$HOME/.config/fastfetch/config.jsonc"

    for file in "${files[@]}"; do
        SRC="$HOME/$file"
        if [ -f "$SRC" ]; then
            read -p "Create backup of $file? (y/n): " answer
            if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
                echo "Creating backup of $file..."
                cp "$SRC" "$BACKUP_DIR/$file.bak"
            else
                echo "Skipped $file"
            fi
        fi
    done

    if [ -f "$ff_config" ]; then
        read -p "Create backup of fastfetch config? (y/n): " answer
        if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
            echo "Creating backup of fastfetch config..."
            cp "$ff_config" "$BACKUP_DIR/config.jsonc.bak"
        else
            echo "Skipped fastfetch config"
        fi
    fi
}

# ------------------------------------------------------------------

deploycfgfunc() {
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    CFG_DIR="$SCRIPT_DIR/cfg"

    files=(.bashrc .zshrc .tmux.conf .p10k.zsh)
    ff_config="$HOME/.config/fastfetch/config.jsonc"

    for file in "${files[@]}"; do
        SRC="$CFG_DIR/$file"
        DEST="$HOME/$file"
        if [ -f "$SRC" ]; then
            echo "Deploying $file..."
            cp "$SRC" "$DEST"
        fi
    done

    # Fastfetch config
    SRC_FF="$CFG_DIR/.config/fastfetch/config.jsonc"
    DEST_FF="$ff_config"
    if [ -f "$SRC_FF" ]; then
        mkdir -p "$(dirname "$DEST_FF")"
        echo "Deploying fastfetch config..."
        cp "$SRC_FF" "$DEST_FF"
    fi
}

# ------------------------------------------------------------------

applycfgfunc() {
    if [ -f "$HOME/.bashrc" ]; then
        echo "Applying ~/.bashrc..."
        source "$HOME/.bashrc"
    else
        echo "~/.bashrc not found, nothing to apply."
    fi
}

# ------------------------------------------------------------------

main() {
    read -p "Create backups of config files? (y/n): " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        backupfunc
    else
        echo "Skipped backups"
    fi

    read -p "Deploy config files from cfg? (y/n): " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        deploycfgfunc
    else
        echo "Skipped deployment"
    fi

    read -p "Apply ~/.bashrc? (y/n): " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        applycfgfunc
    else
        echo "Skipped applying ~/.bashrc"
    fi
}

main

# end --------------------------------------------------------------
