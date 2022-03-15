#!/bin/bash

#Requirements: Git and Ssh
#personal data 
read -p "Type in your first and last name (no accent or special characters - e.g. 'ç'): " full_name < /dev/tty
read -p "Type in your email address (the one used for your GitHub account): " email < /dev/tty

if [[ $full_name = "" ]] || [[ $email = "" ]]
then
    echo "Error! Email and Name cannot be blank."
    exit 1
fi


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
    echo "Git installation needed. Run apt-get install git or read output for problems"
    exit 1
fi

#setup ssh
#by  nishanthshanmugham and lhunath 
#in https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
if command -v ssh &> /dev/null
then
    ssh-keygen -t ed25519 -C "$email"
    PROCESS_ID=$!
    wait $PROCESS_ID
    
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/id_ed25519"
else
    echo "SSH installation needed. Run apt-get install ssh or read output for problems"
    exit 2
fi


# code providing by ;
#  - originally by user StreakyCobra in https://news.ycombinator.com/item?id=11070797
#  - in your wonderful tutorial, Nicola Paolucci, in https://www.atlassian.com/git/tutorials/dotfiles
REPO="https://github.com/brnfra/dotfiles.git"

git clone --bare $REPO "$HOME/.dotfiles"
function config {
    GITCMD=$(type git | awk {'print $3'})
    "$GITCMD" --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" "$@"
}

config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | grep "^\s+" | awk {'print $1'} | xargs -I{} mv {} {}.backup
fi;
config checkout
config config status.showUntrackedFiles no
