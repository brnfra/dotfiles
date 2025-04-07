#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#crtl+q // ctrl+s (experimental) controle de fluxo XON/XOFF
#stty -ixon

if [ -f ~/.bash/profile ]; then
    . ~/.bash/profile
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
