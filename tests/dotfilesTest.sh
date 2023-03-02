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
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[namestd].\n\n"
    ./binNamestdScriptTest.sh
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[fold by Date].\n\n"
    ./binMakeFolderByDateTest.sh
    printf "${cyan}${bold}[INFO]${reset} Check if Scripts in bin works[fold by Type].\n\n"
    ./binMakeFolderByTypeTest.sh

}

# Load and run shUnit2.
. shunit2

