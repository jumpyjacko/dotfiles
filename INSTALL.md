# Packages
Update packages
```sh
sudo pacman -Syu
```

## Full Setup (For DWM/Xorg)
### Packages
Main packages
```sh
sudo pacman -S base-devel zsh pamixer git openssh xorg xorg-server xorg-apps xorg-xinit dmenu dunst unzip
```

Essential apps and packages
```sh
sudo pacman -S nodejs npm python python-pip rustup jq socat btop feh neovim kitty eza bat zoxide zathura maim convert qt5ct adwaita-qt5
```

Extras that I personally use
```sh
sudo pacman -S miniserve fcitx5-mozc fcitx5-configtool fcitx5-qt fcitx5-gtk adobe-source-han-sans-jp-fonts perl-image-exiftool unrar highlight ncmpcpp mpd mpc
```

Gstreamer stuff
```sh
sudo pacman -S gstreamer gft-plugin-pipewire gst-plugins-base gst-libav gst-plugins-good gst-plugins-bad
```

### IMPORTANT: Setup SSH key
uhh, just follow these two guides:
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

### Dotfiles
Clone the dotfiles
```sh
git clone git@github.com:jumpyjacko/dotfile.git` $HOME/dotfiles
```

Use GNU Stow
```sh
stow --adopt .
```

### Neovim setup
Bring your own setup, for me it's installed with cloning my [Neovim setup](https://github.com/jumpyjacko/nvim).
> I use the automatic bootstrapping setup for Rocks.nvim, only need to install lua 5.1 with `p -S lua51`
```sh
cd ~/.config/
git clone git@github.com:jumpyjacko/nvim
nvim
```

> Note: DO NOT USE MY NEOVIM SETUP because I use the Colemak layout and have rebound *many* keys. If you *do* want to use the setup, make sure you go to `lua/mappings.lua` and clear out the majority of it.

### Actually installing DWM and it's stuff
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

### Change `zsh` to the main shell
```sh
chsh -s /usr/bin/zsh
```

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

`paru` Packages
```sh
paru -S joshuto j4-dmenu-desktop
```

### Install mononoki Nerd Font
```sh
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
```

### Atuin + Tmux Install
```sh
bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
atuin import auto

echo $passvar | sudo -S pacman -Sy tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### `ncmpcpp` / `mpd` Setup
If it doesn't work out of the box, read [the Arch Wiki](https://wiki.archlinux.org/title/Music_Player_Daemon)

### Thunar Setup
```sh
sudo pacman -S thunar tumbler nwg-look
```

For the theme, I use the Colloid-Grey-Dark-Compact gtk theme found [here](https://github.com/vinceliuice/Colloid-gtk-theme).
