# My Personal Set of dotfiles (Arch btw)
A nice and minimal setup with a very utilitarian theme. All monochrome because its really nice.

## Prerequisites
- Mononoki Nerd Font (`paru -S nerd-fonts-mononoki`)
- feh
- zsh
- neovim
- alacritty
- dwmbar
- firefox
- exa
- neofetch

Notes:
It is required that X11 is used, I can't be bothered with wayland and I just used the `archinstall` script and picking the `xorg` option at the end of the install.

dwmbar is a bit finicky and a pain in the ass, use this command:
`sudo cp ~/.config/dwmbar/dwmbarrc /usr/share/dwmbar/config`

Quick install for the prerequisites:
`sudo pacman -Syu feh zsh neovim alacritty firefox exa git neofetch dwmbar xorg`

## Window manager
I use dwm for this, it is at [this repository](https://github.com/JumpyJacko/dwm).

## Gallery
