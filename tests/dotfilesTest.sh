#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' #Main --> '
SHUNIT_COLOR="always"

testDotfilesConfigs() {
    clnInfo "Check Git Configs Tests"
    "$HOME/tests/testGitConfig.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Check if Repo config files exists. Miss one or more file.\n" $?
    clnInfo "Check if Repo config files exists."
    "$HOME/tests/testRepoConfigFiles.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Check if Local config files exists. Miss one or more file\n" $? 
    clnInfo "Check if Local config files exists."
    "$HOME/tests/testHomeConfigFiles.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Home config files exists Tests found.\n" $? 
    clnInfo "Check if Scripts in bin works[namestd]."
    "$HOME/tests/binNamestdScriptTest.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Scripts in bin works[namestd] Tests found\n" $? 
    clnInfo "Check if Scripts in bin works[fold by Date]."
    "$HOME/tests/binMakeFolderByDateTest.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Scripts in bin works[fold by Date]\n" $? 
    clnInfo "Check if Scripts in bin works[fold by Type]."
    "$HOME/tests/binMakeFolderByTypeTest.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error Scripts in bin works[fold by Type]\n" $? 
    "$HOME/tests/testPkgInstalled.sh"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error some packages are not installed\n" $? 

}
oneTimeSetUp() {
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
}

# Load and run shUnit2.
. shunit2

