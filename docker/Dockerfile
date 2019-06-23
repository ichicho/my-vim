FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

ARG user=vimmer
ARG home=/home/$user
ARG env=myenv
ARG python_version=3.7.3
ARG repo=$home/my-vim

SHELL ["/bin/bash", "-c"]

# Install basic tools
RUN apt update && \
    apt install -y --no-install-recommends \
                sudo \
                ca-certificates \
                curl \
                git \
                build-essential && \
    rm -rf /var/lib/apt/lists/*

# Create user and add to sudo group
RUN useradd -ms /bin/bash $user && \
    usermod -aG sudo $user && \
    echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
USER $user

# Copy code for installation
COPY . $repo
RUN sudo chown -R $user:$user $repo
WORKDIR $repo
RUN git checkout torch

# Install miniconda
RUN conda_python/miniconda.sh

# Set environment variable for bash in docker file
RUN sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</ p' $home/.bashrc > $home/.bash_conda_init 
ENV BASH_ENV=~/.bash_conda_init

# Create new environment
RUN conda create -y --name $env python=$python_version && \
    echo "conda activate $env" >> $home/.bash_conda_init && \
    echo "conda activate $env" >> $home/.bashrc

# Install packages
RUN conda_python/packages.sh
# Set password for jupyter
RUN jupyter notebook --generate-config && \
    sed -i "s/#c.NotebookApp.password = ''/c.NotebookApp.password = u'sha1:d9f0b9860fd2:ef1564d7be1f0c797b8c8c4cd76442defc00f69a'/" ~/.jupyter/jupyter_notebook_config.py

# Build vim with python3 support
RUN vim/vim.sh

# Configure vim
RUN vim/vimrc/vimrc.sh

# Build YouCompleteMe with C support
RUN vim/plugins/ycm/cmake.sh && \
    vim/plugins/ycm/ycm.sh


# Back to $HOME
WORKDIR $home
# Keep container running
CMD tail -f /dev/null
