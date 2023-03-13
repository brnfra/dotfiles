#! /bin/sh
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' #Main --> '
SHUNIT_COLOR="always"

testDotfilesConfigs() {
    clnInfo "Check Git Configs Tests"
    "$HOME/tests/testGitConfig.sh"
    assertTrue ": 13 :${red}${bold}[FAIL]${reset} Check if Repo config files exists. Miss one or more file.\n" $?
    clnInfo "Check if Repo config files exists."
    "$HOME/tests/testRepoConfigFiles.sh"
    assertTrue ": 15 :${red}${bold}[FAIL]${reset} Check if Local config files exists. Miss one or more file\n" $? 
    clnInfo "Check if Local config files exists."
    "$HOME/tests/testHomeConfigFiles.sh"
    assertTrue ": 17 :${red}${bold}[FAIL]${reset} Error Home config files exists Tests found.\n" $? 
    clnInfo "Check if Scripts in bin works[namestd]."
    "$HOME/tests/binNamestdScriptTest.sh"
    assertTrue ": 19 :${red}${bold}[FAIL]${reset} Error Scripts in bin works[namestd] Tests found\n" $? 
    clnInfo "Check if Scripts in bin works[fold by Date]."
    "$HOME/tests/binMakeFolderByDateTest.sh"
    assertTrue ": 21 :${red}${bold}[FAIL]${reset} Error Scripts Scripts in bin works[fold by Date]\n" $? 
    clnInfo "Check if Scripts in bin works[fold by Type]."
    "$HOME/tests/binMakeFolderByTypeTest.sh"
    assertTrue ": 21 :${red}${bold}[FAIL]${reset} Error Scripts Scripts in bin works[fold by Date]\n" $? 

}
oneTimeSetUp() {
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
}

# Load and run shUnit2.
. shunit2

