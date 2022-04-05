#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Ultima_modificacao: 04-04-2022
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
if [ -f ~/.bash/.bash_profile ]; then
    . ~/.bash/.bash_profile
fi
case $- in
    *i*) ;;
      *) return;;
esac
