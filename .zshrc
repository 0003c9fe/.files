zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 1 numeric
zstyle :compinstall filename '/home/jack/.zshrc'

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

PS1='%B%F{red}%m%f%F{cyan} %1~ $%f%b '
alias ls='exa --icons'
alias grep='rg'
alias find='fd'

alias sysmaintenance='yay -Syu && yay -Rns $(yay -Qtdq)'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

eval $(thefuck --alias)

alias cdc='cd && clear'

alias c='clear'

alias pd='mpv --really-quiet $PWD &
disown && exit'

eval "$(dircolors ~/.local/share/dircolors)";

alias rmlock='sudo rm /var/lib/pacman/db.lck'

export EDITOR=nvim
alias vim=nvim

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias install="pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -r sudo pacman -S --noconfirm"

[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
