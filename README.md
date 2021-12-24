# My Personal Set of dotfiles (Arch btw)
A nice and minimal setup with a very utilitarian theme. All monochrome because its really nice.

## Prerequisites
- Mononoki Nerd Font
- dwmbar
- feh
- zsh
- neovim
- alacritty
- firefox
- exa
- neofetch

Notes:
It is required that X11 is used, I can't be bothered with wayland and I just used the `archinstall` script and picking the `xorg` option at the end of the install.

## Window manager
I use dwm for this, it is at [this repository](https://github.com/JumpyJacko/dwm).

## Commands to run
Get the dotfiles.
```sh
git clone --bare https://github.com/JumpyJacko/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

Testing:
```sh
curl -LJO https://raw.githubusercontent.com/JumpyJacko/dotfiles/main/install.sh && sudo bash -x ./install.sh
```

Run the `install.sh` script.
```sh
sudo bash -x ./install.sh
```

All the `paru`.
```sh
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
paru -S nerd-fonts-mononoki
```

## Gallery
