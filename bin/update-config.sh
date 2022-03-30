#!/bin/bash

local=$(pwd)
cd "$HOME" || return

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@ 2>&1 | sed '/hint/d';
}

config pull 

if [ $? = 0 ]; then
   echo "Checked out config.";
else
    config fetch
    config reset --hard HEAD
    config merge '@{u}'
fi

cd "$local" || return
