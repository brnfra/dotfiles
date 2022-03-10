#!/usr/bin/env bash

# TODO
#     [x]1-update system , criar as pastas necessarias
#     [ ]2-baixar arquivos de conf(fazer em multithreading)
#     [x]3-copiar arquivos de conf para seus devidos lugares(opcional clone my repos)
#     [x]4-criar chave publica ssh
#     [x]5-instalar programas

#dados para esse script 
email="devlabbr@gmail.com"
full_name="brnfra"

sudo apt-get update
PROCESS_ID=$!
wait $PROCESS_ID

# create ~/.local dirs 
echo -e "Criando pastas locais..."
mkdir -p "$HOME/.local/opt"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.fonts"
mkdir -p "$HOME/.wallpapers"

# user dirs
mkdir -p "$HOME/documents/projects/git"
mkdir "$HOME/downloads"
mkdir "$HOME/music"
mkdir "$HOME/pics"
mkdir "$HOME/videos"

#setup git(script from https://github.com/lewagon/dotfiles/blob/master/git_setup.sh )
git config --global user.email "$email"
git config --global user.name "$full_name"

git add .
git commit --message "Setting up my git configs"
git push origin master

git remote add upstream git@github.com:brnfra/dotfiles.git

#setup ssh
ssh-keygen -t ed25519 -C "$email"
PROCESS_ID=$!
wait $PROCESS_ID
eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/id_ed25519"

#copy config files
FILES='.vimrc .bashrc .bash_aliases .bash_profile .bash_functions '
FILES+='.bash_exports .bash_prompt .bash_input .wgetrc .curlrc ' 
FILES+='.tmux.conf .i3blocks.conf .i3status.conf '
FILES+='.config/ '

for F in $FILES; do
    cp -r ./"$F" "$HOME"/ || return
done

# copy .config files
echo -e "\nCopiando arquivos de configuração..."
cd "$HOME/.fonts" || return

wget -O nerdFont.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip"
PROCESS_ID=$!
wait $PROCESS_ID

unzip nerdFont.zip
PROCESS_ID=$!
wait $PROCESS_ID

wget -O codeNewRoman.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CodeNewRoman.zip"
PROCESS_ID=$!
wait $PROCESS_ID

unzip codeNewRoman.zip
PROCESS_ID=$!
wait $PROCESS_ID

wget -O Monofur.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip"
PROCESS_ID=$!
wait $PROCESS_ID

unzip Monofur.zip
PROCESS_ID=$!
wait $PROCESS_ID

fc-cache -vf "$HOME/.fonts/"
PROCESS_ID=$!
wait $PROCESS_ID

#install pkgs after

echo -e "\nAll done!\n"

exit 0
