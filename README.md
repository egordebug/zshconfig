# zshconfig
my zsh config, im begginer in this😢. including fzf binary search, autocomplete, autosuggestions, p10k, tmux, zsh.

# how to install?
first — install requirements 
```shell
pkg in git bash -y # you may have a different package manager
```
if you idk your whats your PM use this long command:
```shell
(command -v pkg >/dev/null 2>&1 && pm="pkg i -y") || (command -v apt >/dev/null 2>&1 && pm="apt install -y") || (command -v apt-get >/dev/null 2>&1 && pm="apt-get install -y") || (command -v dnf >/dev/null 2>&1 && pm="dnf install -y") || (command -v yum >/dev/null 2>&1 && pm="yum install -y") || (command -v pacman >/dev/null 2>&1 && pm="pacman -S --noconfirm") || (command -v yay >/dev/null 2>&1 && pm="yay -S --noconfirm") || (command -v zypper >/dev/null 2>&1 && pm="zypper install -y") || (command -v apk >/dev/null 2>&1 && pm="apk add --no-cache") || (command -v emerge >/dev/null 2>&1 && pm="emerge --ask=n") || (command -v rpm >/dev/null 2>&1 && pm="rpm -i") || (command -v brew >/dev/null 2>&1 && pm="brew install") || (command -v nix >/dev/null 2>&1 && pm="nix profile install") || (command -v xbps-install >/dev/null 2>&1 && pm="xbps-install -y") || (command -v eopkg >/dev/null 2>&1 && pm="eopkg install -y") || pm=""; [ -n "$pm" ] && su -c "$pm git" || echo "No known package manager found"
```
will help in 90% of cases

then clone repo and execute install script
```shell
git clone https://github.com/egordebug/zshconfig.git && cd zshconfig && chmod +x install.sh postinstall.sh && bash -c ./install.sh
```
## License

This project is licensed under the MIT License.  
Please include a link to the original repository: [github.com/egordebug/zshconfig](https://github.com/egordebug/zshconfig)
