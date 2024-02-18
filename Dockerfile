FROM ubuntu as ubuntu

LABEL maintainer="brnfra"

RUN apt-get update && apt-get --no-install-recommends install -y \
    bats \
    ca-certificates \
    curl \
    git \
    openssl \
    parallel \
    ssh \
    vim &&\
    mkdir -p ~/.parallel && touch ~/.parallel/will-cite && \
    mkdir -p ~/bin 

COPY ./bin/install ./bin/
RUN install

RUN bash -c "bats $HOME/test/testGitConfig.bats"
RUN bash -c "bats $HOME/test/testHomeConfigFiles.bats"
RUN bash -c "bats $HOME/test/testInstall.bats"
RUN bash -c "bats $HOME/test/testRepoConfigFiles.bats"

RUN id -u builder &>/dev/null || (useradd -d /builder -m builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers)

ENTRYPOINT ["/bin/bash"]

FROM archlinux as arch 

LABEL maintainer="brnfra"
ARG TARGETPLATFORM

ARG CACHEBUST=1

RUN uname -m && \
    pacman-key --init

RUN [[ "${TARGETPLATFORM}" == "linux/amd64" ]] || exit 0 && \
    pacman -Syyu --noconfirm --needed archlinux-keyring && \
    pacman-key --populate archlinux

RUN pacman -Syy --noconfirm --needed curl \
    git \
    openssh \
    openssl \
    ca-certificates \
    parallel \
    bats \
    vi && \
    mkdir -p ~/.parallel && touch ~/.parallel/will-cite && \
    mkdir -p ~/bin 

COPY ./bin/install ./bin/
RUN install

RUN bash -c "bats $HOME/test/testHomeConfigFiles.bats"
#RUN bash -c "bats $HOME/test/testInstall.bats"
#RUN bash -c "bats $HOME/test/testGitConfig.bats"
#RUN bash -c "bats $HOME/test/testRepoConfigFiles.bats"

# user 'builder' can be used as the running user for applications prohibiting root usage (pacman)
RUN id -u builder &>/dev/null || (useradd -d /builder -m builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >>/etc/sudoers)

ENTRYPOINT ["/bin/bash"]

