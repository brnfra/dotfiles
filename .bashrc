#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Download: git@github.com:brnfra
# Ultima_modificacao: 15-04-2025
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

