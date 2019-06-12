FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

ARG user=vimmer
ARG home=/home/$user
ARG env=myenv
ARG python_version=3.7.3

SHELL ["/bin/bash", "-c"]

# Create user and add to sudo group
RUN apt update && \
    apt install -y --no-install-recommends sudo && \
    useradd -ms /bin/bash $user && \
    usermod -aG sudo $user && \
    echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR $home

# Install ssl and download tool
RUN sudo apt update && \
    sudo apt install -y --no-install-recommends \
                     ca-certificates \
                     curl \
                     git && \
    sudo rm -rf /var/lib/apt/lists/*

# Download code for installation
RUN git clone https://github.com/ichicho/my-vim.git
WORKDIR $home/my-vim
RUN git checkout torch

# Install miniconda
RUN conda_python/install_miniconda.sh

# Set environment variable for bash in docker file
RUN sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</ p' $home/.bashrc > $home/.bash_conda_init 
ENV BASH_ENV=~/.bash_conda_init

# Create new environment
RUN conda create -y --name $env python=$python_version && \
    echo "conda activate $env" >> $home/.bash_conda_init && \
    echo "conda activate $env" >> $home/.bashrc

# Build vim with python3 support
RUN vim/build_vim.sh

# Configure vim
RUN vim/vimrc/set_vimrc.sh

# Build YouCompleteMe with C support
RUN vim/plugins/ycm/install_cmake.sh && \
    vim/plugins/ycm/build_ycm.sh

# Back to $HOME
WORKDIR $home
# Keep container running
CMD tail -f /dev/null
