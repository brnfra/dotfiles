#!/bin/bash

local=$(pwd)
cd "$HOME" || return

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@ ; wait $!;
}

config pull

if [ $? = 0 ]; then
   echo "Checked out config.";
else
    config fetch origin main
    config reset --hard HEAD
    config merge '@{u}'
fi

cd "$local" || return
