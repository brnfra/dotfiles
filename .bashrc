#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Ultima_modificacao: 26-02-2023
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
if [ -f ~/.bash/profile ]; then
    . ~/.bash/profile
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(~/.rbenv/bin/rbenv init - bash)"
