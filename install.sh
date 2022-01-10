#!/bin/bash

read -sp 'Sudoers Password (To reduce the amount of inputs to install): ' passvar
read -sp 'Github Email (For making a ssh key pair, be there for the setup): ' githubEmail

# Move to home directory, just to make sure you are already there
cd ~

echo "----------"
echo "Downloading packages from the official arch repositories"
echo "----------"

# Pacman installs
echo $passvar | sudo -S pacman -Syu --noconfirm feh zsh neovim alacritty exa git openssh neofetch xorg python python-pip nodejs dmenu bpytop && sudo -k

# Note:
# About using bpytop, braille characters will not render correctly due to
# firefox package using gnu-free-fonts.
#
# How to fix:
# sudo pacman -R firefox gnu-free-fonts
# and then
# sudo pacman -S firefox
# and pick number 2 when prompted to install noto-fonts instead of gnu-free-fonts.

echo "----------"
echo "Downloading and setting up dotfiles git bare repository"
echo "----------"

# Preparing the dotfiles repository
git clone --bare git@github.com:JumpyJacko/dotfiles.git $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME checkout

echo "----------"
echo "Downloading and install dwm and it's extras"
echo "----------"

# dwm install
git clone git@github.com:JumpyJacko/dwm.git
cd dwm
echo $passvar | sudo -S make clean install && sudo -k
cd ..

# dwmbar install and configuration
git clone https://github.com/thytom/dwmbar.git
cd dwmbar
echo $passvar | sudo -S ./install.sh && sudo -k
cd ..
echo $passvar | sudo -S cp .config/dwmbar/dwmbarrc /usr/share/dwmbar/config && sudo -k

echo "----------"
echo "Downloading Almonds"
echo "----------"

# Download almonds (fractal viewer)
pip install pillow
git clone https://github.com/Tenchi2xh/Almonds.git

echo "----------"
echo "Setting zsh as default shell"
echo "----------"

# Set zsh things
echo $passvar | chsh -s /usr/bin/zsh

echo "----------"
echo "Downloading and installing paru as well as extra packages"
echo "----------"

# Paru install + what needs to be installed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
paru -Syu --noconfirm nerd-fonts-mononoki

echo "----------"
echo "Generating a ssh keypair for Github ssh"
echo "----------"

# Generating an ssh key pair for Github
ssh-keygen -t ed25519 -C "$githubEmail"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
