#!/bin/bash

# This is mainly just for me (JumpyJacko) to be able to quickly set up a new
# machine with my set-up.

read -sp 'Sudoers Password (To reduce the amount of inputs to install): ' passvar

# Move to home directory, just to make sure you are already there
cd ~

echo -e "\n----------"
echo -e "Package Installs"
echo -e "----------\n"

echo $passvar | sudo -S pacman -Syu --noconfirm

# Pacman installs
echo $passvar | sudo -S pacman -Sy --noconfirm base-devel feh zsh pamixer neovim code kitty exa git light openssh neofetch xorg xorg-server xorg-apps xorg-xinit dmenu dunst unzip && sudo -k
# Pacman installs for bloat lmao
echo $passvar | sudo -S pacman -Sy --noconfirm nodejs npm python python-pip rustup jq socat btop zathura maim convert qt5ct adwaita-qt5 gstreamer gst-plugin-pipewire gst-plugins-base gst-libav gst-plugins-good gst-plugins-bad
# Pacman installs for Japanese IME, check for additional configuration on ArchWiki
echo $passvar | sudo -S pacman -Sy --noconfirm fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk adobe-source-han-sans-jp-fonts && sudo -k

# Note:
# About using bpytop and other fancy sys-monitors, braille characters will not render correctly due to
# firefox package using gnu-free-fonts.
#
# How to fix:
# sudo pacman -R firefox gnu-free-fonts
# and then
# sudo pacman -S firefox
# and pick number 2 when prompted to install noto-fonts instead of gnu-free-fonts.

echo -e "\n----------"
echo -e "dotfiles Setup"
echo -e "----------\n"

# Preparing the dotfiles repository
git clone --bare https://github.com/JumpyJacko/dotfiles.git $HOME/.cfg
/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME checkout

# About the dotfiles:
# Remember to set up the git ssh key after running this script

git clone --depth 1 https://github.com/AstroNvim/AstroNvim.git ~/.config/nvim
git clone https://github.com/JumpyJacko/astronvim_user.git ~/.config/nvim/lua/user

echo -e "\n----------"
echo -e "dwm Install"
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

echo -e "\n----------"
echo -e "zsh Setup"
echo -e "----------\n"

# Set zsh things
echo $passvar | chsh -s /usr/bin/zsh

echo -e "\n----------"
echo -e "paru Install"
echo -e "----------\n"

rustup toolchain install stable nightly
rustup default nightly

# Paru install + what needs to be installed
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm

# Installing font
cd ~
curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Mononoki.zip 
unzip -a Mononoki.zip
echo $passvar | sudo -S mkdir /usr/share/fonts/"mononoki Nerd Font"
echo $passvar | sudo -S mv ./"Mononoki Nerd Font Complete Bold.ttf" /usr/share/fonts/"mononoki Nerd Font"
echo $passvar | sudo -S mv ./"Mononoki Nerd Font Complete Bold Italic.ttf" /usr/share/fonts/"mononoki Nerd Font"
echo $passvar | sudo -S mv ./"Mononoki Nerd Font Complete Mono Bold.ttf" /usr/share/fonts/"mononoki Nerd Font"
echo $passvar | sudo -S mv ./"Mononoki Nerd Font Complete Mono Bold Italic.ttf" /usr/share/fonts/"mononoki Nerd Font"
echo $passvar | sudo -S mv ./"Mononoki Nerd Font Complete Mono Italic.ttf" /usr/share/fonts/"mononoki Nerd Font"
echo $passvar | sudo -S mv ./"Mononoki Nerd Font Complete Mono Regular.ttf" /usr/share/fonts/"mononoki Nerd Font"
echo $passvar | sudo -S mv ./"Mononoki Nerd Font Complete Regular.ttf" /usr/share/fonts/"mononoki Nerd Font"
find -name '*Mononoki*' -delete
rm readme.md
rm LICENSE.txt

# Hyprland install
echo -e "\n----------"
echo -e "Hyprland Install"
echo -e "----------\n"

echo $passvar | sudo -S pacman -Sy --noconfirm hyprland qt5-wayland qt6-wayland polkit-kde-agent
paru -Syu --noconfirm hyprpaper hyprpicker-git eww-wayland

# More notes:
# add export QT_QPA_PLATFORMTHEME=qt5ct to /etc/environment
