#!/bin/bash

conda install -y gxx_linux-64 \
	         make

cd ~
git clone https://github.com/vim/vim.git

cd ~/vim
./configure --with-features=huge \
            --enable-multibyte \
	    --with-local-dir=$CONDA_PREFIX \
            --enable-python3interp=yes \
            --with-python3-command=$CONDA_PREFIX/bin/python3.7 \
            --with-python3-config-dir=$CONDA_PREFIX/lib/python3.7/config-3.7m-x86_64-linux-gnu \
            --enable-cscope \
	    --prefix=$CONDA_PREFIX \
            LDFLAGS="-Wl,--rpath=$CONDA_PREFIX/lib"
make -j$(nproc)
sudo make install -j$(nproc)

rm -rf ~/vim
