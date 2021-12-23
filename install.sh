#!/bin/bash
# Pacman installs
pacman -Syu feh zsh neovim alacritty firefox exa git neofetch xorg base-devel

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
make clean install
cd ..

# dwmbar install and configuration
git clone https://github.com/thytom/dwmbar.git
cd dwmbar
./install.sh
cd ..
sudo cp ~/.config/dwmbar/dwmbarrc /usr/share/dwmbar/config

# Set zsh things
chsh -s /usr/bin/zsh
