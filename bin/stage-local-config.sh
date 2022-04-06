#!/bin/bash
#  Arquivo: stage-local-config.sh
#  Autor: Bruno Franco
#  Ultima_modificacao: 05-04-2022
#  Download: git@github.com:brnfra
#  Licence:Este arquivo é de domínio público
#  Garantia: O autor não se responsabiliza por            eventuais danos
#            causados pelo uso deste arquivo.

backupCopy="$HOME/backup/copiados"
DATE=$(date +%d/%m/%Y-%H:%M:%S)
SCRIPTS="$HOME/Documents/Projects/git/dotRepo/privateShell/scripts"
DOTFILES="$HOME/Documents/Projects/git/dotRepo/privateConfig"
DOTREPO="$HOME/Documents/Projects/git/dotRepo"
GITD="$HOME/Documents/Projects/git"
copyTo="$HOME/.config-backup"
bkpLog=".config-backup/bkp.log"
#function for backup
sync_copy ()
{
    echo "
    |-----------------------------------------------
    Sincronização iniciada em $DATE " > ~/$bkpLog
    bashrc='.bashrc .bash/ '
    vimrc='.vimrc .config/nvim/ '
    vifmrc='.config/vifm/vifmrc .config/vifm/scripts/ .config/vifm/colors/ ' 
    terminalrc='.config/xfce4/terminal/terminalrc ' 
    i3rc='.i3blocks.conf .config/i3/autostart/ .config/i3/ .config/i3/i3blocks/ '
    rofirc='.config/rofi/ .config/rofi/themes/'
    systemrc='.wgetrc .curlrc '
    gitrc='.gitconfig .git-completion.bash'
    comptonrc='.config/compton.conf .config/compton/ '
    tmuxrc='.tmux.conf '
    scripts='bin/ '

    for file in $bashrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $vimrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP  --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $vifmrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $terminalrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $i3rc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $rofirc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $systemrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $gitrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $comptonrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $tmuxrc; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP  --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done
    for file in $scripts; do
	newDir=$copyTo/$file
	mkdir -p "$(echo ${newDir%/*})" 
	rsync -uvahP --exclude '*.backup' -b --backup-dir=$backupCopy --progress $HOME/$file $copyTo/$file &>> ~/$bkpLog
    done

    
}

sync_copy

  #cd $DOTREPO

  #git add -A -v &>> ~/$bkpLog; git commit -v -m "$1" &>> ~/$bkpLog; git push -v &>> ~/$bkpLog
  #git status -sb &>> ~/$bkpLog

  #Verifica se a sincronizaçao foi bem sucedida se ela foi bem entra no if se nao cai no else
  if [ $? = 0 ]; then
      echo "Accomplished at $DATE
      -----------------------------------------------|" &>> ~/$bkpLog
  else
      echo "A Error occured at $DATE" &>> ~/$bkpLog
  fi
  #Atualiza o git
  #cd $GITD
  #git add -A -v >> ~/$bkpLog;git commit -v -m "Update $UPFILES" &>> ~/$bkpLog;
  #git status -sb &>> ~/$bkpLog
