sudo apt install stow

# Install Tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux package manager
# leader (crtl+space) + I -> (re)load env/packages
mkdir ../.config/tmux/plugins/tpm/
git clone git clone https://github.com/tmux-plugins/tpm ../.config/tmux/plugs/tpm/

# Install latest release of nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin

# Install NvChad
git clone -b v2.0 https://github.com/NvChad/NvChad ~/dotfiles/.config/nvim --depth 1 && nvim

# Install Node.js v21.x
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
