#!/bin/bash

# Download YouCompleteMe
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/pack/plugins/start/YouCompleteMe
cd ~/.vim/pack/plugins/start/YouCompleteMe
git submodule update --init --recursive

# Create build directory
mkdir ~/ycm_build
cd ~/ycm_build

# Build YouCompleteMe
cmake -G "Unix Makefiles" . ~/.vim/pack/plugins/start/YouCompleteMe/third_party/ycmd/cpp \
      -DUSE_PYTHON2=OFF \
      -DPYTHON_INCLUDE_DIR=`python -c "import sysconfig;print(sysconfig.get_config_var('INCLUDEPY'))"` \
      -DPYTHON_LIBRARY=`python -c "import sysconfig;print(sysconfig.get_config_var('LIBDIR')+'/'+sysconfig.get_config_var('LDLIBRARY'))"`
cmake --build . --target ycm_core

rm -r ~/ycm_build
