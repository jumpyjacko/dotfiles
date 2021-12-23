#!/bin/bash
# Pacman installs
pacman -Syu feh zsh neovim alacritty firefox exa git neofetch xorg

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
