# My dotfiles

This directory contains the dotifles for my system

## Requirements

Ensure you have the following installed on your system

### Git
```
sudo apt install git
```

### Stow
```
sudo apt install stow
```

# Installation
First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone https://github.com/WillemHueffed/dotfiles.git
$ cd dotfiles 
```

then use GNU stow to create symlinks

```
$ stow .
```

## NVChad Setup
apt package is outdated (V 4.* while NVChad needs V 0.9.5)
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
sudo mv nvim.appimage /usr/bin
```
