<<<<<<< HEAD
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
||||||| empty tree
=======
#!/usr/bin/env bash
# Arquivo: .bashrc
# Autor: Bruno Franco
# Ultima_modificacao: 31-12-2023
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
>>>>>>> 73aac843cbd85b5133698836c50b29330cbd7794
