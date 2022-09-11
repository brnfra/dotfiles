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

 # }}}
#Neofetch {{{
alias neofetch='neofetch --block_range 0 15'
    # }}}
    # List directories contents aliasesc {{{
	
	# Long form no user group, color sort by name, directories first
alias l='ls -Agophv --color=always --group-directories-first'
	# Long form with user group, color sort by name, directories first
alias ll='ls -AGophv --color=always --group-directories-first'
    	# Order by last modified, long form no user group, color
alias lt='ls -Atogph --color=auto --group-directories-first'
    	# List all dirs with size
alias lv='du -h --max-depth=1 | sort -h'
    	# List order by type
alias lx='ls -Agxoph | grep -e "[^\/]$"'
    	# some more ls aliases
	#show hiddens only
alias l.='ls -ApGv --group-directories-first | grep --regexp="^[.]"'                 
	#show links only
alias li='ls -AFohL --color=always | grep --regexp="^[l]"'    
        #show directories
alias ld='ls -ApGoh --color=always | grep --regexp="[\/]$"'

	#exa aliases
#alias l='exa -alF --color=always --group-directories-first --sort name'                                 #long format no hidden
#alias xl.='exa -aF1 --sort name | grep "^[.].*[^\/]$"'                                                  # exa hidden dir, files and links
#alias xlt='exa -aTF -L 2 --color=always --group-directories-first --sort name'                                   # tree listing
#alias xlr='exa -aRlF --color=auto --color-scale --group-directories-first --level 2 --sort size -r'         #exa all directories and files, in recursive mode, inside(careful to use inside longs trees)

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
alias svim='sudo nvim'
alias cd..="cd .."
alias cim="nvim"
alias VIM="nvim"
alias grep="grep --color=auto"
alias EXIT="exit"
alias myhost='ssh -T user@my.remote.host screen -dAr'
alias cp='cp -i'
alias mv='mv -i'
alias fd='fdfind'
alias tam='item_size'
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
# jekyll {{{
alias jstart="bundle exec jekyll serve --livereload"
#}}}
# python {{{
alias py="python3 "
#}}}
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
alias hd='cd /media/SamsungHDD'
alias hd2='cd /media/WDHDD'

alias hosts='sudo vim /etc/hosts'
alias repo="cd ~/documents/projects/git"
alias config="cd ~/documents/projects/git/dotfiles"

alias promptrc='nvim ~/.bash/.bash_prompt'
alias profilerc='nvim ~/.bash/.bash_profile'
alias aliasrc='nvim ~/.bash/.bash_aliases' 
alias funcrc='nvim ~/.bash/.bash_functions' 
alias pathrc='nvim ~/.bash/.bash_exports' 
alias bashrc='nvim ~/.bashrc' 
alias vimrc='nvim ~/.vimrc'
alias i3rc='nvim ~/.config/i3/config'
alias vifmrc='nvim ~/.config/vifm/vifmrc'
  
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
