# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 1 numeric
zstyle :compinstall filename '/home/jack/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

if [[ $- != *i* ]] ; then
	return
fi

#shopt -s checkwinsize

#shopt -s no_empty_cmd_completion
source /home/jack/.mpv/shellrc.sh

PS1='%B%F{red}%m%f%F{cyan} %1~ $%f%b '
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias sysmaintenance='pacaur -Syu && pacaur -Rns $(pacaur -Qtdq)'

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

autoload -Uz promptinit
promptinit

eval $(thefuck --alias)

alias cdc='cd && clear'

alias c='clear'

alias neofetch='clear && neofetch'

alias music='mpv --really-quiet $PWD &
disown && exit'

eval "$(dircolors ~/.dircolors)";

alias rmlock='sudo rm /var/lib/pacman/db.lck'

alias scim='sc-im'

export EDITOR=nvim
alias vim=nvim

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias install="pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -r sudo pacman -S --noconfirm"


