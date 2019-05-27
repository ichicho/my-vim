#!/bin/bash

curl -o ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
~/miniconda.sh -b -p $HOME/miniconda
rm ~/miniconda.sh
# export PATH="$CONDA_PREFIX/bin:$PATH"
conda update conda
