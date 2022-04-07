#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Ultima_modificacao: 07-04-2022
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
#
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.bash/.bash_profile ]; then
    . ~/.bash/.bash_profile
fi
