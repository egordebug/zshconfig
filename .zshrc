if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"


fzf_search_cmd() {
  local cmd full selected
  dirs=(/usr/bin /sbin /bin /data/data/com.termux/files/usr/bin)
  full=($(find "${dirs[@]}" -maxdepth 1 -type f -executable 2>/dev/null | sort -u))
  selected=$(printf "%s\n" "${full[@]##*/}" | fzf --height 40% --reverse --border \
        --prompt="Command: " \
        --info=inline \
        --preview 'man {} 2>/dev/null | col -b | head -n 20' 
        --preview-window=right:40%)
  [[ -n "$selected" ]] && {
    for f in "${full[@]}"; do
      [[ "${f##*/}" == "$selected" ]] && echo "$f" && return
    done
  }
}

if [[ -n "$ZSH_VERSION" && $- == *i* ]]; then
  fzf_search_zle() {
    local sel
    sel=$(fzf_search_cmd) || return
    LBUFFER+="$sel"
  }
  zle -N fzf_search_zle
  bindkey '^f' fzf_search_zle
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

source $ZSH/oh-my-zsh.sh

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  history
  fzf
  zsh-completions
)

# export RISH_APPLICATION_ID=com.termux
# ^ only for androids, using shizuku

alias tnw='tmux new-window'
alias tlw='tmux list-windows'
alias tsw='tmux select-window -t'
alias trw='tmux rename-window'
alias tkw='tmux kill-window -t'

alias tspv='tmux split-window -v'
alias tsph='tmux split-window -h'
alias tlp='tmux list-panes'
alias tsp='tmux select-pane -t'
alias tkp='tmux kill-pane -t'
alias tswap='tmux swap-pane -t'
alias txka='tmux kill-pane'
alias clear='clear && echo'
alias fast='fastfetch --logo small'

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && [[ "$ZSH_EVAL_CONTEXT" == *:interactive:* ]]; then
    tmux new -A -s main
    clear
fi

tmux

clear

return 0
