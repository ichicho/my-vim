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
                sudo \
                git \
                curl \
                wget \
                ca-certificates \
                build-essential \
                libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
                libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev \
                gettext libtinfo-dev libacl1-dev libgpm-dev && \
    sudo rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ichicho/my-vim.git

RUN cd my-vim/python && \
    chmod +x build_python.sh && ./build_python.sh

RUN cd my-vim/vim && \
    chmod +x build_vim.sh && ./build_vim.sh

# RUN cd my-vim/vim/plugins/ycm && \
#     chmod +x install_clang+llvm.sh && ./install_clang+llvm.sh && \
#     chmod +x install_cmake.sh && ./install_cmake.sh && \
#     chmod +x build_ycm.sh && ./build_ycm.sh

RUN cd my-vim/vim/plugins/ycm && chmod +x install_clang+llvm.sh && ./install_clang+llvm.sh
RUN cd my-vim/vim/plugins/ycm && chmod +x install_cmake.sh && ./install_cmake.sh
RUN cd my-vim/vim/plugins/ycm && chmod +x build_ycm.sh && ./build_ycm.sh

RUN useradd -ms /bin/bash vimmer && \
    usermod -aG sudo vimmer && \
    echo "vimmer ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/vimmer
USER vimmer
WORKDIR /home/vimmer

CMD tail -f /dev/null
