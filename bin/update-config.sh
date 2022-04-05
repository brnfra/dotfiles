#!/bin/bash

local=$(pwd)
BKPDIR="$HOME"/.config-backup/
mkdir -p "$BKPDIR"
$(cd "$HOME") || return
function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@ ; 
}
config pull origin notebook-cfg
if [ $? = 0 ]; then
   echo "Checked out config.";
else
    config pull origin notebook-cfg
    config pull  2>&1 | egrep "^\s+\." | awk {'print $1'} | xargs -I{} mv -f "$HOME"/{} "$BKPDIR"

    config fetch origin notebook-cfg
    config reset --hard HEAD
    config merge '@{u}'
fi
cd "$local" || return
