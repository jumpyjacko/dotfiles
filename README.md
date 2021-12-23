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

## Commands to run
Pacman install things.
```sh
sudo pacman -Syu feh zsh neovim alacritty firefox exa git neofetch xorg base-devel
```

Get the dotfiles.
```sh
git clone --bare https://github.com/JumpyJacko/dotfiles.git $HOME/.cfg && alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

All the `paru`.
```sh
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd .. && paru -S nerd-fonts-mononoki
```

Install `dwm`.
```sh
git clone https://github.com/JumpyJacko/dwm.git && cd dwm && sudo make clean install && cd ..
```

Do all the `dwmbar` things.
```sh
git clone https://github.com/thytom/dwmbar.git && cd dwmbar && sudo ./install.sh && cd .. && sudo cp ~/.config/dwmbar/dwmbarrc /usr/share/dwmbar/config
```

Set `zsh` things idk.
```sh
chsh -s /usr/bin/zsh
```

## Window manager
I use dwm for this, it is at [this repository](https://github.com/JumpyJacko/dwm).

## Gallery
