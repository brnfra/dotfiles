#!/bin/bash

# Create a new directory and enter it {{{
function mkd() {
    mkdir -p "$@" && cd "$_";
}
# }}}
# Where is a function defined? {{{
whichfunc() {
        type -a $1
}
#}}}
# Create a SymLink {{{

function symlink() {
  #Original code from https://github.com/lewagon/dotfiles/blob/master/install.sh
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s "$file" "$link"
  fi
}

# }}}
# Create a backup {{{
# Define a function which rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
 #Original code from https://github.com/lewagon/dotfiles/blob/master/install.sh
function backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

# }}}
# autocomplete {{{
function auto_complete_apt() 
{
    mapfile -t COMPREPLY < <(apt-cache --no-generate pkgnames "$2");
}
complete -F auto_complete_apt get
complete -F auto_complete_apt psearch
complete -F auto_complete_apt pinfo
complete -F auto_complete_apt instalados
complete -F auto_complete_apt pdeps
# }}}
