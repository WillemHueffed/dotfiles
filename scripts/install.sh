sudo apt install stow
sudo apt install tmux

# Install latest release of nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone -b v2.0 https://github.com/NvChad/NvChad ~/dotfiles/.config/nvim --depth 1 && nvim


