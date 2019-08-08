#!/bin/bash

CURDIR=$(pwd)

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

# fzf (needs to be before vim)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# vim
echo "source $CURDIR/.vimrc" > ~/.vimrc
echo "source $CURDIR/.gvimrc" > ~/.gvimrc
mkdir -p $HOME/.vim/backup $HOME/.vim/undo
mkdir ~/.config/nvim/
cp init.vim ~/.config/nvim/

# neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +"PlugInstall --sync" +qa

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "source-file $CURDIR/.tmux.conf" > ~/.tmux.conf
cp .tmuxline ~/.tmuxline

# ssh
cp .ssh_config ~/.ssh/config

# git
cp .gitconfig ~/.gitconfig

# rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env

# bash
echo "source $CURDIR/.bash_aliases" > ~/.bash_aliases
echo "source $CURDIR/.bashrc" > ~/.bashrc

# todo
mkdir ~/.todo
touch ~/.todo/{todo.txt,done.txt}
