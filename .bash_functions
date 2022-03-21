#!/bin/bash

# Create a new directory and enter it {{{
function mkd() {
    mkdir -p "$@" && cd "$_";
}
# }}}

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

# FILE SIZE {{{
# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
	local arg=-sbh;
    else
	local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
	du $arg -- "$@";
    else
	du $arg .[^.]* ./*;
	fi;
    }
# }}}

# Create a data URL from a file {{{
function dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
	mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}
# }}}

# Start an HTTP server from a directory, optionally specifying the port {{{
function server() {
    local port="${1:-8000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}
# }}}

# Start a PHP server from a directory, optionally specifying the port {{{
# (Requires PHP 5.4.0+.)
function phpserver() {
    local port="${1:-4000}";
    local ip=$(ipconfig getifaddr en1);
    sleep 1 && open "http://${ip}:${port}/" &
    php -S "${ip}:${port}";
}
# }}}

# Compare original and gzipped file size {{{
function gz() {
    local origsize=$(wc -c < "$1");
    local gzipsize=$(gzip -c "$1" | wc -c);
    local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
    printf "orig: %d bytes\n" "$origsize";
    printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}
# }}}

# GETCERTNAMES  {{{
# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
    if [ -z "${1}" ]; then
	echo "ERROR: No domain specified.";
	return 1;
	fi;

	local domain="${1}";
	echo "Testing ${domain}…";
	echo ""; # newline

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
	    | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
	    local certText=$(echo "${tmp}" \
		| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
		no_serial, no_sigdump, no_signame, no_validity, no_version");
			    echo "Common Name:";
			    echo ""; # newline
			    echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
			    echo ""; # newline
			    echo "Subject Alternative Name(s):";
			    echo ""; # newline
			    echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
				| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
							    return 0;
							else
							    echo "ERROR: Certificate not found.";
							    return 1;
							    fi;
							}
						    # }}}

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

function play-a() {

   # vlc --play-and-exit --no-loop --no-repeat $1 &> /dev/null
   ffplay -nodisp -autoexit $1 &> /dev/null

}

function play-a-v() {

    vlc --play-and-exit --no-loop --no-repeat $1 &> /dev/null
    #ffplay -autoexit $1 &> /dev/null

}

# }}}

# GIT  {{{
# GIT DIFF
# Use Git’s colored diff when available
function diff ()
{
    hash git &>/dev/null;
    if [ $? -eq 0 ]; then

	git diff --no-index --color-words "$@";

	fi;
    } 

#GIT PUSH  
function gpush () 
{
    LOCAL=$(pwd)
    UPFILES=$(git status -sb)
    git add -A -v;git commit -v -m "$1 Update  $UPFILES";git push -v   
    if [ $? ];then
	echo "Feito"
	git status -sb
    else
	git status -sb 
	echo "Erro ao executar esta ação!"

    fi
    echo ""
    cd ~/Documents/Projects/git/ 
    git add -A -v;git commit -v -m "$1 Update  $UPFILES";   
    echo $UPFILES
    cd $LOCAL
}

#GIT PULL 
function gpull ()
{
    #Set my local REPO/Projects
    LOCAL=$(pwd)
    cd ~/Documents/Projects/git/   
    UPFILES=$(git status -sb)

    echo $UPFILES
    # PULL=`ll | cut -d . -f1`
    PULL=$(ls)
    for d in $PULL; do
	if [ ! -f $d ];then
	    cd "$d"
	    echo "$d -> $(git pull)"
	    cd ..
	fi
    done
    echo ""
    git add -A -v;git commit -v -m "$1 Update  $UPFILES";   
    echo $UPFILES
    cd $LOCAL
}

function clone ()
{ 
    #!/bin/bash

# exemple clone git@github.com:repo/iteresting-folder.git
# folder's name /interesting-folder

# 1-change current folder to .../git
# 2-clone folder
# 3-add alias

CLONED=$(echo "${1}"| cut -f2 -d "/")
CLONED="${CLONED%.*}"

WHERE="/home/$USER/Documents/Projects/git"

cd /home/"$USER"/Documents/Projects/git ||\
    mkdir -p /home/"$USER"/Documents/Projects/git &&\
    cd /home/"$USER"/Documents/Projects/git ||\
    echo "Can't create folder. Can you access the path?"

git clone "${1}" &&\
    echo "alias $CLONED=\"cd $WHERE/$CLONED\"">>/home/"$USER"/.bash_aliases ||\
    echo "git clone failed!"

}

# }}}

#NAMESTD {{{
#change names for standard. Ex.: s p c='s_p_c'; and so on...
function namestd ()
{
    printf "\n%s\n\n" "Checking Files..." 

# saida" remove blank spaces and trailing especial chars
STDNAMES=$((0))
STDFILES=$((0))
STDFOLDERS=$((0))
LOCAL=$(pwd)
#first, make some general changes, just in case(remove spaces)
for FILE in "$LOCAL"/* 
do
    OLD=$(echo $FILE | sed "s|$LOCAL/||g")
    NAME=$(echo $FILE | sed "s|$LOCAL/||g")

    NAME=${NAME// /_}
    NAME=$(echo $NAME | tr '\n\r\a\b\f\v\t\ ' '_' | sed -r 's/_$//gi')

    mv "$OLD" "$NAME"&>/dev/null 
    ISOK="$?"

    if [[ "$ISOK" = "0" ]]
    then
	    printf "\t%s\e[9m%-20s\e[0m%s%10s%-20s\n" "[" "$OLD" "]" " ----> " " [$NAME]"
	    STDNAMES=$(($STDNAMES + 1))      
    fi

    done
    printf "\n\t%-20s\n\n" "General changes. All done. $STDNAMES itens renamed."

    FILES=$(find . -maxdepth 1 -type f -name '*' | sed 's|\.\/||gi')
    STFILES=$?
    FOLDERS=""
    eval "find . -maxdepth 1 -type d -name '*' &>> /dev/null"
    STFOLDERS=$?
    # if output is 0 folder = folders list
    [[ $STFOLDERS -eq 0 ]] && FOLDERS=$(find . -maxdepth 1 -type d -name '*' | sed 's|\.\/||gi' | sed '1d') || FOLDERS=""

    if [[ $STFILES -eq 0 ]]
    then
	for FILE in ${FILES} ;
	do
	    OLD=$FILE

	    NAME=${FILE// /_}
	    if [[ $NAME == *"."* ]]; then       
		#remove os pontos dos nomes dos arquivos
		#palavra da extensao ou apos simbolo .
		EXT=$(echo "${NAME##*'.'}")
		#palavra antes do ultimo ponto ou antes do simbolo .
		NAME=$(echo ${NAME%.*})
		NAME=${NAME//[\\+]/}

		  #converte codificação para ascII simples/aqui, remove acentuacao,simbolos e excessos
		  NAME=$(iconv -f UTF8 -t ASCII//TRANSLIT<<<$NAME)
		  # sed command recursive ; is the delimiter
		  NAME=$(echo $NAME | sed -r 's/\W/_/gi; s/\./_/gi; s/\s/_/g; s/_+/_/gi; s/^_//; s/_$//gi')
		  if [[ $NAME == "" ]]; then 
		      NAME="new_renamed_file"
		  fi

		  EXT=$(iconv -f UTF8 -t ASCII//TRANSLIT<<<$EXT)
		  EXT=$(echo $EXT | sed -r 's/\W/_/gi; s/\s/_/g; s/_+/_/gi; s/^_//; s/_$//gi')
		  #output file name  
		  NAME=$NAME.$EXT

	      else
		  NAME=$(iconv -f UTF8 -t ASCII//TRANSLIT<<<$NAME)
		  NAME=${NAME//[\\+]/}
		  NAME=$(echo $NAME | sed -r 's/[ _-]/_/g; s/\W/_/gim; s/\./_/gi; s/\s/_/g; s/_+/_/gi; s/^_//; s/_$//gi')
		  if [[ $NAME == "" ]]; then 
		      NAME="new_renamed_file"
		  fi
	    fi

		  if [[ "$NAME" != "$OLD" ]]
		  then
		      mv "$OLD" "$NAME" &>/dev/null
		      ISOK="$?"
		      if [[ "$ISOK" = "0" ]]
		      then
			  printf "\t%s\e[9m%-20s\e[0m%s%10s%-20s\n" "[" "$OLD" "]" " ----> " " [$NAME]"
			  STDFILES=$(($STDFILES + 1))
		      fi
	          else
		  printf "\t%-20s%10s%-20s\n" "[$OLD]" " ----> " " [no changes]"
		  fi
	done
	      printf "\n\t%-20s\n" "All done. $STDFILES files renamed again."

	  else
	      printf "\n\t%-20s\n" "No files founded."
     fi

#atribui valor 0(null)
STDFOLDERS=$((0))
NEW=
NAME=
printf "\n%s\n\n" "Checking folders..."

if [[ $STFOLDERS -eq 0 ]]    
then
    for FOLDER in ${FOLDERS} ;
    do      
	#receive step by step the names  
	OLD=$FOLDER 
	NAME=$FOLDER
	#in case the character has been special chenge for blank otherwise write 
	NAME=${FOLDER//[^a-z|A-Z|0-9|('/')|('_')]/}
	NAME=${NAME//[\\+]/}
	NAME=${NAME//{\$}/}

	#in case the first has been _ sbst ""
	NAME=${NAME/#_/} 

	# coding to ascII remove latin chars
	NAME=$(iconv -f UTF8 -t ASCII//TRANSLIT<<<$NAME)

	#remove os pontos e _ em excesso dos nomes dos arquivos
	NAME=$(echo $NAME | sed -r 's/\W/_/gi; s/\./_/gi; s/\s/_/g; s/_+/_/gi; s/^_//; s/_$//gi')

	if [[ "$NAME" != "$OLD" ]]
	then
	    if [[ "$NAME" == "/" ]]
	    then
		echo "Folder's name is empty"

	    else
		mv -i "$OLD" "$NAME" &>/dev/null
		ISOK="$?"
		if [[ "$ISOK" = "0" ]]
		then
		    printf "\t%s\e[9m%-20s\e[0m%s%10s%-20s\n" "[" "$OLD" "]" " ----> " " [$NAME]"
		    STDFOLDERS=$(($STDFOLDERS + 1))
		fi
	    fi

	else
		  printf "\t%-20s%10s%-20s\n" "[$OLD]" " ----> " " [no changes]"

	fi
    done
    printf "\n\t%-20s\n\n\n" "All done. $STDFOLDERS folders renamed again."
else
    printf "\n\t%-20s\n\n\n" "No folders founded."
fi

}
	  # }}}

# Counters (minutes) {{{
function countdown ()
{
    MINS=$(($1 * 60)) 
    STARTCOUNT=$(($(date +%s) + $MINS)); 

    while [[ "$STARTCOUNT" -ge $(date +%s) ]]; do 
	echo -ne "$(date -u --date @$(($STARTCOUNT - $(date +%s))) +%H:%M:%S)\r";
	sleep 0.01
	read -s -n 1 -t 0.001 pause
	if [[ $pause = "p" ]];then
	    clear
	    pause=""
	    STARTPAUSE=$(($(date +%s)))
	    # next line is just for TEST
	    #  tempo=$(time -p read -s -n 1 -p "Press some key to continue...")
	    read -s -n 1 -p "Press some key to continue..." 
	    clear
	    ENDPAUSE=$(($(date +%s)))
	    DELTA=$(($ENDPAUSE - $STARTPAUSE))
	    STARTCOUNT=$(($STARTCOUNT + $DELTA))
	fi    

    done
    clear
    echo "Countdown finish"
    eval 'notify-send --urgency=low "Counter" "The $1 minutes is over" | wall' 
    eval 'ffplay -nodisp -autoexit /usr/share/sounds/freedesktop/stereo/complete.oga &> /dev/null'
}

function stopwatch () {
    date1=`date +%s`; 
    while true; do 
	echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
	sleep 0.1
    done
}

# }}}

