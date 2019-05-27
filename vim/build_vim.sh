#!/bin/bash

cd ~
git clone https://github.com/vim/vim.git

cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-command=/usr/local/bin/python3.7 \
            --with-python3-config-dir=/usr/local/lib/python3.7/config-3.7m-x86_64-linux-gnu \
            --enable-cscope \
            LDFLAGS="-Wl,--rpath=/usr/local/lib"
make -j$(nproc)
sudo make install -j$(nproc)

rm -rf ~/vim
