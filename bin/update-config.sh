#!/bin/bash

BKPDIR="$HOME"/.config-backup

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@;
}

config pull --autostash
config stash drop
