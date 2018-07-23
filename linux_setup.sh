#!/bin/bash

# vim
echo "source $(pwd)/.vimrc" > ~/.vimrc
echo "source $(pwd)/.gvimrc" > ~/.gvimrc

# tmux
echo "source-file $(pwd)/.tmux.conf" > ~/.tmux.conf
cp .tmuxline ~/.tmuxline
