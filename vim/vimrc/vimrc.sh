#!/bin/bash

cd $(dirname $(readlink -f $0))
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/ftplugin
cp python.vim ~/.vim/ftplugin
