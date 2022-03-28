#!/bin/bash

# Create a new directory and enter it {{{
function mkd() {
    mkdir -p "$@" && cd "$_";
}
# }}}
# Colorized man pages{{{ 
#from: http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
        env \
        LESS_TERMCAP_mb="$(printf "\e[1;31m")" \
	LESS_TERMCAP_md="$(printf "\e[1;31m")" \
        LESS_TERMCAP_me="$(printf "\e[0m")" \
        LESS_TERMCAP_se="$(printf "\e[0m")" \
        LESS_TERMCAP_so="$(printf "\e[1;44;33m")" \
        LESS_TERMCAP_ue="$(printf "\e[0m")" \
        LESS_TERMCAP_us="$(printf "\e[1;32m")" \
    man "$@"
}
#}}}
# Where is a function defined? {{{
whichfunc() {
        whence -v $1
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
# DIG {{{
# Run `dig` and display the most useful info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer;
}
#}}}
# OPEN {{{
# Normalize `open` across Linux, macOS, and Windows.
# This is needed to make the `o` function (see below) cross-platform.
if [ ! $(uname -s) = 'Darwin' ]; then
    if grep -q Microsoft /proc/version; then
	# Ubuntu on Windows using the Linux subsystem
	alias open='explorer.exe';
    else
	alias open='xdg-open';
    fi
    fi


# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
    if [ $# -eq 0 ]; then
	open .;
    else
	open "$@";
	fi;
    }

function aplay() {

   # vlc --play-and-exit --no-loop --no-repeat $1 &> /dev/null
   ffplay -nodisp -autoexit $1 &> /dev/null

}

function vplay () {

    vlc --play-and-exit --no-loop --no-repeat $1 &> /dev/null
    #ffplay -autoexit $1 &> /dev/null

}

# }}}
# TREE {{{
# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}
# }}}
# search avaliable packages to install {{{
function psearch () 
{ 
    apt-cache search "" |  fzf +m -i -e --prompt='------>' --header='Find:' --height=60% --border --hscroll-off=800 --preview="apt-cache show ^{1}$" --preview-window=wrap --bind="tab:toggle-preview" ; 
}
# }}}
# packages installed list(commented) {{{ 
#mypacks () 
#{
#    list="$(apt list --installed 2>/dev/null)"
#    if [[ $# -eq 0 ]]; then
#        less <<< $list
#    else
#        for pkg in "$@"; do
#            grep -@ $pkg <<< $list
#        done
#    fi

#}
##}}}
# Show installed packages {{{
function mypacks () 
{ 
    apt list --installed | awk '{print $1}'| cut -f1 -d '/' | fzf +m -i -e  --height=60% --border --hscroll-off=800 --preview="apt-cache show {1}" --preview-window=wrap --bind="tab:toggle-preview" ; 
}
#
# }}}
#search for non-free installed packages {{{
function pnonfree () 
{ 
    dpkg-query -W -f='${Section}\t{Package}\n' | grep ^non-free; 
}
# }}}
#search for contrib installed packages {{{
function pcontrib () 
{ 
    dpkg-query -W -f='${Section}\t{Package}\n' | grep ^contrib; 
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
#package info dependencies  {{{
function depends()
{ 
    apt list --installed | awk '{print $1}' | cut -f1 -d '/' | fzf +m -i -e  --height=60% --border --hscroll-off=800 --preview="aptitude why {1} " --preview-window=wrap --bind="tab:toggle-preview" ; 
}

# }}}
# FZF FUNCTIONS {{{


function open_with_fzf () 
{
    fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}
function cd_with_fzf () 
{
    cd $HOME && cd "$(fd -H -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview")"
}
# do not use yet
function pacs () {
    pcmanfm -Syy $(pcmanfm -Ssq | fzf -m --preview="pcmanfm -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}

# Display a man page using fzf and fd. usually /usr/share/man
function man_find () {
    MANPATH='/usr/share/man'
    f=$(fd . $MANPATH/man${1:-1} -t f -x echo {/.} | fzf) && man $f
}

function fman () 
{
    man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -r man
}

function fhistory () 
{
    eval "$(cat ~/.bash_history | fzf -m -i)"    
}

# }}}
