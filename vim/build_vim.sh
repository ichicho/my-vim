#!/bin/bash

cd ~
git clone https://github.com/vim/vim.git

cd ~/vim
./configure --with-features=huge \
            --enable-multibyte \
	    --with-local-dir=$CONDA_PREFIX \
            --enable-python3interp=yes \
            --enable-cscope \
	    --prefix=$CONDA_PREFIX \
            LDFLAGS="-Wl,--rpath=$CONDA_PREFIX/lib"
# --with-python3-config-dir=`python -c "import sysconfig;print(sysconfig.get_config_var('srcdir'))"` \
make -j$(nproc)
make install -j$(nproc)

rm -rf ~/vim
