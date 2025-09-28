echo -e "Config by www.github.com/egordebug\nloading..."
sleep 1
clear # simulated loading so that you can have time to read the banner
# ------------------------------------------------------------------

set_motd() {
    echo -e "Config by www.github.com/egordebug\nloading..." > $PREFIX/etc/motd
}

install_packages() {
    pkg in zsh git curl tmux fastfetch fzf -y # required packages
}

install_ohmyzsh() {
    # Устанавливаем Oh My Zsh без переключения на zsh
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Ставим плагины и тему
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
