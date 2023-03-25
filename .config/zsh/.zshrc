HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nobeep nomatch notify
bindkey -e

# zstyle :compinstall filename '/home/severij/.config/zsh/.zshrc'
# autoload -Uz compinit; compinit

source $ZDOTDIR/zsh-functions

plugin "zsh-autosuggestions"
plugin "zsh-syntax-highlighting"
plugin "typewritten"

alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

unset -f include plugin
