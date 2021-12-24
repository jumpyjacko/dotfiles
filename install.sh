#!/bin/bash

read -sp 'Sudoers Password (To reduce the amount of inputs to install): ' passvar

# Pacman installs
echo $passvar | sudo -S pacman -Syu --noconfirm feh zsh neovim alacritty firefox exa git neofetch xorg && sudo -k

# Preparing the dotfiles repository
git clone --bare https://github.com/JumpyJacko/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
config checkout

# dwm install
git clone https://github.com/JumpyJacko/dwm.git
cd dwm
echo $passvar | sudo -S make clean install && sudo -k
cd ..

# dwmbar install and configuration
git clone https://github.com/thytom/dwmbar.git
cd dwmbar
echo $passvar | sudo -S ./install.sh && sudo -k
cd ..
echo $passvar | sudo -S cp .config/dwmbar/dwmbarrc /usr/share/dwmbar/config && sudo -k

# Set zsh things
echo $passvar | sudo -S chsh -s /usr/bin/zsh

# Paru install + what needs to be installed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
paru -Syu --noconfirm nerd-fonts-mononoki
