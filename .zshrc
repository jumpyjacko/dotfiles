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

# Editor Exports
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME="Catppuccin-mocha"

# XDG Exports
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Recommended Exports from xdg-ninja
export HISTFILE="$XDG_STATE_HOME/bash/history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WINEPREFIX="$XDG_DATA_HOME/wine"
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# Changing TTY colours
if [ "$TERM" = "linux" ]; then
  echo -en "\e]P0000000"
  echo -en "\e]P8373B41"
  echo -en "\e]P1A54242"
  echo -en "\e]P9CC6666"
  echo -en "\e]P28C9440"
  echo -en "\e]PAB5BD68"
  echo -en "\e]P3DE935F"
  echo -en "\e]PBF0C674"
  echo -en "\e]P45F819D"
  echo -en "\e]PC81A2BE"
  echo -en "\e]P585678F"
  echo -en "\e]PDB294BB"
  echo -en "\e]P65E8D87"
  echo -en "\e]PE8ZBEB7"
  echo -en "\e]P7BEBEBE"
  echo -en "\e]PFFFFFFF"
  clear
fi

# Enabling ctrl+backspace
bindkey "^H" backward-delete-word

# pfetch config because i'm a degenerate who can't live without a fetch
export PF_INFO="ascii title os kernel shell pkgs palette"
export PF_COLOR=1
export PF_COL1=7
export PF_COL3=7

# Adding alias for git bare .dotfile storage
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lconfig='/usr/bin/lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Aliases for convenience
alias ls="eza -la --git --group-directories-first"
alias cat="bat --paging=never --decorations=never"
alias fm="joshuto"
alias lg="lazygit"
alias neofetch="neofetch --ascii_colors 2 2"
alias tracert="traceroute"

alias p="sudo pacman"
alias s="startx"
alias sudoe="sudo -E -s nvim"

alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Specifically made for the HP Spectre laptop because it has an OLED display (trying out haikarainen/light)
alias brightness='xrandr --output eDP1 --brightness'

# Aliases for my fun shell scripts
alias wt="~/shell_scripts/weather"
alias motd="~/shell_scripts/motd"
alias dhotkeys="~/shell_scripts/dwm_hotkeys"
