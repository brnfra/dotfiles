#!/bin/bash

local=$(pwd)
cd "$HOME" || return

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@ ;
}

config pull origin mingw32-w8

if [ $? = 0 ]; then
   echo "Checked out config.";
else
    config fetch origin mingw32-w8
    config reset --hard HEAD
    config merge '@{u}'
fi

cd "$local" || return
