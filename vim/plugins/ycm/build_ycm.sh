#!/bin/bash

# Download YouCompleteMe
mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/pack/plugins/start/YouCompleteMe/
git submodule update --init --recursive

# Create build directory
mkdir ~/ycm_build
cd ~/ycm_build

cmake -G "Unix Makefiles" . ~/.vim/pack/plugins/start/YouCompleteMe/third_party/ycmd/cpp \
      -DUSE_SYSTEM_LIBCLANG=ON \
      -DPYTHON_INCLUDE_DIR=$CONDA_PREFIX/include/python3.7m \
      -DPYTHON_LIBRARY=$CONDA_PREFIX/lib/libpython3.7m.so.1.0 \
      -DUSE_PYTHON2=OFF \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake --build . --target ycm_core
cp compile_commands.json ~/compile_commands.json
rm -r ~/ycm_build
