#!/bin/bash

read -sp 'Sudoers Password: ' passvar

# Pacman installs
echo passvar | sudo pacman -Syu feh zsh neovim alacritty firefox exa git neofetch xorg base-devel && sudo -k

# Preparing the dotfiles repository
git clone --bare https://github.com/JumpyJacko/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-di$HOME/.cfg --work-tree=$HOME'

# Paru install + what needs to be installed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
paru -S nerd-fonts-mononoki

# dwm install
git clone https://github.com/JumpyJacko/dwm.git
cd dwm
echo passvar | sudo make clean install && sudo -k
cd ..

# dwmbar install and configuration
git clone https://github.com/thytom/dwmbar.git
cd dwmbar
echo passvar | sudo ./install.sh
cd ..
cp .config/dwmbar/dwmbarrc /usr/share/dwmbar/config

# Set zsh things
chsh -s /usr/bin/zsh

sudo -k
