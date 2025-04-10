<<<<<<< HEAD
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
    testRepoConfigFiles.bats \
    testHomeConfigFiles.bats \
    testBareI3Config.bats \
    testRepoI3Config.bats \
    binMakeFolderByDateTest.bats \
    binMakeFolderByTypeTest.bats \
    binNamestdScriptTest.bats \
    testGitConfig.bats \
    testInstall.bats
#testPkgInstalled.bats \
||||||| empty tree
=======
#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
source $HOME/bin/dotfiles_env

DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
PATH="$DIR/../src:$PATH"
local=$(pwd)
if [ "$local" = "$HOME" ];then
    exit 1
fi


parallel bats -F pretty ::: \
    testRepoConfigFiles.bats \
    testHomeConfigFiles.bats \
    testBareI3Config.bats \
    testRepoI3Config.bats \
    binMakeFolderByDateTest.bats \
    binMakeFolderByTypeTest.bats \
    binNamestdScriptTest.bats \
    testGitConfig.bats \
    testInstall.bats
#testPkgInstalled.bats \
>>>>>>> 73aac843cbd85b5133698836c50b29330cbd7794
