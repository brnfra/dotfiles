#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    source $HOME/bin/dotfiles_env
    BATS_TMPDIR="/tmp/date_fold"
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
    # Load include to test.
    mkdir -p "${BATS_TMPDIR}/level1/level2/level3/"
}

teardown_file() {
    cd "/tmp" || return
    rm -rf "tests"
}

@test "FilesByDate_3_sub_levels" { 
    cd "${BATS_TMPDIR}" || return 
    touch  "${BATS_TMPDIR}/level1/level2/level3/200301file4.png"
    touch  "${BATS_TMPDIR}/level1/level2/200402file5.jpg"
    touch  "${BATS_TMPDIR}/level1/200511file6.mkv"
    
    date_fold "${BATS_TMPDIR}" > /dev/null 2> /dev/null
    
    [ -f "${BATS_TMPDIR}/2003/1/200301file4.png" ]
    [ -f "${BATS_TMPDIR}/2004/2/200402file5.jpg" ]
    [ -f "${BATS_TMPDIR}/2005/11/200511file6.mkv" ]

} 

@test "FilesByDate" { 
    cd "${BATS_TMPDIR}" || return 
    touch "${BATS_TMPDIR}/200001file1.png"
    touch "${BATS_TMPDIR}/200102file2.jpg"
    touch "${BATS_TMPDIR}/200211file3.mkv"

    date_fold "${BATS_TMPDIR}" > /dev/null 2> /dev/null
    
    [ -f "${BATS_TMPDIR}/2000/1/200001file1.png" ]
    [ -f "${BATS_TMPDIR}/2001/2/200102file2.jpg" ]
    [ -f "${BATS_TMPDIR}/2002/11/200211file3.mkv" ]
}

