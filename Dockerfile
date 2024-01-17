FROM ubuntu

LABEL maintainer="brnfra"

RUN apt-get update && apt-get --no-install-recommends install -y \
    bats \
    ca-certificates \
    curl \
    git \
    openssl \
    parallel \
    ssh &&\
    mkdir -p ~/.parallel && touch ~/.parallel/will-cite && \
    mkdir -p ~/bin 

COPY ./bin/install ./bin/
RUN install

#RUN ./test/dotfilesTest.sh

WORKDIR $HOME

ENTRYPOINT ["/bin/bash", "-c", "echo", "Am I a container?"]

