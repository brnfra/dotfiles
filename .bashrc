#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Ultima_modificacao: 20-03-2022
# Download: git@github.com:brnfra
# Licence:Este arquivo é de domínio público
# Garantia: O autor não se responsabiliza por      eventuais danos
#           causados pelo uso deste arquivo.
#
#

if [ -f ~/.bash/.bash_profile ]; then
    . ~/.bash/.bash_profile
fi
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

shopt -s autocd
shopt -s checkwinsize

force_color_prompt=yes

shopt -s nocaseglob;
shopt -s histappend;
shopt -s cdspell;
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
