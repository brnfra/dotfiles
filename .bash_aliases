#!/usr/bin/env bash
  
    #APT aliases {{{
    #list dependencies
alias pdeps="apt depends"

    #source edit
alias src="sudo apt edit-sources"

    # update and upgrade 
alias up='sudo apt-get update'
alias upgl='apt list -a --upgradable 2>/dev/null'
alias upg='sudo apt-get upgrade -y'
alias get='sudo apt-get install'
alias remove='sudo apt-get remove --purge'
alias upgrade-distro='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y'
    # clean
alias clean='sudo apt-get autoremove -y && sudo apt-get autoclean && sudo apt-get clean'
    # dotfiles update
alias config='git --git-dir="$HOME"/.dotfiles/ --work-tree=$HOME'

config pull 
 # }}}
#Neofetch {{{
alias neofetch='neofetch --block_range 0 15'
    # }}}
    # List dir contents aliasesc {{{
    #show big directories(space)
alias bigdirs='du --max-depth=1 2> /dev/null | sort -n -r | head -n20'
    # Long form no user group, color
alias l='ls -AoGh --color=always --group-directories-first'
    # Order by last modified, long form no user group, color
#alias lt='ls -toG --color=auto'
    # List all except . and ..., color, mark file types, long form no user group, file size
alias lv='ls -AGFSoh --color=auto --group-directories-first'
    # List all except . and ..., color, mark file types, long form no use group, order by last modified
alias lt='ls -AGFtoh --color=auto'

    # some more ls aliases
alias l.='ls -AF1 --color=always --group-directories-first --hide='[\/]$' | grep --regexp="^[.]"'   #show hidden no folders
alias la.='ls -AF1 --color=always --group-directories-first | grep --regexp="^[.]"'                 #show hidden folders included
alias li='ls -AFoh --color=always | grep --regexp="^[l]"'                                           #show links
alias ld='ls -AFoh --color=always | grep --regexp="^[d]"'                                           #show directories

    #exa aliases
alias xll='exa -alF --color=always --group-directories-first --sort name'                               #prefered hidden include
alias xl='exa -alF --color=always --group-directories-first --sort name'                                 #long format no hidden
alias xl.='exa -aF1 --sort name | grep "^[.].*[^\/]$"'                                                  # exa hidden dir, files and links
alias xli='exa -alF --sort name | grep --regexp="^[l]"'                                                 # exa links
alias xld='exa -alF --sort name | grep --regexp="^[d]"'                                                 # exa directories
alias xlt='exa -aTF --color=always --group-directories-first --sort name'                                   # tree listing
alias xlr='exa -aRlF --color=auto --color-scale --group-directories-first --level 2 --sort size -r'         #exa all directories and files, in recursive mode, inside(careful to use inside longs trees)
    # grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
    
    #alias to nav directories 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias CD='cd'
    # }}}
    #Command aliases {{{
alias svim='sudo vim'
alias cd..="cd .."
alias cim="nvim"
alias VIM="nvim"
alias grep="grep --color=auto"
alias EXIT="exit"
alias myhost='ssh -T user@my.remote.host screen -dAr'
alias cp='cp -i'
alias mv='mv -i'
alias fd='fdfind'
 # }}}
    #git {{{
    #status
alias g='git status -sb'
alias glog="git log --graph --decorate --after='1 month ago' --pretty='format:%cn commited %h on %ar. %s ;'"
    #git diff
alias gdiff="git diff"    
    #add and rm
alias ga='git add -A'
alias gr='git rm '
    #commit
alias gc='git commit'
alias gcm='git commit -m'
    #push
#alias gpush='git push -u origin master'
    #pull
#alias gpull='git pull'
    #config
alias guser='git config --global user.name '
alias gmail='git config --global user.email '
alias gconf='git config --list --show-origin'
#push see bash_functions
    # }}}
    #docker {{{
alias dstop='docker stop'
alias dup='docker-compose up'
alias dexec='docker exec -ti'
alias dcon='docker container ls -a'
alias dimg='docker image ls'
alias dstop='docker stop deb-mariadb && docker stop deb-php-apache && docker stop deb-php-phpmyadmin'
    # }}}
    # Shortcuts map {{{
alias down="cd ~/Downloads"
alias dow="cd ~/Downloads"
alias dwall="cd ~/.wallpapers/"
alias docs="cd ~/Documents/"
alias doc="cd ~/Documents/"

alias repo="cd ~/documents/projects/git"

alias prompt='vim ~/.bash_prompt' 
alias bashrc='vim ~/.bashrc' 
alias aliases='vim ~/.bash_aliases' 
alias functions='vim ~/.bash_functions' 
alias vars='vim ~/.bash_exports' 
alias vimrc='vim ~/.vimrc'
alias i3rc='vim ~/.config/i3/config'

   # }}}

    # Apps exec {{{
alias anki="cd ~/ && setsid ./Anki &>/dev/null"
alias ANKI="cd ~/ && setsid ./Anki &>/dev/null"
alias android="cd ~/ && setsid ./AndroidStudio &>/dev/null"
alias ANDROID="cd ~/ && setsid ./AndroidStudio &>/dev/null"
alias foxit="cd ~/ && setsid ./Foxit &>/dev/null"
alias FOXIT="cd ~/ && setsid ./Foxit &>/dev/null"
alias eclipse="cd ~/ && setsid ./eclipse_ide &>/dev/null"
alias ECLIPSE="cd ~/ && setsid ./eclipse_ide &>/dev/null"
alias tor="cd ~/ && setsid ./tor-browser &>/dev/null"
alias TOR="cd ~/ && setsid ./tor-browser &>/dev/null"
alias nvi="nvim"
alias nv="nvim"
alias v="vim"
#alias play="vlc --play-and-exit --no-loop --no-repeat"
# }}}

