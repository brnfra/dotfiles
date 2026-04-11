#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {

    . $HOME/bin/dotfiles_env
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"

}


@test "Check wrong DOUBLE quotes in scripts Config Files" {
. $HOME/bin/dotfiles_env
#get_response
for file in ${files[@]}; do
    #exclude vim
    if [[ "${file}" = *vim* ]];then
	echo "catch vim file = $file"
	continue
    fi
   
    run awk 'BEGIN {
	k=0;
    } { 
	n=gsub(/"/, "&");
	m=gsub(/\x27/, "&");
	k=k+n+m;
    } END {
	if (n % 2 != 0) 
	    print k;
	}' "${HOME}/${file}"
    cInfo "file = $file: $output"
    [ "$status" -eq 0 ]
    [ "$output" = '' ]
    [ "$BATS_RUN_COMMAND" != "" ]
done

}
#@test "Check If Exist wrong SINGLE quote in script Config Folders" {

#}

