#!/bin/bash

curl -O https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
tar xf Python-3.7.3.tar.xz

cd Python-3.7.3
./configure --enable-optimizations \
            --enable-shared \
            LDFLAGS="-Wl,--rpath=/usr/local/lib"
make -j8
make altinstall

ln -s /usr/local/bin/python3.7 /usr/local/bin/python
ln -s /usr/local/bin/python3.7 /usr/local/bin/python3

