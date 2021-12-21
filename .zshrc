autoload -Uz compinit
compinit

zstyle ":completion;*" menu select

autoload -Uz promptinit
promptinit

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls="exa -la --git --group-directories-first"

alias e="$EDITOR"
alias p="sudo pacman"

alias ..="cd .."
alias ...="cd ../.."
alias .3+"cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
