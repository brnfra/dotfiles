#!/bin/env bash

VSCODE='vscode-stable.tar.gz'
SPRING='sts-stable-release.tar.gz'
POSTMAN='postman.tar.gz'
HEROKU='heroku.tar.gz'

#------------------
#Download packages
cd "/tmp" || return

echo "\n\n Downloading Visual Studeo Code..."
if $(curl -# -o $VSCODE -O "https://az764295.vo.msecnd.net/stable/c722ca6c7eed3d7987c0d5c3df5c45f6b15e77d1/code-stable-x64-1646928009.tar.gz") 
then
    tar -xvf $VSCODE 
    echo "extract accomplished"
fi

echo "\n\n Downloading Spring Boot..."
if $(curl -# -o $SPRING -O "https://download.springsource.com/release/STS4/4.13.1.RELEASE/dist/e4.22/spring-tool-suite-4-4.13.1.RELEASE-e4.22.0-linux.gtk.x86_64.tar.gz") 
then
    tar -xvf $SPRING
    echo "extract accomplished"
fi

echo "\n\n Downloading PostMan..."
if $(curl -# -o $POSTMAN -O "https://dl.pstmn.io/download/latest/linux64")
then
    tar -xvf $POSTMAN 
    echo "extract accomplished"
fi

echo "\n\n Downloading Heroku-CLI..."
if $(curl -# -o $HEROKU -O "https://cli-assets.heroku.com/heroku-linux-x64.tar.gz")
then
    tar -xvf $HEROKU
    echo "extract accomplished"
fi
   
#Move files to /.local/opt
mv -nuv ./VSCode-linux-x64/ ./sts-4.13.1.RELEASE/ ./Postman/ ./heroku/ "$HOME/.local/opt/"
PROCESS="$!"
wait $PROCESS

#Symlinks
ln -s -T "$HOME/.local/opt/VSCode-linux-x64/bin/code" vscode-stable
ln -s -T "$HOME/.local/opt/sts-4.13.1.RELEASE/SpringToolSuite4" spring
ln -s -T "$HOME/.local/opt/Postman/Postman" postman
ln -s -T "$HOME/.local/opt/heroku/bin/heroku" heroku

mv -nuv vscode-stable spring postman heroku "$HOME"
