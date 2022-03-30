#!/bin/bash

cd "$HOME" || return

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@ 2>&1 | sed '/hint/d';
}

config fetch 
config reset --hard HEAD
config merge '@{u}'
