# zshconfig
my zsh config, im begginer in this😢. including fzf binary search, autocomplete, autosuggestions, p10k, tmux, zsh.

# how to install?
first — install requirements 
```shell
pkg in git bash -y # you may have a different package manager
```
if you idk whats your PM use this long command:
```shell
if command -v pkg >/dev/null 2>&1; then pm="pkg install -y"; elif command -v apt >/dev/null 2>&1; then pm="apt install -y"; elif command -v apt-get >/dev/null 2>&1; then pm="apt-get install -y"; elif command -v dnf >/dev/null 2>&1; then pm="dnf install -y"; elif command -v yum >/dev/null 2>&1; then pm="yum install -y"; elif command -v pacman >/dev/null 2>&1; then pm="pacman -S --noconfirm"; elif command -v apk >/dev/null 2>&1; then pm="apk add --no-cache"; elif command -v xbps-install >/dev/null 2>&1; then pm="xbps-install -y"; elif command -v eopkg >/dev/null 2>&1; then pm="eopkg install -y"; elif command -v brew >/dev/null 2>&1; then pm="brew install"; elif command -v nix >/dev/null 2>&1; then pm="nix profile install"; else pm=""; fi; [ -n "$pm" ] && { command -v sudo >/dev/null 2>&1 && sudo sh -c "$pm git" || sh -c "$pm git"; } || echo "No known package manager found"
```
will help in 90% linux distros | os

then clone repo and execute install script
```shell
git clone https://github.com/egordebug/zshconfig.git && cd zshconfig && chmod +x install.sh postinstall.sh && bash -c ./install.sh
```
# Screenshots: (tap) [egordebug.github.io/zshconfig]
## License

This project is licensed under the MIT License.  
Please include a link to the original repository: [github.com/egordebug/zshconfig](https://github.com/egordebug/zshconfig)
