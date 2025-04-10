#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    
    source $HOME/bin/dotfiles_env
    BATS_TMPDIR="/tmp/namestd"
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
    # Load include to test.
    local=$(pwd)
    mkdir -p "${BATS_TMPDIR}"
    cd "${BATS_TMPDIR}" || return
    if [ "$(pwd)" = "$HOME" ];then
	exit 1
    fi
    pathTo='space  in path'
    sdir='space      dir'
    sfile="space   in   file"

    mkdir -p "${BATS_TMPDIR}/$pathTo/$sdir"
    touch "${BATS_TMPDIR}/$pathTo/$sfile"

    var='456\%\+\+'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='percent !~`´¨";:<>,?\|= ()[%^]plus%++'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='folder  
    next line'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='. n(am3'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='. n(am3. folder'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='underln_dir'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='hashtag_dir#'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='space   in   dir'
    mkdir -p "${BATS_TMPDIR}/$var"
    var='dollar$dir'
    mkdir -p "${BATS_TMPDIR}/$var"

    var='@file4123<@#> !~`´¨";:<>,?\|= ()  ++  ??@#%symbols_#'
    touch "${BATS_TMPDIR}/$var"
    var='file $ symbol'
    touch "${BATS_TMPDIR}/$var"
    var='file  
    next line'
    touch "${BATS_TMPDIR}/$var"
    var='123%(\)´¨"!^&~`?|#%456'
    touch "${BATS_TMPDIR}/$var"
    var='dot.file'
    touch "${BATS_TMPDIR}/$var"
    var='name.dot.file'
    touch "${BATS_TMPDIR}/$var"
    var='.name.dot.file2'
    touch "${BATS_TMPDIR}/$var"
    var='name_+_-[]@#%symbols'
    touch "${BATS_TMPDIR}/$var"
    var='name4123<>??@#%symbols2'
    touch "${BATS_TMPDIR}/$var"
    var='parentesys()(0)space'
    touch "${BATS_TMPDIR}/$var"
    var='file   space1'
    touch "${BATS_TMPDIR}/$var"
    var='file   space.pdf'
    touch "${BATS_TMPDIR}/$var"
    var='123.@#%456'
    touch "${BATS_TMPDIR}/$var"
    var='brn.123.@#%456'
    touch "${BATS_TMPDIR}/$var"
    var='5123_+_-@#%456'
    touch "${BATS_TMPDIR}/$var"
    var='4123<>??@#%456'
    touch "${BATS_TMPDIR}/$var"
    var='3123()())456'
    touch "${BATS_TMPDIR}/$var"
    var='2123   456'
    touch "${BATS_TMPDIR}/$var"
    var='r________a````````p'
    touch "${BATS_TMPDIR}/${var}"
    var='._t_a_p_'
    touch "${BATS_TMPDIR}/$var"
    var='_._V_a_p_'
    touch "${BATS_TMPDIR}/$var"
    var='.q a p'
    touch "${BATS_TMPDIR}/$var"
    var='.q  a  p'
    touch "${BATS_TMPDIR}/$var"
    var='.q  a     p'
    touch "${BATS_TMPDIR}/$var"
    var='m a n'
    touch "${BATS_TMPDIR}/$var"
    var='m  a  n'
    touch "${BATS_TMPDIR}/$var"
    var='m  a   n'
    touch "${BATS_TMPDIR}/$var"
    var='m   a    n'
    touch "${BATS_TMPDIR}/$var"

}

teardown_file() {
    rm -r "/tmp/namestd"
}

@test "Test script if folder path contains spaces" {
    cd "${BATS_TMPDIR}/$pathTo" || return
    namestd -a 
    [ -d "${BATS_TMPDIR}/$pathTo/space_dir" ]
    [ -f "${BATS_TMPDIR}/$pathTo/space_in_file" ]
    cd "${BATS_TMPDIR}" || return

}
@test "Standarize folders name test" {

    namestd  
    [ -d "${BATS_TMPDIR}/folder_n_next_line" ]
    [ -d "${BATS_TMPDIR}/.n_am3" ]
    [ -d "${BATS_TMPDIR}/.n_am3._folder" ]
    [ -d "${BATS_TMPDIR}/underln_dir" ]
    [ -d "${BATS_TMPDIR}/hashtag_dir" ]
    [ -d "${BATS_TMPDIR}/space_in_dir" ]
    [ -d "${BATS_TMPDIR}/dollar_dir" ]
    [ -d "${BATS_TMPDIR}/percent_plus" ]
    [ -d "${BATS_TMPDIR}/456" ]

}
@test "Standarize files name test" {
    [ -f "${BATS_TMPDIR}/file4123_symbols" ]
    [ -f "${BATS_TMPDIR}/file_symbol" ]
    [ -f "${BATS_TMPDIR}/123_456" ]
    [ -f "${BATS_TMPDIR}/dot.file" ]
    [ -f "${BATS_TMPDIR}/name.dot.file" ]
    [ -f "${BATS_TMPDIR}/.name.dot.file2" ]
    [ -f "${BATS_TMPDIR}/file_n_next_line" ]
    [ -f "${BATS_TMPDIR}/name_-_symbols" ]
    [ -f "${BATS_TMPDIR}/name4123_symbols2" ]
    [ -f "${BATS_TMPDIR}/parentesys_0_space" ]
    [ -f "${BATS_TMPDIR}/file_space1" ]
    [ -f "${BATS_TMPDIR}/file_space.pdf" ]
    [ -f "${BATS_TMPDIR}/5123_-_456" ]
    [ -f "${BATS_TMPDIR}/4123_456" ]
    [ -f "${BATS_TMPDIR}/3123_456" ]
    [ -f "${BATS_TMPDIR}/2123_456" ]
    [ -f "${BATS_TMPDIR}/123._456" ]
    [ -f "${BATS_TMPDIR}/brn.123._456" ]
    [ -f "${BATS_TMPDIR}/r_a_p" ]
    [ -f "${BATS_TMPDIR}/.t_a_p" ]
    [ -f "${BATS_TMPDIR}/.V_a_p" ]
    [ -f "${BATS_TMPDIR}/.q_a_p" ]
    [ -f "${BATS_TMPDIR}/.q_a_p-2" ]
    [ -f "${BATS_TMPDIR}/.q_a_p-3" ]
    [ -f "${BATS_TMPDIR}/m_a_n" ]
    [ -f "${BATS_TMPDIR}/m_a_n-2" ]
    [ -f "${BATS_TMPDIR}/m_a_n-3" ]
    [ -f "${BATS_TMPDIR}/m_a_n-4" ]

}


