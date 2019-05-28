#!/bin/bash

python_version=3.7.3
conda_prefix=$HOME/miniconda

curl -o ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ~/miniconda.sh
~/miniconda.sh -b -p $conda_prefix
rm ~/miniconda.sh

export PATH="$HOME/miniconda/bin:$PATH"
conda init bash

conda update conda

conda create -y --name myenv python=$python_version
