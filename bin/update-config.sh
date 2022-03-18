#!/bin/bash

BKPDIR="$HOME"/.config-backup

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@;
}

echo "Status"
config status
config remote -v
echo "Fetching..."
config fetch origin master
echo "Merging..."
config merge --ff origin master
echo "Status"
config status
