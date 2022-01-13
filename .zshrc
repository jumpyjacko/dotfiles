# Enabling tab-autocomplete
autoload -Uz compinit && compinit
zstyle ":completion;*" menu select

# Enabling version control information
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

# Formats vcs_info message
zstyle ':vcs_info:git:*' formats ' %f%F{217}שׂ %f%F{193}%b'

# Enabling and setting custom prompt (thanks zsh prompt generator)
autoload -Uz promptinit && promptinit
setopt prompt_subst
PROMPT="%F{7}[%f%F{193}%n%f%F{217}@%f%F{152}%m%f %~%F{7}\$vcs_info_msg_0_%f%F{7}]%f%F{7}$%f "

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
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Specifically made for the HP Spectre laptop because it has an OLED display
alias brightness='xrandr --output eDP1 --brightness'

# Aliases for my fun shell scripts
alias wt="./shell_scripts/weather"
alias motd="./shell_scripts/motd"
