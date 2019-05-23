# my-vim

## Build Vim from source
```
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-command=/usr/local/bin/python3.7 \
            --with-python3-config-dir=/usr/local/lib/python3.7/config-3.7m-x86_64-linux-gnu \
            --enable-gui=auto \
            --enable-cscope
make
sudo make install
```

Reference:

https://vim-jp.org/docs/build_linux.html

https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

## Build Python from source
```
wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz
# or download XZ-compressed-source-tarball from www.python.org
tar xf Python-3.7.3.tar.xz
cd Python-3.7.3
./configure --enable-optimizations
make -j8
sudo make altinstall
```

Reference:
https://solarianprogrammer.com/2017/06/30/building-python-ubuntu-wsl-debian/
