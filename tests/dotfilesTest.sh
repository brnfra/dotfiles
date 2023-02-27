#! /bin/sh
#colors
reset=$(tput sgr0);
bold=$(tput bold);
cyan=$(tput setaf 39);
SHUNIT_TEST_PREFIX=' #Main --> '
testExecutionMain() {
    printf "${cyan}${bold}[INFO]${reset} Check Git Configs Tests\n\n"
    ./gitTest.sh
    printf "${cyan}${bold}[INFO]${reset} Check if Repo config files exists.\n\n"
    ./checkRepoConfigFilesTest.sh
    printf "${cyan}${bold}[INFO]${reset} Check if Local config files exists.\n\n"
    ./checkHomeConfigFilesTest.sh
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works.\n\n"
    ./binNamestdScriptTest.sh
}
# Load and run shUnit2.
. shunit2
