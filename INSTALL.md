# Full Setup For DWM/Xorg
### Packages
Update packages
```sh
sudo pacman -Syu
```

#### Main packages
```sh
# Most essential for a functional graphical system
sudo pacman -S base-devel zsh pamixer git openssh xorg xorg-server xorg-apps xorg-xinit dmenu kitty unzip

# Still essential for these dotfiles but not necessarily needed for a functional graphical system
sudo pacman -S nodejs npm python python-pip rustup dunst jq socat btop feh neovim eza bat zoxide zathura unrar maim convert qt5ct adwaita-qt5 ttf-mononoki-nerd
```

#### IME Packages
```sh
sudo pacman -S fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk adobe-source-han-sans-jp-fonts
```

#### Gstreamer Packages
```sh
sudo pacman -S gstreamer gft-plugin-pipewire gst-plugins-base gst-libav gst-plugins-good gst-plugins-bad
```

#### Extra Packages (music player, utilities, etc.)
```sh
sudo pacman -S miniserve perl-image-exiftool highlight ncmpcpp mpd mpc
```

### IMPORTANT (for me): Setup SSH key
Uhh, just follow these two guides:
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

## Dotfiles
Clone the dotfiles
```sh
git clone git@github.com:jumpyjacko/dotfile.git` $HOME/dotfiles
```

Use GNU Stow
```sh
stow --adopt .
```

## Neovim setup
Bring your own setup, for me it's installed with cloning my [Neovim setup](https://github.com/jumpyjacko/nvim).
```sh
cd ~/.config/
git clone git@github.com:jumpyjacko/nvim
nvim
```

> Note: DO NOT USE MY NEOVIM SETUP because I use the Colemak layout and have rebound *many* keys. If you *do* want to use the setup, make sure you go to `lua/core/keymaps.lua` and clear out the majority of it.

## Installing the Graphical Environment (DWM and ly)
### Installing DWM
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

### Installing `ly`
Follow the steps at [this repo](https://github.com/jumpyjacko/ly).

### Change `zsh` to the main shell
```sh
chsh -s /usr/bin/zsh
```

## Paru Install and Packages
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

`paru` Packages
```sh
paru -S joshuto j4-dmenu-desktop
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
