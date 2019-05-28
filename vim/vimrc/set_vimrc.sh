#!/bin/bash

echo "Input your Git Repo path(e.g., ~/my-vim)\n"

cd $1/vim/vimrc
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/ftplugin
cp python.vim ~/.vim/ftplugin/python.vim
