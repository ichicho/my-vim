FROM ubuntu:18.04
LABEL maintainer="Yichi Zhang <ichicho@keio.jp>"

RUN apt update && \
    apt upgrade -y --no-install-recommends && \
    apt install -y --no-install-recommends \
                sudo \
                git \
                curl \
                wget \
                build-essential \
                libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
                libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev \
                gettext libtinfo-dev libacl1-dev libgpm-dev && \
    rm -rf /var/lib/apt/lists/*

RUN apt update && \
    apt install -y --no-install-recommends ca-certificates

RUN git clone https://github.com/ichicho/my-vim.git && \
    cd my-vim && \
    chmod +x build_python.sh && \
    ./build_python.sh

RUN useradd -ms /bin/bash ichicho && \
    usermod -aG sudo ichicho && \
    echo "ichicho ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/ichicho
USER ichicho
WORKDIR /home/ichicho

CMD tail -f /dev/null
