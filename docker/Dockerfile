# Caution
# Container built from this Dockerfile should be run only on Linux environment

FROM nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

# Load from docker build command to fix permission problem when mounting files from host machine
ARG user
ARG uid
ARG group
ARG gid

# Optional
ARG env=myenv
ARG python_version=3.7.3


# >>> Build starts >>>

# Change login shell
SHELL ["/bin/bash", "-c"]
ARG home=/home/$user
ARG repo=$home/my-vim

# Install basic tools
RUN apt update && \
    apt install -y --no-install-recommends \
                sudo \
                ca-certificates \
                curl \
                git \
                build-essential && \
    rm -rf /var/lib/apt/lists/*

# Create user
RUN groupadd $group -g $gid && \
    useradd $user \
            -m -s /bin/bash \
            -u $uid \
            -g $group \
            -G sudo && \
    echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
USER $user

# Copy repo
COPY . $repo
RUN sudo chown -R $user:$group $repo
WORKDIR $repo

# Install miniconda
RUN conda_python/miniconda.sh

# Set environment variable for bash to get conda work in docker file
RUN sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</ p' $home/.bashrc > $home/.bash_conda_init 
ENV BASH_ENV=~/.bash_conda_init

# Create new environment
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

# <<< Build ends <<<


# Back to $HOME
WORKDIR $home
# Keep container running
CMD tail -f /dev/null
