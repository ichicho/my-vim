#!/bin/bash

cd ~
curl -OL http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
cd clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
sudo cp -r * /usr/local/ 

rm ~/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
rm -r ~/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
