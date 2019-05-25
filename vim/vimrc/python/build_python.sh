#!/bin/bash

cd ~
curl -O https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
tar xf Python-3.7.3.tar.xz

cd Python-3.7.3
./configure --enable-optimizations \
            --enable-shared \
            LDFLAGS="-Wl,--rpath=/usr/local/lib"
make -j$(nproc)
make altinstall

cd /usr/local/bin
ln -s python3.7 python
ln -s python3.7 python3

cd ~
rm Python-3.7.3.tar.xz
rm -rf Python-3.7.3
