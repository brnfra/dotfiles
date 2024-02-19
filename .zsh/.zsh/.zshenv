#!/usr/bin/zsh
for file in ~/.zsh/.{zaliases,zprofile,zinput,zextras,zfunctions,zprompt}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"


