autoload -Uz compinit
compinit
zstyle ":completion;*" menu select

autoload -Uz promptinit && promptinit
prompt elite2

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls="exa -la --git --group-directories-first"

alias e="$EDITOR"
alias p="sudo pacman"
alias s="startx"

alias ..="cd .."
alias ...="cd ../.."
alias .3+"cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
