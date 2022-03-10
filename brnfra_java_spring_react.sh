#!/bin/env bash

#------------------
#VS code instalation
VSNAME="vscode-stable.tar.gz"

cd "/tmp" || return
wget -c --show-progress -O $VSNAME "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64"
PROCESS="$!"
wait $PROCESS

tar -xvf $VSNAME
PROCESS="$!"
wait $PROCESS

mv ./VSCode-linux-x64/ "$HOME/.local/opt/"
PROCESS="$!"
wait $PROCESS

ln -s -T "$HOME/.local/opt/VSCode-linux-x64/bin/code" vscode-stable
mv vscode-stable "$HOME"

#------------------------
#Spring Tools instalation
#
STSNAME="sts-stable-release.tar.gz"

cd "/tmp" || return
wget -c --show-progress -O $STSNAME "https://download.springsource.com/release/STS4/4.13.1.RELEASE/dist/e4.22/spring-tool-suite-4-4.13.1.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz"
PROCESS="$!"
wait $PROCESS

tar -xvf $STSNAME
PROCESS="$!"
wait $PROCESS

mv ./sts-4.13.1.RELEASE/ "$HOME/.local/opt/"
PROCESS="$!"
wait $PROCESS

ln -s -T "$HOME/.local/opt/sts-4.13.1.RELEASE/SpringToolSuite4" spring
mv spring "$HOME"

# ------------------------
#PostMan Tools instalation
POSTMAN="postman.tar.gz"

cd "/tmp" || return
wget -c --show-progress -O $POSTMAN "https://dl.pstmn.io/download/latest/linux64"
PROCESS="$!"
wait $PROCESS

tar -xvf $POSTMAN
PROCESS="$!"
wait $PROCESS

mv ./Postman/ "$HOME/.local/opt/"
PROCESS="$!"
wait $PROCESS

ln -s -T "$HOME/.local/opt/Postman/Postman" postman
mv postman "$HOME"

#---------------------
#Heroku-CLI instalation
HEROKU="heroku.tar.gz"

cd "/tmp" || return
wget -c --show-progress -O $HEROKU "https://cli-assets.heroku.com/heroku-linux-x64.tar.gz"
PROCESS="$!"
wait $PROCESS

tar -xvf $HEROKU
PROCESS="$!"
wait $PROCESS

mv ./heroku/ "$HOME/.local/opt/"
PROCESS="$!"
wait $PROCESS

ln -s -T "$HOME/.local/opt/heroku/bin/heroku" heroku
mv heroku "$HOME"

