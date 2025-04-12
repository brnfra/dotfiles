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
    cInfo "File not found"
    return 1	
 elif ! bats --print-output-on-failure  $1 ;then
    return 2
 else
     clean
 fi
}
export -f doit
parallel -j 20 --bar doit ::: \
    testIfExistConfigFiles.bats  \
    testRepoI3Config.bats \
    binMakeFolderByDateTest.bats \
    binMakeFolderByTypeTest.bats \
    binNamestdScriptTest.bats \
    testGitConfig.bats \
    testGitConfig2.bats \
    testInstall.bats 

#parallel -P 2 -j 20 bats ::: \
#    testIfExistConfigFiles.bats  || exit 1 \
#    testRepoI3Config.bats || exit 1\
#    binMakeFolderByDateTest.bats || exit 1\
#    binMakeFolderByTypeTest.bats || exit 1\
#    binNamestdScriptTest.bats || exit 1\
#    testGitConfig.bats || exit 1\
#    testInstall.bats || exit 1
#testPkgInstalled.bats \

