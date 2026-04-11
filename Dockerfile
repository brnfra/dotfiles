FROM alpine:latest AS alpine

LABEL maintainer="brnfra"

RUN adduser -D default_user


RUN apk add --no-cache bash
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

WORKDIR /home/default_user
COPY ./.bashrc ./
COPY ./.curlrc ./
COPY ./.Xresources ./
COPY ./.zshrc ./
COPY ./.wgetrc ./
COPY ./.bash_logout ./
COPY ./.vimrc ./

#COPY ./bin/install ./bin/
#COPY ./bin/dotfiles_env ./bin/
#COPY ./bin/dotfiles_env.sha256 ./bin/

RUN chown -R default_user:default_user /home/default_user
RUN echo "# teste alteração" >> .bashrc
RUN echo "# teste alteração" >> .curlrc
RUN echo "# teste alteração" >> .Xresources
RUN echo "# teste alteração" >> .zshrc
RUN echo "# teste alteração" >> .wgetrc
RUN echo "# teste alteração" >> .bash_logout
RUN echo "# teste alteração" >> .vimrc


USER default_user

#RUN bash -c "./bin/install"

RUN bash -c "$(curl -s --max-time 15  https://raw.githubusercontent.com/brnfra/dotfiles/stow/bin/install)";
RUN bash -c "bats ./test/testInstall.bats"
RUN bash -c "bats ./test/testIfExistConfigFiles.bats"
RUN bash -c "bats ./test/testGitConfig.bats"

ENTRYPOINT ["/bin/bash"]
