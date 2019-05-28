FROM ubuntu:18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

ARG user=vimmer

SHELL ["/bin/bash", "-c"]

RUN apt update && \
    apt install -y --no-install-recommends sudo

RUN useradd -ms /bin/bash $user && \
    usermod -aG sudo $user && \
    echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$user
USER $user
WORKDIR $HOME

RUN sudo apt update && \
    sudo apt install -y --no-install-recommends \
                     ca-certificates \
                     curl \
                     git && \
    sudo rm -rf /var/lib/apt/lists/*

# Download code for installation
RUN git clone https://github.com/ichicho/my-vim.git
WORKDIR $HOME/my-vim
RUN git checkout conda

# Install miniconda
WORKDIR $HOME/my-vim
RUN git pull origin conda && \
    conda/install_miniconda.sh

# Set environment variable for bash in docker file
RUN sed -n '/# >>> conda initialize >>>/,/# <<< conda initialize <<</ p' $HOME/.bashrc > $HOME/.bash_conda_init 
ENV BASH_ENV=~/.bash_conda_init

RUN echo "conda activate myenv" >> $HOME/.bash_conda_init 

RUN printenv

# RUN cd my-vim/vim && \
#     chmod +x build_vim.sh && ./build_vim.sh

# RUN cd my-vim/vim/vimrc && \
#     chmod +x set_vimrc.sh && ./set_vimrc.sh

# RUN cd my-vim/vim/plugins/ycm && \
#     chmod +x install_clang+llvm.sh && ./install_clang+llvm.sh && \
#     chmod +x install_cmake.sh && ./install_cmake.sh && \
#     chmod +x build_ycm.sh && ./build_ycm.sh

CMD tail -f /dev/null
