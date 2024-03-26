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

### NVChad Mason Requirements

#### Python Venv
```
sudo apt install python3-venv
```

### Node JS
```
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

## Installation
First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone https://github.com/WillemHueffed/dotfiles.git
$ cd dotfiles 
```

then use GNU stow to create symlinks

```
$ stow .
```
