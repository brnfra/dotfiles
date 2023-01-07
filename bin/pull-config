#!/usr/bin/env bash

# Arquivo: pull-config
# Autor: Bruno Franco
# Ultima_modificacao: 06-01-2023
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por eventuais danos
#           causados pelo uso deste script.
# code providing by ;
#  - originally by user StreakyCobra in https://news.ycombinator.com/item?id=11070797
#  - in your wonderful tutorial, Nicola Paolucci, in https://www.atlassian.com/git/tutorials/dotfiles
local=$(pwd)
BKPDIR="$HOME"/.config-backup/
mkdir -p "$BKPDIR"
$(cd "$HOME") || return
function config {
    git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME $@ ; 
}
config pull origin mingw32-w8
if [ $? = 0 ]; then
   echo "Checked out config.";
else
    config pull origin mingw32-w8
    config pull  2>&1 | egrep "^\s+\." | awk {'print $1'} | xargs -I{} mv -f "$HOME"/{} "$BKPDIR"

    config fetch origin mingw32-w8
    config reset --hard HEAD
    config merge origin '@{u}'
fi
cd "$local" || return