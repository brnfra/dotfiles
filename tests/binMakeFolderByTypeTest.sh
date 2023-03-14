#! /bin/sh
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

testByTypeDir="test_dir"
SHUNIT_TEST_PREFIX=' F. by Type --> '
SHUNIT_COLOR="always"
error_msg="Not Found:  "
testExecutionMain() {
    assertTrue ": 16 :${red}${bold}[FAIL]${reset} Error found\n\n" $?
}

testfilesByType() {
    ext='ext1'
    var='file1name.'"$ext"
    expect="$ext/$var"
    
    list='find . -type f'
    touch "./$var"
    filesByType  "$testByTypeDir"       > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"

    ext='ext2'
    var='file1name.'"$ext"
    expect="$ext/$var"
    
    list='find . -type f'
    touch "./$var"
    filesByType  "$testByTypeDir"      > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"

    ext='ext3'
    var='file1name.'"$ext"
    expect="$ext/$var"
    
    list='find .  -type f'
    touch "./$var"
    filesByType  "$testByTypeDir"       > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"

}

testTwicefilesByType() {
    ext='sme1'
    var='fileSME1.'"$ext"
    expect="$ext/$var"
    
    list='find . -type f'
    touch "./$var"
    filesByType  "$testByTypeDir"       > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"

    ext='sme1'
    var='fileSME2.'"$ext"
    expect="$ext/$var"
    
    list='find . -type f'
    touch "./$var"
    filesByType  "$testByTypeDir"      > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"

}


testFilesWithDots() {
    ext='ext4'
    var='file1.name.'"$ext"
    expect="$ext/$var"
    
    list='find . -type f'
    touch ./"$var"
    filesByType  "$testByTypeDir"      > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"

    ext='ext5'
    var='file2.name.'"$ext"
    expect="$ext/$var"
    
    list='find . -type f'
    touch "./$var"
    filesByType  "$testByTypeDir"       > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"

    ext='ext6'
    var='file3.name.'"$ext"
    expect="$ext/$var"
    
    list='find . -type f'
    touch "./$var"
    filesByType  "$testByTypeDir"      > /dev/null 2> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}$error_msg${expect} \nResult:\n $($list)\n" \
        "[ -f $testByTypeDir/$expect ]"


}
oneTimeSetUp() {
    if [ "$(pwd)" = "$HOME" ];then
	exit 1
    fi
    # Load include to test.
    mkdir -p "$(pwd)/${testByTypeDir}/level1/level2/level3"
    cp "$0" "$(pwd)/${testByTypeDir}"
    cd "$testByTypeDir" || return
}
oneTimeTearDown() {
    cd .. || return
    rm -rf "$testByTypeDir"
}
# Load and run shUnit2.
. shunit2


