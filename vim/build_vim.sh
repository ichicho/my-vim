#!/bin/bash

cd ~
git clone https://github.com/vim/vim.git

cd ~/vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --enable-cscope \
	    --prefix=$CONDA_PREFIX \
            LDFLAGS="-Wl,--rpath=$CONDA_PREFIX/lib"
# --with-local-dir=$CONDA_PREFIX \
make -j$(nproc)
make install -j$(nproc)

rm -rf ~/vim
