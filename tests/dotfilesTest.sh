#! /bin/sh

#colors
reset=$(tput sgr0);
bold=$(tput bold);
cyan=$(tput setaf 39);

SHUNIT_TEST_PREFIX=' #Main --> '

testDotfilesConfigs() {
    printf "${cyan}${bold}[INFO]${reset} Check Git Configs Tests\n\n"
    "$HOME/tests/gitTest.sh"
    printf "${cyan}${bold}[INFO]${reset} Check if Repo config files exists.\n\n"
    "$HOME/tests/checkRepoConfigFilesTest.sh"
    printf "${cyan}${bold}[INFO]${reset} Check if Local config files exists.\n\n"
    "$HOME/tests/checkHomeConfigFilesTest.sh"
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[namestd].\n\n"
    "$HOME/tests/binNamestdScriptTest.sh"
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[fold by Date].\n\n"
    "$HOME/tests/binMakeFolderByDateTest.sh"
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[fold by Type].\n\n"
    "$HOME/tests/binMakeFolderByTypeTest.sh"

}
oneTimeSetUp() {
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
}

# Load and run shUnit2.
. shunit2

