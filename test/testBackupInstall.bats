#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    BATS_TMPDIR="/tmp/date_fold"
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
    }

@test "FilesByDate_3_sub_levels" { 
    source $HOME/bin/dotfiles_env
    [ -f "${bkpdir}/original/.config1" ]
    [ -f "${bkpdir}/original/bin/script1" ]
    [ -f "${bkpdir}/original/.vimrc" ]

} 


