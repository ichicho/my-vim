#!/bin/bash

conda install -y cmake
cd ~
curl -O https://raw.githubusercontent.com/AnacondaRecipes/libnetcdf-feedstock/master/recipe/cross-linux.cmake
CMAKE_PLATFORM_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE="$HOME/cross-linux.cmake")

mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe/
git submodule update --init --recursive

cd ~
mkdir ycm_build
cd ycm_build
# cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/opt/clang+llvm . ~/.vim/pack/plugins/start/YouCompleteMe/third_party/ycmd/cpp \
#       -DPYTHON_INCLUDE_DIR=$CONDA_PREFIX/include/python3.7m \
#       -DPYTHON_LIBRARY=$CONDA_PREFIX/lib/libpython3.7m.so.1.0 \
#       -DUSE_PYTHON2=OFF \
#       -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cmake -G "Unix Makefiles" . ~/.vim/pack/plugins/start/YouCompleteMe/third_party/ycmd/cpp \
      -DPATH_TO_LLVM_ROOT=/opt/clang+llvm \
      -DPYTHON_INCLUDE_DIR=$CONDA_PREFIX/include/python3.7m \
      -DPYTHON_LIBRARY=$CONDA_PREFIX/lib/libpython3.7m.so.1.0 \
      -DUSE_PYTHON2=OFF \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      ${CMAKE_PLATFORM_FLAGS[@]}
cmake --build . --target ycm_core
cp compile_commands.json ~/compile_commands.json
rm -rf ~/ycm_build
