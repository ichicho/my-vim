#!/bin/bash

cd ~
curl -O https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.sh
chmod +x ~/cmake-3.14.5-Linux-x86_64.sh
~/cmake-3.14.5-Linux-x86_64.sh --prefix=/usr/local --skip-license

rm ~/cmake-3.14.5-Linux-x86_64.sh
