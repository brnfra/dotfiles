#!/usr/bin/env bash
  
    # List directories contents aliasesc {{{
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
alias cd..="cd .."
alias cim="nvim"
alias VIM="nvim"
alias grep="grep --color=auto"
alias EXIT="exit"
alias myhost='ssh -T user@my.remote.host screen -dAr'
alias cp='cp -i'
alias mv='mv -i'
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

   # }}}
#   Scripts Execs{{{
alias upconfig="bash ~/bin/update-config.sh"
#   }}}
