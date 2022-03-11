#!/bin/env bash

VSCODE="vscode-stable.tar.gz"
SPRING="sts-stable-release.tar.gz"
POSTMAN="postman.tar.gz"
HEROKU="heroku.tar.gz"

#------------------
#Download packages
cd "/tmp" || return

wget -c --show-progress -O $VSCODE \
    "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" & \
    wget -c --show-progress -O $SPRING \
    "https://download.springsource.com/release/STS4/4.13.1.RELEASE/dist/e4.22/spring-tool-suite-4-4.13.1.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz" & \
    wget -c --show-progress -O $POSTMAN \
    "https://dl.pstmn.io/download/latest/linux64" & \
    wget -c --show-progress -O $HEROKU \
    "https://cli-assets.heroku.com/heroku-linux-x64.tar.gz"

PROCESS="$!"
wait $PROCESS

tar -xvf $VSCODE & tar -xvf $SPRING & tar -xvf $POSTMAN & tar -xvf $HEROKU
PROCESS="$!"
wait $PROCESS

#Move files to /.local/opt
mv ./VSCode-linux-x64/ ./sts-4.13.1.RELEASE/ ./Postman/ ./heroku/ "$HOME/.local/opt/"
PROCESS="$!"
wait $PROCESS

#Symlinks
ln -s -T "$HOME/.local/opt/VSCode-linux-x64/bin/code" vscode-stable
ln -s -T "$HOME/.local/opt/sts-4.13.1.RELEASE/SpringToolSuite4" spring
ln -s -T "$HOME/.local/opt/Postman/Postman" postman
ln -s -T "$HOME/.local/opt/heroku/bin/heroku" heroku

mv vscode-stable spring postman heroku "$HOME"

