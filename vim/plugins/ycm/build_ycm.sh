#!/bin/bash

mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe/
git submodule update --init --recursive

cd ~
mkdir ycm_build
cd ycm_build
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/opt/clang+llvm . ~/.vim/pack/plugins/start/YouCompleteMe/third_party/ycmd/cpp \
      -DPYTHON_INCLUDE_DIR=/usr/local/include/python3.7m \
      -DPYTHON_LIBRARY=/usr/local/lib/libpython3.7m.so.1.0 \
      -DUSE_PYTHON2=OFF \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build . --target ycm_core
