#!/bin/bash

#GIT PULL to locals
#Set my local REPO/Projects

cd ~/Documents/Projects/git/   
  # PULL=`ll | cut -d . -f1`
  PULL=$(ls)
for d in $PULL; do
     if [ ! -f $d ];then
      cd "$d"
      #git pull
      echo "$d ->"" $(git pull)"
      cd ..
     fi
done
echo ""
echo "$(git add -A)"
echo "$(git commit -m "Add files from Online Repositorie")"
echo "$(git status)"
