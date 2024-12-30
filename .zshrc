# zmodload zsh/zprof

# Enabling tab-autocomplete
# autoload -Uz compinit && compinit
# zstyle ":completion;*" menu select

# Enabling version control information
autoload -Uz vcs_info
precmd_vcs_info() {
    if [[ -d .git || $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
        vcs_info
    else
        vcs_info_msg_0_=''
    fi
}
precmd_functions+=( precmd_vcs_info )

# Formats vcs_info message
zstyle ':vcs_info:git:*' formats ' %F{1} %F{2}%b'

# Enabling and setting custom prompt (thanks zsh prompt generator)
# autoload -Uz promptinit && promptinit
setopt prompt_subst
PROMPT="%F{8}[%f%F{2}%n%f%F{5}@%f%F{4}%m%f %~%F{8}\$vcs_info_msg_0_%f%F{8}]%f%F{8}$%f "
RPROMPT=$'%F{8}[%f%?%F{8}] %{\e[3m%}%*%{\e[0m%}%f'

# Editor Exports
export EDITOR=nvim
export VISUAL=nvim

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
# compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

export QT_QPA_PLATFORMTHEME=qt5ct
export _JAVA_AWT_WM_NONREPARENTING=1

# Fcitx5 Exports
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Enabling ctrl+backspace
bindkey "^H" backward-delete-word

# Changing tty colours
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0000000
  \e]P1bf616a
  \e]P2a3be8c
  \e]P3ebcb8b
  \e]P48fa1b3
  \e]P5b48ead
  \e]P696b5b4
  \e]P7c0c5ce
  \e]P865737e
  \e]P9bf616a
  \e]PAa3be8c
  \e]PBebcb8b
  \e]PC8fa1b3
  \e]PDb48ead
  \e]PE96b5b4
  \e]PFeff1f5
  "
  # Get rid of artifacts
  clear
fi

# pfetch config because i'm a degenerate who can't live without a fetch
export PF_INFO="ascii title os kernel shell pkgs palette"
export PF_COLOR=1
export PF_COL1=7
export PF_COL3=7

export BAT_THEME="ansi"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Aliases for convenience
alias ls="eza -la --git --group-directories-first"
alias cat="bat --paging=never --decorations=never"
alias lg="lazygit"
serve_alias() {
  firefox http://localhost:8080 & disown
  miniserve --index index.html --verbose --port 8080
}
alias serve="serve_alias"
alias gitslog="git log --pretty=format:'%C(auto)%h %Cblue%ad %Cgreen%s%Creset' --date=iso --graph --decorate --all"

alias p="sudo pacman"
alias s="startx"
alias sr="exec river"
alias e="nvim"
alias sudoe="sudo -E -s nvim"

alias t="tmux"
alias tn="tmux new-session -A -s"
alias tk="tmux kill-session -t"
alias tl="tmux list-sessions"

alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# Xorg brightness control
alias brightness='xrandr --output eDP1 --brightness'

# Aliases for my shell scripts
alias wt="~/shell_scripts/weather"
alias motd="~/shell_scripts/motd"
alias change_volume="~/shell_scripts/change_volume"

eval "$(atuin init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# zprof
