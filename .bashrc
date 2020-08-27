# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
PATH=$PATH:$HOME/.local/bin

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
