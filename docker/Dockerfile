FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

# Change login shell
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

# (Load ARGs from docker build command to fix permission problem
# when mounting files from host machine)
ARG user
ARG uid
ARG group
ARG gid
# Create user
RUN groupadd $group -g $gid && \
    useradd $user \
            -m -s /bin/bash \
            -u $uid \
            -g $group \
            -G sudo && \
    echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
USER $user
ARG home=/home/$user

# Copy repo
ARG repo=$home/my-vim
COPY . $repo
RUN sudo chown -R $user:$group $repo
WORKDIR $repo

# Install miniconda
RUN conda_python/miniconda.sh

# Set environment variable for bash to get conda work in docker file
RUN sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</ p' $home/.bashrc > $home/.bash_conda_init 
ENV BASH_ENV=~/.bash_conda_init

# Create new environment
ARG env=myenv
ARG python_version=3.7.3
RUN conda create -y --name $env python=$python_version && \
    echo "conda activate $env" >> $home/.bash_conda_init && \
    echo "conda activate $env" >> $home/.bashrc

# Install conda packages
RUN conda_python/packages.sh

# Build vim with python3 support
RUN vim/vim.sh

# Configure vim
RUN vim/vimrc/vimrc.sh

# Build YouCompleteMe with python support
RUN vim/plugins/ycm/cmake.sh && \
    vim/plugins/ycm/ycm.sh

# Download airline
RUN vim/plugins/airline/airline.sh

# Download fugitive
RUN vim/plugins/fugitive/fugitive.sh

# Back to $HOME
WORKDIR $home

# Expose jupyter's port
EXPOSE 8888

# Keep container running
CMD tail -f /dev/null
