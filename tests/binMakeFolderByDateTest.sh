#! /bin/sh

testByDateDir="$HOME/tests/test_dir"
#colors
reset=$(tput sgr0);
bold=$(tput bold);
red=$(tput setaf 124);
SHUNIT_TEST_PREFIX=' F. by Date --> '

testExecutionMain() {
    assertTrue ": 16 :${red}${bold}[FAIL]${reset} Error found\n\n" $?
}

testmakeFolderByDate_3level() {
    touch  $testByDateDir/level1/level2/level3/200301file4.png
    touch  $testByDateDir/level1/level2/200402file5.jpg
    touch  $testByDateDir/level1/200511file6.mkv
    
    makeFolderByDate "$testByDateDir" > /dev/null 2> /dev/null
    
    assertTrue \
	": 21 :${red}${bold}[FAIL]${reset} Not found $testByDateDir/2003/01/200301file4.png" \
	"[ -f "$testByDateDir/2003/1/200301file4.png" ]"
    assertTrue \
	": 22 :${red}${bold}[FAIL]${reset} Not found $testByDateDir/2004/02/200402file5.jpg" \
	"[ -f "$testByDateDir/2004/2/200402file5.jpg" ]"
    assertTrue \
	": 23 :${red}${bold}[FAIL]${reset} Not found $testByDateDir/2005/11/200511file6.mkv" \
	"[ -f "$testByDateDir/2005/11/200511file6.mkv" ]"

}
testmakeFolderByDate() {
    
    touch $testByDateDir/200001file1.png
    touch $testByDateDir/200102file2.jpg
    touch $testByDateDir/200211file3.mkv

    makeFolderByDate "$testByDateDir" > /dev/null 2> /dev/null
    
    assertTrue \
	": 34 :${red}${bold}[FAIL]${reset} Not found $testByDateDir/2000/01/200001file1.png" \
	"[ -f "$testByDateDir/2000/1/200001file1.png" ]"
    assertTrue \
	": 37 :${red}${bold}[FAIL]${reset} Not found $testByDateDir/2001/02/200102file2.jpg" \
	"[ -f "$testByDateDir/2001/2/200102file2.jpg" ]"
    assertTrue \
	": 40 :${red}${bold}[FAIL]${reset} Not found $testByDateDir/2002/11/200211file3.mkv" \
	"[ -f "$testByDateDir/2002/11/200211file3.mkv" ]"
}


oneTimeSetUp() {
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
    # Load include to test.
    mkdir -p "$testByDateDir"
    mkdir -p "$testByDateDir/level1/level2/level3"
}
oneTimeTearDown() {
    rm -rf "$testByDateDir"
}
# Load and run shUnit2.
. shunit2
