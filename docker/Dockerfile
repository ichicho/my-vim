FROM ubuntu:18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

ARG user=vimmer
ARG home=/home/$user
ARG repo=$home/my-vim

SHELL ["/bin/bash", "-c"]

RUN apt update && \
    apt install -y --no-install-recommends sudo

RUN useradd -ms /bin/bash $user && \
    usermod -aG sudo $user && \
    echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR $home

RUN sudo apt update && \
    sudo apt install -y --no-install-recommends \
                     ca-certificates \
                     curl \
                     git && \
    sudo rm -rf /var/lib/apt/lists/*

# Download code for installation
RUN git clone https://github.com/ichicho/my-vim.git
WORKDIR $home/my-vim
RUN git checkout conda

WORKDIR $home/my-vim

# Install miniconda
RUN git pull origin conda && conda/install_miniconda.sh

# Set environment variable for bash in docker file
RUN sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</ p' $home/.bashrc > $home/.bash_conda_init 
RUN echo "conda activate myenv" >> $home/.bash_conda_init && \
    echo "conda activate myenv" >> $home/.bashrc 
ENV BASH_ENV=~/.bash_conda_init

# Build vim with python3 support
RUN git pull origin conda && vim/build_vim.sh

# Configure vim
RUN git pull origin conda && vim/vimrc/set_vimrc.sh $repo

# RUN cd my-vim/vim/plugins/ycm && \
#     chmod +x install_clang+llvm.sh && ./install_clang+llvm.sh && \
#     chmod +x install_cmake.sh && ./install_cmake.sh && \
#     chmod +x build_ycm.sh && ./build_ycm.sh

CMD tail -f /dev/null
