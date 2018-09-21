#!/bin/bash

# Install fun
sudo apt update
sudo apt install -y \
  neovim \
  curl \
  fonts-hack-ttf \
  tmux silversearcher-ag \
  cmake \
  python-dev \
  python3-dev

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "source $(pwd)/.vimrc" > ~/.vimrc
echo "source $(pwd)/.gvimrc" > ~/.gvimrc
mkdir -p $HOME/.vim/backup $HOME/.vim/undo

# neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +"PlugInstall --sync" +qa

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "source-file $(pwd)/.tmux.conf" > ~/.tmux.conf
cp .tmuxline ~/.tmuxline

# ssh
cp .ssh_config ~/.ssh/config

# git
cp .gitconfig ~/.gitconfig

# rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# bash
echo "source $(pwd)/.bash_aliases" > ~/.bash_aliases

# todo
mkdir ~/.todo
touch ~/.todo/{todo.txt,done.txt}
