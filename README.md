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
```sudo pacman -Syu feh zsh neovim alacritty firefox exa git neofetch xorg base-devel```

All the `paru`.
```git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd .. && paru -S nerd-fonts-mononoki```

Get the dotfiles.
```git clone https://github.com/JumpyJacko/dotfiles.git && mv -vf ~/dotfiles/* .```

Do all the `dwmbar` things.
```git clone https://github.com/thytom/dwmbar.git && cd dwmbar && sudo ./install.sh && cd .. && sudo cp ~/.config/dwmbar/dwmbarrc /usr/share/dwmbar/config```

Set `zsh` things idk.
```chsh -s /usr/bin/zsh```

## Window manager
I use dwm for this, it is at [this repository](https://github.com/JumpyJacko/dwm).

## Gallery
