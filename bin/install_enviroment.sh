#!/usr/bin/env bash

#Requirements: Git and Ssh

#Personal data here(comment and CHANGE E-MAIL & NAME) 
email="devlabbr@gmail.com"
full_name="brnfra"

# create ~/.local dirs
echo -e "Criando pastas locais..."
mkdir -p "$HOME/.local/opt" \
    "$HOME/.local/share/fonts" \
    "$HOME/.wallpapers" \
    "$HOME/.ssh" \
    "$HOME/Documents/Projects/git" \
    "$HOME/.vim/backups" \
    "$HOME/.vim/bundle" \
    "$HOME/.vim/autoload" \
    "$HOME/backup/copiados" \
    "$HOME/backup/excluidos"

PROCESS_ID=$!
wait $PROCESS_ID

#setup git(script from https://github.com/lewagon/dotfiles/git_setup.sh )
if command -v git &> /dev/null
then
    git config --global user.email "$email"
    git config --global user.name "$full_name"
    git add .
    git commit --message "Setting up my git configs"
    git push origin master
    git remote add upstream git@github.com:brnfra/dotfiles.git
else
    echo "Git installation needed. Run apt-get  install git or read output for problems"
    exit 1
fi

#setup ssh
#by  nishanthshanmugham and lhunath  #in https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
if command -v ssh &> /dev/null
then
    eval ssh-keygen -t ed25519 -C "$email";  wait $!

    eval "$(ssh-agent -s)" ssh-add
    "$HOME/.ssh/id_ed25519"
else
    echo "SSH installation needed. Install ssh or read output for problems"
    exit 2
fi


