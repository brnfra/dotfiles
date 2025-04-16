#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. $HOME/bin/dotfiles_env

set -e
DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
PATH="$DIR/../src:$PATH"
local=$(pwd)
if [ "$local" = "$HOME" ];then
    exit 1
fi

doit() {
 if ! [ -e $1 ];then
    cInfo "File not found" "$1"
    exit 1	
 elif ! bats --print-output-on-failure  "$1" &> /tmp/log_tests;then
    cat /tmp/log_tests
    exit 2
 fi
}
export -f doit
parallel --halt now,fail=1 --bar  doit ::: \
    checkQuotes.bats \
    testIfExistConfigFiles.bats  \
    testRepoI3Config.bats \
    binMakeFolderByDateTest.bats \
    binMakeFolderByTypeTest.bats \
    binNamestdScriptTest.bats \
    testGitConfig.bats \
    testInstall.bats


