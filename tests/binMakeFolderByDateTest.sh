#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

testByDateDir="/tmp/tests/test_dir"
SHUNIT_TEST_PREFIX=' Folders by Date script --> '
SHUNIT_COLOR="always"
testExecutionMain() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Error found\n\n" $?
}

testFilesByDate_3level() {
    cd $testByDateDir || return 
    touch  $testByDateDir/level1/level2/level3/200301file4.png
    touch  $testByDateDir/level1/level2/200402file5.jpg
    touch  $testByDateDir/level1/200511file6.mkv
    
    date_fold "$testByDateDir" > /dev/null 2> /dev/null
    
    assertTrue \
	"${LINENO}:${red}${bold}[FAIL]${reset} Not found $testByDateDir/2003/01/200301file4.png" \
	"[ -f "$testByDateDir/2003/1/200301file4.png" ]"
    assertTrue \
	"${LINENO}:${red}${bold}[FAIL]${reset} Not found $testByDateDir/2004/02/200402file5.jpg" \
	"[ -f "$testByDateDir/2004/2/200402file5.jpg" ]"
    assertTrue \
	"${LINENO}:${red}${bold}[FAIL]${reset} Not found $testByDateDir/2005/11/200511file6.mkv" \
	"[ -f "$testByDateDir/2005/11/200511file6.mkv" ]"

}

testFilesByDate() {
    cd $testByDateDir || return 
    touch $testByDateDir/200001file1.png
    touch $testByDateDir/200102file2.jpg
    touch $testByDateDir/200211file3.mkv

    date_fold "$testByDateDir" > /dev/null 2> /dev/null
    
    assertTrue \
	"${LINENO}:${red}${bold}[FAIL]${reset} Not found $testByDateDir/2000/01/200001file1.png" \
	"[ -f "$testByDateDir/2000/1/200001file1.png" ]"
    assertTrue \
	"${LINENO}:${red}${bold}[FAIL]${reset} Not found $testByDateDir/2001/02/200102file2.jpg" \
	"[ -f "$testByDateDir/2001/2/200102file2.jpg" ]"
    assertTrue \
	"${LINENO}:${red}${bold}[FAIL]${reset} Not found $testByDateDir/2002/11/200211file3.mkv" \
	"[ -f "$testByDateDir/2002/11/200211file3.mkv" ]"
}


oneTimeSetUp() {
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
    # Load include to test.
    mkdir -p "$testByDateDir/level1/level2/level3/"
}
oneTimeTearDown() {
    rm -rf "$testByDateDir"
}
# Load and run shUnit2.
. shunit2
