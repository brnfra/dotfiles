#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    source $HOME/bin/dotfiles_env
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}


@test "Check If Exist Config Files" {
. $HOME/bin/dotfiles_env
#get_response
for file in ${files[@]}; do
    [ -f "${dotfiles_dir}/${file}" ] || {
	echo "File $file not found."
	    return 1
	}
    done

}
@test "Check If Exist Config Folders" {
source $HOME/bin/dotfiles_env
for dir in ${Dirs[@]}; do
    [ -d ${HOME}/${dir} ] || {
	echo "Folder $dir not found."
	    return 1
	}
    done
}

