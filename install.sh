#!/bin/bash

# This is mainly just for me (JumpyJacko) to be able to quickly set up a new
# machine with my set-up.

read -sp 'Sudoers Password (To reduce the amount of inputs to install): ' passvar

# Move to home directory, just to make sure you are already there
cd ~

echo -e "----------"
echo -e "Downloading packages from the official arch repositories"
echo -e "----------\n"

# Pacman installs
echo $passvar | sudo -S pacman -Syu --noconfirm feh zsh pamixer neovim code kitty exa git openssh neofetch xorg dmenu && sudo -k
# Pacman installs for bloat lmao
echo $passvar | sudo -S pacman -Syu --noconfirm nodejs python python-pip gstreamer gst-plugin-pipewire gst-plugins-base gst-libav gst-plugins-good gst-plugins-bad
# Pacman installs for Japanese IME, check for additional configuration on ArchWiki
echo $passvar | sudo -S pacman -Syu --noconfirm fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk adobe-source-han-sans-jp-fonts && sudo -k

# Note:
# About using bpytop and other fancy sys-monitors, braille characters will not render correctly due to
# firefox package using gnu-free-fonts.
#
# How to fix:
# sudo pacman -R firefox gnu-free-fonts
# and then
# sudo pacman -S firefox
# and pick number 2 when prompted to install noto-fonts instead of gnu-free-fonts.

# Note 2:
# Remember to run :PlugInstall and :CocInsatll <langauge servers, check coc-nvim github>
# after opening neovim

echo -e "----------"
echo -e "Downloading and setting up dotfiles git bare repository"
echo -e "----------\n"

# Preparing the dotfiles repository
git clone --bare https://github.com/JumpyJacko/dotfiles.git $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME checkout

# About the dotfiles:
# Remember to set up the git ssh key after running this script

echo -e "----------"
echo -e "Downloading and install dwm and it's extras"
echo -e "----------\n"

# dwm install
git clone https://github.com/JumpyJacko/dwm.git
cd dwm
echo $passvar | sudo -S make clean install && sudo -k
cd ..

# dwmbar install and configuration
git clone https://github.com/jumpyjacko/dwmbar.git
cd dwmbar
echo $passvar | sudo -S ./install.sh && sudo -k
cd ..
echo $passvar | sudo -S cp .config/dwmbar/dwmbarrc /usr/share/dwmbar/config && sudo -k

echo -e "----------"
echo -e "Setting zsh as default shell"
echo -e "----------\n"

# Set zsh things
echo $passvar | chsh -s /usr/bin/zsh

echo -e "----------"
echo -e "Downloading and installing paru as well as extra packages"
echo -e "----------\n"

# Paru install + what needs to be installed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
paru -Syu --noconfirm nerd-fonts-mononoki
