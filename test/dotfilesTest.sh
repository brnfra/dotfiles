#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
source $HOME/bin/dotfiles_env

DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
PATH="$DIR/../src:$PATH"
local=$(pwd)
if [ "$local" = "$HOME" ];then
    exit 1
fi

parallel -P 2 -j 20 bats ::: \
    testIfExistConfigFiles.bats || exit 1 \
    testRepoI3Config.bats || exit 1\
    binMakeFolderByDateTest.bats || exit 1\
    binMakeFolderByTypeTest.bats || exit 1\
    binNamestdScriptTest.bats || exit 1\
    testGitConfig.bats || exit 1\
    testInstall.bats || exit 1
#testPkgInstalled.bats \

