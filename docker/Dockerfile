FROM ubuntu:18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

RUN apt update && \
    apt install -y --no-install-recommends sudo

RUN useradd -ms /bin/bash vimmer && \
    usermod -aG sudo vimmer && \
    echo "vimmer ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/vimmer
USER vimmer
WORKDIR /home/vimmer

RUN sudo apt update && \
    sudo apt install -y --no-install-recommends \
                     ca-certificates \
                     curl \
                     git && \
    sudo rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ichicho/my-vim.git && \
    cd my-vim && \
    git checkout conda

RUN cd my-vim/conda && \
    ./install_miniconda.sh

RUN ~/miniconda/bin/conda activate myenv

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
