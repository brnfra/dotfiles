#!/bin/bash

function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@;
}

mkdir -p .config-backup
config pull

if [ $? = 0 ]; then
        echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
    config pull 2>&1 | egrep "^\s+" | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}.backup
fi

config pull
