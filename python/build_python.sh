#!/bin/bash

cd ~
curl -OL https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
tar xf Python-3.7.3.tar.xz

cd Python-3.7.3
./configure --enable-optimizations \
            --enable-shared \
            LDFLAGS="-Wl,--rpath=/usr/local/lib"
make -j$(nproc)
sudo make altinstall -j$(nproc)

cd /usr/local/bin
sudo ln -s python3.7 python
sudo ln -s python3.7 python3

rm ~/Python-3.7.3.tar.xz
sudo rm -rf ~/Python-3.7.3
