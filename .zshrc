# zmodload zsh/zprof
autoload -Uz compinit
compinit

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
PROMPT="%F{8}[%f%F{2}%n%f%F{8}@%f%F{4}%m%f %~%F{8}\$vcs_info_msg_0_%f%F{8}]%f%F{8}$%f "

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

# Enabling ctrl+backspace
bindkey "^H" backward-delete-word

export BAT_THEME="ansi"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Aliases for convenience
alias ls="eza -la --git --group-directories-first"
alias cat="bat --paging=never --decorations=never"
alias lg="lazygit"
alias gitslog="git log --pretty=format:'%C(auto)%h %Cblue%ad %Cgreen%s%Creset' --date=iso --graph --decorate --all"

alias p="sudo pacman"
alias sunvim="sudo -E -s nvim"

alias list_packages="pacman -Qi | grep -E '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"

t() {
    local session_name="${1:-$(basename "$PWD" | tr '.' '_')}"
    tmux new-session -A -s "$session_name"
}

alias ..="cd .."

alias fv="fava ~/beancount/jackson.beancount 2>&1 | awk '!opened && match(\$0, /(https?:\\/\\/[^ ]+)/, m) { system(\"xdg-open \" m[1]); opened=1 } { print }'"

autoload -Uz add-zsh-hook
add-zsh-hook precmd load_late

load_late() {
    eval "$(atuin init zsh)"
    eval "$(zoxide init --cmd cd zsh)"
}

# zprof
# . /usr/share/nvm/init-nvm.sh
