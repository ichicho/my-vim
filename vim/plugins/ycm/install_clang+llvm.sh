#!/bin/bash

cd ~
wget http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
sudo mv clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04 /opt/clang+llvm

rm ~/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
