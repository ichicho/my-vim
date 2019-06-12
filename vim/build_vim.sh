#!/bin/bash

sudo apt update
sudo apt install -y --no-install-recommends \
	         git \
                 build-essential

cd ~
git clone https://github.com/vim/vim.git

cd ~/vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-local-dir=$CONDA_PREFIX \
	    --prefix=$CONDA_PREFIX \
            LDFLAGS="-Wl,--rpath=$CONDA_PREFIX/lib"
make -j$(nproc)
make install -j$(nproc)

rm -rf ~/vim
