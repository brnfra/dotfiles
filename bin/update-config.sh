#!/bin/bash

BKPDIR="$HOME"/.config-backup

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@;
}

mkdir -p "$BKPDIR"
config pull

if [ $? = 0 ]; then
        echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  config pull 2>&1 | egrep "^\s+\." | awk {'print $1'} | xargs -I{} mv "$HOME"/"{}" "$BKPDIR"
fi

config pull
