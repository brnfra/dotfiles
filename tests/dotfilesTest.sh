#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' #Main --> '
SHUNIT_COLOR="always"
 clnInfo "Main test"

testDotfilesConfigs() {
    "$HOME/tests/binMakeFolderByDateTest.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Scripts in bin works[fold by Date]\n" $? 
    "$HOME/tests/binMakeFolderByTypeTest.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Scripts in bin works[fold by Type]\n" $? 
    "$HOME/tests/binNamestdScriptTest.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Scripts in bin works[namestd] Tests found\n" $? 
    "$HOME/tests/testBareI3Config.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Check i3 config files validity(HOME).\n" $? 
    "$HOME/tests/testGitConfig.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Check if Repo config files exists. Miss one or more file.\n" $?
    "$HOME/tests/testHomeConfigFiles.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Home config files exists Tests found.\n" $? 
    "$HOME/tests/testInstall.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} The curl will get branch in wrong place. Check curl site install script line 23.\n" $? 
    #"$HOME/tests/testPkgInstalled.sh"
    #assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error some packages are not installed\n" $? 
    "$HOME/tests/testRepoConfigFiles.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Check if Local config files exists. Miss one or more file\n" $? 
    "$HOME/tests/testRepoI3Config.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Check i3 config files validity(Repository).\n" $? 

}
oneTimeSetUp() {
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
}

# Load and run shUnit2.
. shunit2

