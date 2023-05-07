# My Personal Set of dotfiles (Arch btw)
A nice and minimal setup with a very utilitarian theme. All monochrome because its really nice.

## Whats being used (These are all installed with the script)
Look at `install.sh`, it has everything there.

Also the install script is essentially just for me and me only because you _really_ should not be running scripts off the internet (unless you read them very carefully)

## Window manager
I use dwm for this, it is at [this repository](https://github.com/JumpyJacko/dwm).
I also use my fork of thytom/dwmbar at [this repository](https://github.com/JumpyJacko/dwmbar).

I have attempted to add hyprland, though I am not sure if it works.

## Neovim
I use [AstroNvim](https://github.com/AstroNvim/AstroNvim) with my configs at [this repository](https://github.com/JumpyJacko/astronvim_user).

## Installation (from clean install)
Get and run `install.sh` script. (Requires no input until end of script for `fakeroot` when `paru` is being installed)
```bash
curl -LJo install1.sh https://raw.githubusercontent.com/JumpyJacko/dotfiles/main/install.sh
# cat or whatever out install1.sh just to make sure its correct
bash ./install1.sh

# After the script is done
rm install1.sh
```

## Gallery
(Images outdated)
![clean_desktop](./Images/clean_desktop.png)
![desktop](./Images/desktop.png)
![neovim](./Images/neovim.png)
