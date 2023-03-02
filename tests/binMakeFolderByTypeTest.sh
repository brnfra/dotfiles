#! /bin/sh

testByTypeDir="./test_dir"
#colors
reset=$(tput sgr0);
bold=$(tput bold);
red=$(tput setaf 124);
SHUNIT_TEST_PREFIX=' F. by Type --> '

testExecutionMain() {
    assertTrue ": 16 :${red}${bold}[FAIL]${reset} Error found\n\n" $?
}

testmakeFolderByType() {
    touch file1.ext1
    touch file2.ext2
    touch file3.ext3

    makeFolderByType  "$testByTypeDir"  > /dev/null 2> /dev/null 

    assertTrue ": 21 :${red}${bold}[FAIL]${reset} File not found file1.ext1." "[ -f $testByTypeDir/ext1/file1.ext1 ]"
    assertTrue ": 22 :${red}${bold}[FAIL]${reset} File not found file2.ext2." "[ -f $testByTypeDir/ext2/file2.ext2 ]"
    assertTrue ": 23 :${red}${bold}[FAIL]${reset} File not found file3.ext3." "[ -f $testByTypeDir/ext3/file3.ext3 ]"
}

oneTimeSetUp() {
    # Load include to test.
    mkdir -p $testByTypeDir

}
oneTimeTearDown() {
    rm -rf $testByTypeDir
}
# Load and run shUnit2.
. shunit2
