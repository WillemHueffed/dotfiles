sudo apt install stow
sudo apt install tmux
sudo apt install neovim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone -b v2.0 https://github.com/NvChad/NvChad ~/dotfiles/.config/nvim --depth 1 && nvim
