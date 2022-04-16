#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Ultima_modificacao: 16-04-2022
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
case $- in
    *i*) ;;
    *) return;;
esac
#Enable XON/XOFF flow control (that is, Ctrl-S/Ctrl-Q). May be negated
if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi 

if [ -f ~/.bash/.bash_profile ]; then
    . ~/.bash/.bash_profile
fi
