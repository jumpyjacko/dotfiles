# Enabling tab-autocomplete
autoload -Uz compinit && compinit
zstyle ":completion;*" menu select

# Enabling and setting custom prompt (thanks zsh prompt generator)
autoload -Uz promptinit && promptinit
PROMPT="%F{7}[%f%F{193}%n%f%F{217}@%f%F{152}%m%f %~%F{7}]%f%F{7}$%f "

# Adding fish-like auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Adding alias for git bare .dotfile storage
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Aliases for convenience
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

# Aliases for fun
alias almond="python -m ~/Almonds/almonds.main
