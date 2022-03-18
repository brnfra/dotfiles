#!/bin/bash

#Requirements: Git and Ssh
#personal data
echo "Type in your first and last name (no accent or special characters - e.g. 'ç'): "
read full_name

echo "Type in your email address (the one used for your GitHub account): "
read email

PROCESS_ID=$!
wait $PROCESS_ID

# create ~/.local dirs
echo -e "Criando pastas locais..."
mkdir -p "$HOME/.local/opt" "$HOME/.local/share" "$HOME/.fonts" "$HOME/.wallpapers" \
    "$HOME/documents/projects/git"

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
    ssh-keygen -t ed25519 -C "$email";  wait $!

    eval "$(ssh-agent -s)" ssh-add
    "$HOME/.ssh/id_ed25519"
else
    echo "SSH installation needed. Run apt-get install ssh or read output for problems"
    exit 2
fi
