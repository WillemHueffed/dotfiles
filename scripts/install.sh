sudo apt install stow

# Install Tmux
sudo apt install tmux

# Install tmux package manager
#git clone https://github.com/tmux-plugins/tpm ~/dotfiles/.configs/tmux/plugs/
# leader (crtl+space) + I -> (re)load env/packages

# Install Node.js v21.x
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# Install python virtual environment for nvim-mason
sudo apt install python3-venv

# Install latest release of nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

# Run installations
stow ~/dotfiles/.
tmux
tmux source ~/.config/tmux/tmux.conf
nvim --headless -c ":MasonInstallAll"

# Install NvChad
#git clone -b v2.0 https://github.com/NvChad/NvChad ~/dotfiles/.config/nvim --depth 1 && nvim


