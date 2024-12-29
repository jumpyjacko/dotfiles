<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [System Setup](#system-setup)
   * [Packages](#packages)
      + [Main packages](#main-packages)
      + [IME Packages](#ime-packages)
      + [Gstreamer Packages](#gstreamer-packages)
      + [Extra Packages (music player, utilities, etc.)](#extra-packages-music-player-utilities-etc)
   * [Setup SSH key](#setup-ssh-key)
   * [Dotfiles](#dotfiles)
   * [Change `zsh` to the main shell](#change-zsh-to-the-main-shell)
   * [Additional Steps](#additional-steps)
      + [Atuin + Tmux Install](#atuin--tmux-install)
      + [`ncmpcpp` / `mpd` Setup](#ncmpcpp--mpd-setup)
      + [Thunar Setup](#thunar-setup)
      + [Neovim setup](#neovim-setup)
      + [Installing a Display Manager (`ly`)](#installing-a-display-manager-ly)
      + [Paru Install and Packages](#paru-install-and-packages)
- [Installing the Graphical Environment (Wayland)](#installing-the-graphical-environment-wayland)
- [Installing the Graphical Environment (Xorg)](#installing-the-graphical-environment-xorg)
   * [Packages](#packages-1)
   * [Installing DWM](#installing-dwm)
      + [Better `dmenu` search](#better-dmenu-search)

<!-- TOC end -->

# System Setup
## Packages
Update packages
```sh
sudo pacman -Syu
```

### Main packages
```sh
# Essential
sudo pacman -S base-devel zsh pamixer git openssh kitty unzip

# Xorg
sudo pacman -S xorg xorg-server xorg-apps xorg-xinit dmenu

# Essential for these dotfiles but not necessarily needed
sudo pacman -S nodejs npm python python-pip rustup dunst jq socat btop feh neovim eza bat zoxide zathura unrar convert qt5ct adwaita-qt5 ttf-mononoki-nerd
```

### IME Packages
```sh
sudo pacman -S fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk adobe-source-han-sans-jp-fonts
```

### Gstreamer Packages
```sh
sudo pacman -S gstreamer gft-plugin-pipewire gst-plugins-base gst-libav gst-plugins-good gst-plugins-bad
```

### Extra Packages (music player, utilities, etc.)
```sh
sudo pacman -S miniserve perl-image-exiftool highlight ncmpcpp mpd mpc lazygit maim
```

## Setup SSH key
Follow these two guides:
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

## Dotfiles
Clone the dotfiles
```sh
git clone git@github.com:jumpyjacko/dotfile.git` $HOME/dotfiles
```

Use GNU Stow
```sh
cd $HOME/dotfiles
stow --adopt .
```

## Change `zsh` to the main shell
```sh
chsh -s /usr/bin/zsh
```

## Additional Steps
### Atuin + Tmux Install
```sh
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
atuin import auto

sudo pacman -Sy tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### `ncmpcpp` / `mpd` Setup
If it doesn't work out of the box, read [the Arch Wiki](https://wiki.archlinux.org/title/Music_Player_Daemon)

### Thunar Setup
```sh
sudo pacman -S thunar tumbler nwg-look
```

For the theme, I use the Colloid-Grey-Dark-Compact gtk theme found [here](https://github.com/vinceliuice/Colloid-gtk-theme).

### Neovim setup
Bring your own setup, for me it's installed with cloning my [Neovim setup](https://github.com/jumpyjacko/nvim).
```sh
cd ~/.config/
git clone git@github.com:jumpyjacko/nvim
nvim
```

> Note: I use the Colemak layout and have rebound *many* keys. If you *do* want to use the setup, make sure you go to `lua/core/keymaps.lua` and clear out the majority of it.

### Installing a Display Manager (`ly`)
Follow the steps at [this repo](https://github.com/jumpyjacko/ly).

### Paru Install and Packages
Install `rust` toolchains (as a developer who will use Rust)
```sh
rustup toolchain install stable nightly
rustup default nightly
```

Build `paru`
```sh
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
```

# Installing the Graphical Environment (Wayland)
Switch to the `wayland` branch of this repo.

Install `river`
```sh
pacman -Sy river
```

Install additional packages
```sh
paru -Sy tofi ristatus brightnessctl wlr-randr wl-clipboard grim slurp
```

Change some configuration like input devices, etc.

# Installing the Graphical Environment (Xorg)
Switch to the `xorg` branch of this repo.
## Packages
```
sudo pacman -S xorg xorg-server xorg-apps xorg-xinit dmenu
```

## Installing DWM
```sh
git clone git@github.com:jumpyjacko/dwm.git
cd dwm
sudo make clean install && sudo -k
cd ..

git clone git@github.com/jumpyjacko/dwmbar.git
cd dwmbar
./install.sh && sudo -k
cd ..
cp .config/dwmbar/dwmbarrc /usr/share/dwmbar/config && sudo -k
```

### Better `dmenu` search
```sh
paru -S j4-dmenu-desktop
```
