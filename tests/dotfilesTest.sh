#! /bin/sh
. ../bin/dotfiles_env

SHUNIT_TEST_PREFIX=' #Main --> '

testDotfilesConfigs() {
    printf "${cyan}${bold}[INFO]${reset} Check Git Configs Tests\n"
    "$HOME/tests/testGitConfig.sh"
    assertTrue ": 13 :${red}${bold}[FAIL]${reset} Error Git Configs Tests found\n" $?
    printf "${cyan}${bold}[INFO]${reset} Check if Repo config files exists.\n"
    "$HOME/tests/testRepoConfigFiles.sh"
    assertTrue ": 15 :${red}${bold}[FAIL]${reset} Error Repo config files exists Tests found\n" $? 
    printf "${cyan}${bold}[INFO]${reset} Check if Local config files exists.\n"
    "$HOME/tests/testHomeConfigFiles.sh"
    assertTrue ": 17 :${red}${bold}[FAIL]${reset} Error Home config files exists Tests found.\n" $? 
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[namestd].\n"
    "$HOME/tests/binNamestdScriptTest.sh"
    assertTrue ": 19 :${red}${bold}[FAIL]${reset} Error Scripts in bin works[namestd] Tests found\n" $? 
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[fold by Date].\n"
    "$HOME/tests/binMakeFolderByDateTest.sh"
    assertTrue ": 21 :${red}${bold}[FAIL]${reset} Error Scripts Scripts in bin works[fold by Date]\n" $? 
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[fold by Type].\n"
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

