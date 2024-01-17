FROM ubuntu

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

WORKDIR $HOME

ENTRYPOINT ["/bin/bash", "-c", "echo", "Am I a container?"]

