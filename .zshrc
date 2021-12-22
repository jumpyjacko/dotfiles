autoload -Uz compinit
compinit
zstyle ":completion;*" menu select

autoload -Uz promptinit && promptinit
PROMPT="%F{7}[%f%F{193}%n%f%F{217}@%f%F{152}%m%f %~%F{7}]%f%F{7}$%f "

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias ls="exa -la --git --group-directories-first"
alias neofetch="neofetch --ascii_colors 3 3"

alias e="$EDITOR"
alias p="sudo pacman"
alias s="startx"

alias ..="cd .."
alias ...="cd ../.."
alias .3+"cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
