#!/bin/bash

PYTHON_VERSION=3.7.3

curl -o ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ~/miniconda.sh
~/miniconda.sh -b -p $HOME/miniconda
rm ~/miniconda.sh
~/miniconda/bin/conda update conda

~/miniconda/bin/conda create -y --name myenv python=$PYTHON_VERSION
