#!/bin/bash

PYTHON_VERSION=3.7.3
CONDA_PREFIX=$HOME/miniconda

curl -o ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x ~/miniconda.sh
~/miniconda.sh -b -p $CONDA_PREFIX
rm ~/miniconda.sh
$CONDA_PREFIX/bin/conda update conda

$CONDA_PREFIX/bin/conda create -y --name myenv python=$PYTHON_VERSION
