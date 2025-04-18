FROM alpine:latest as alpine

LABEL maintainer="brnfra"

RUN apk add --no-cache ca-certificates 
RUN apk add --no-cache git 
RUN apk add --no-cache curl 
RUN apk add --no-cache openssl 
RUN apk add --no-cache openssh 
RUN apk add --no-cache bats 
RUN apk add --no-cache parallel 
RUN apk add --no-cache stow && \
    mkdir -p ~/.parallel && \
    touch ~/.parallel/will-cite && \
    mkdir -p ~/bin  

#tests
RUN touch ~/.config1
RUN touch ~/bin/script1
RUN touch ~/.vimrc

COPY ./bin/install ./bin/
RUN ./bin/install

RUN bash -c "bats $HOME/test/testInstall.bats"
RUN bash -c "bats $HOME/test/testIfExistConfigFiles.bats"
RUN bash -c "bats $HOME/test/testGitConfig.bats"
RUN bash -c "bats $HOME/test/testBackupInstall.bats"

ENTRYPOINT ["/bin/bash"]
