#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
case $- in
    *i*) ;;
      *) return;;
esac

BASH_ENV=

if [ -f ~/.bash/profile ]; then
    . ~/.bash/profile
fi

eval "$(fzf --bash)"
