#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    
    source $HOME/bin/dotfiles_env
    BATS_TMPDIR="/tmp/type_fold"
    error_msg="Not Found:  "
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
    # Load include to test.
    local=$(pwd)
    mkdir -p "${BATS_TMPDIR}"
    cp "$0" "${BATS_TMPDIR}"
    cd "${BATS_TMPDIR}" || return
    if [ "$(pwd)" = "$HOME" ];then
	exit 1
    fi
    touch "${BATS_TMPDIR}"/file1name.ext{1..3}
    touch "${BATS_TMPDIR}"/fileSME{1..3}.sme1
    touch "${BATS_TMPDIR}"/file1.name.ext{4..6}

}
teardown() {
    rm -rf "${BATS_TMPDIR}"
}

@test "type_fold" {
    type_fold  "${BATS_TMPDIR}"    # > /dev/null 2> /dev/null 
    [ -f "${BATS_TMPDIR}/ext1/file1name.ext1" ]
    [ -f "${BATS_TMPDIR}/ext2/file1name.ext2" ]
    [ -f "${BATS_TMPDIR}/ext3/file1name.ext3" ]
    [ -f "${BATS_TMPDIR}/sme1/fileSME1.sme1" ]
    [ -f "${BATS_TMPDIR}/sme1/fileSME2.sme1" ]
    [ -f "${BATS_TMPDIR}/sme1/fileSME3.sme1" ]
    [ -f "${BATS_TMPDIR}/ext4/file1.name.ext4" ]
    [ -f "${BATS_TMPDIR}/ext5/file1.name.ext5" ]
    [ -f "${BATS_TMPDIR}/ext6/file1.name.ext6" ]
}
