echo -e "Config by www.github.com/egordebug\nloading..."
sleep 1
clear # simulated loading so that you can have time to read the banner
# ------------------------------------------------------------------

set_motd() {
    echo -e "Config by www.github.com/egordebug\nloading..." > $PREFIX/etc/motd || sudo echo -e "Config by www.github.com/egordebug\nloading..." > /etc/motd || doas echo -e "Config by www.github.com/egordebug\nloading..." > /etc/motd || su -c "echo -e "Config by www.github.com/egordebug\nloading..." > $PREFIX/etc/motd"
}


install_packages() {
    set -euo pipefail

    PACKAGES=(git zsh tmux fzf fastfetch)

    if command -v pkg >/dev/null 2>&1; then
        pm=("pkg" "i" "-y")
        use_su=0
    elif command -v apt >/dev/null 2>&1; then
        pm=("apt" "install" "-y")
        use_su=1
    elif command -v apt-get >/dev/null 2>&1; then
        pm=("apt-get" "install" "-y")
        use_su=1
    elif command -v dnf >/dev/null 2>&1; then
        pm=("dnf" "install" "-y")
        use_su=1
    elif command -v yum >/dev/null 2>&1; then
        pm=("yum" "install" "-y")
        use_su=1
    elif command -v pacman >/dev/null 2>&1; then
        pm=("pacman" "-S" "--noconfirm")
        use_su=1
    elif command -v yay >/dev/null 2>&1; then
        pm=("yay" "-S" "--noconfirm")
        use_su=0
    elif command -v zypper >/dev/null 2>&1; then
        pm=("zypper" "install" "-y")
        use_su=1
    elif command -v apk >/dev/null 2>&1; then
        pm=("apk" "add")
        use_su=1
    elif command -v emerge >/dev/null 2>&1; then
        pm=("emerge" "--ask=n")
        use_su=1
    elif command -v rpm >/dev/null 2>&1; then
        pm=("rpm" "-i")
        use_su=1
    elif command -v brew >/dev/null 2>&1; then
        pm=("brew" "install")
        use_su=0
    elif command -v nix >/dev/null 2>&1; then
        pm=("nix" "profile" "install")
        use_su=0
    elif command -v xbps-install >/dev/null 2>&1; then
        pm=("xbps-install" "-y")
        use_su=1
    elif command -v eopkg >/dev/null 2>&1; then
        pm=("eopkg" "install" "-y")
        use_su=1
    else
        pm=()
        use_su=0
    fi

    if [ ${#pm[@]} -gt 0 ]; then
        echo "Detected package manager: ${pm[0]}"
        if [ "$use_su" -eq 1 ]; then
            su -c "\"${pm[@]}\" \"${PACKAGES[@]}\""
        else
            "${pm[@]}" "${PACKAGES[@]}"
        fi
    else
        echo "No known package manager found"
    fi
} 

install_ohmyzsh() {
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    git clone https://github.com/zsh-users/zsh-completions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
}

# ------------------------------------------------------------------

mainfuncinstallercfg() {
    # ------------------------------------------------------------------
    read -p "Update MOTD? (y/n): " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        set_motd
    else
        echo "Skipped"
    fi
    # ------------------------------------------------------------------
    read -p "Install required packages? (y/n): " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        install_packages
    else
        echo "Skipped"
    fi
    # ------------------------------------------------------------------
    read -p "Install Oh My Zsh and required modules? (y/n): " answer
    if [[ "$answer" =~ ^[Yy](es)?$ ]]; then
        install_ohmyzsh
    else
        echo "Skipped"
    fi
    # ------------------------------------------------------------------
}

mainfuncinstallercfg
bash -c "./postinstall.sh"
# end
