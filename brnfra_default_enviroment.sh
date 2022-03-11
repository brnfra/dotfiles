#!/bin/env bash

#Please check is installed: Git and Ssh
#dados para esse script 
email="devlabbr@gmail.com"
full_name="brnfra"

PROCESS_ID=$!
wait $PROCESS_ID

# create ~/.local dirs 
echo -e "Criando pastas locais..."
mkdir -p "$HOME/.local/opt" "$HOME/.local/share" "$HOME/.fonts" "$HOME/.wallpapers"

# user dirs
mkdir -p "$HOME/documents/projects/git" "$HOME/downloads" "$HOME/music" "$HOME/pics" "$HOME/videos"

#setup git(script from https://github.com/lewagon/dotfiles/git_setup.sh )
if $(git)
then
    git config --global user.email "$email"
    git config --global user.name "$full_name"
    
    git add .
    git commit --message "Setting up my git configs"
    git push origin master
    git remote add upstream git@github.com:brnfra/dotfiles.git
else
    echo "Git installation needed. Run apt-get install git"
fi

#setup ssh
if $(ssh)
then
    ssh-keygen -t ed25519 -C "$email"
    PROCESS_ID=$!
    wait $PROCESS_ID
    
    eval "$(ssh-agent -s)"
    ssh-add "$HOME/.ssh/id_ed25519"
else
    echo "SSH installation needed. Run apt-get install ssh"
fi

FILES='.vimrc .bashrc .bash_aliases .bash_profile .bash_functions '
FILES+='.bash_exports .bash_prompt .bash_input .wgetrc .curlrc ' 
FILES+='.tmux.conf .i3blocks.conf .i3status.conf .config/ '

# copy .config files
echo -e "\nCopiando arquivos de configuração..."
for F in $FILES; do
    cp -rf ./"$F" "/home/$USER"/ 
done

#Fonts
cd "$HOME/.fonts" || return

nerdfont="nerdfont.zip"
codeNewRoman="codeNewRoman.zip"
monofur="Monofur.zip"

echo -e "\n\n Downloading Nerdfont..."
if $(curl -# -o $nerdfont -O curl -o $nerdfont -O "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip") 
then
    unzip -xvf $nerdfont 
    echo "extract accomplished"
fi


echo -e "\n\n Downloading CoeNewRoman..."
if $(curl -# -o $codeNewRoman -O "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CodeNewRoman.zip") 
then
    unzip -xvf $codeNewRoman 
    echo "extract accomplished"
fi


echo -e "\n\n Downloading Monofur..."
if $(curl -# -o $monofur -O "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip") 
then
    unzip -xvf $monofur 
    echo "extract accomplished"
fi

fc-cache -vf "$HOME/.fonts/"

echo -e "\nAll done!\n"

exit 0
