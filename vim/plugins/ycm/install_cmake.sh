#!/bin/bash

cd ~
wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4.tar.gz
tar xf cmake-3.14.4.tar.gz
cd cmake-3.14.4
./configure
make
make install

rm ~/cmake-3.14.4.tar.gz
rm -rf ~/cmake-3.14.4
