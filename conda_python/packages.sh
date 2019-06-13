#!/bin/bash

conda install -y \
              numpy \
	      matplotlib \
	      pandas \
	      jupyterlab \
	      opencv
conda install -y -c pytorch \
	      pytorch \
	      magma-cuda100
conda install -y -c conda-forge \
              pydicom
conda clean -ya
