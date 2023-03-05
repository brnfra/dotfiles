#! /bin/sh

#colors
reset=$(tput sgr0);
bold=$(tput bold);
italic=$(tput sitm);
green=$(tput setaf 34);
red=$(tput setaf 124);

SHUNIT_TEST_PREFIX=" Standard names --> "
SHUNIT_COLOR="always"
dotfilesDir="/home/devlab/teste/tests/tests"
testDir="$HOME/tests/test_dir"

testExecution() {
    cd "$testDir"
    namestd 1> /dev/null 
    assertTrue "${red}${bold}[FAIL]${reset} Error found\n\n" $?

}

testRenameSpaceAndSymbols_File() {
    var='file4123<@#>     ??@#%symbols'
    expect='file4123_symbols'
    
    list='find . -maxdepth 1 -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
 }

testRename_File() {
    var='123%@#%456'
    expect='123_456'
    
    list='find . -maxdepth 1 -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_DotFile() {
    var='dot.file'
    expect='dot.file'
    
    list='find . -maxdepth 1 -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
   }

testRename_File_DotDotFile() {
    var='name.dot.file'
    expect='name.dot.file'
    
    list='find . -maxdepth 1 -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Bars() {
    var='name_+_-@#%symbols'
    expect='name_symbols'
    
    list='find . -maxdepth 1 -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Symbols() {
    var='name4123<>??@#%symbols2'
    expect='name4123_symbols2'
    
    list='find . -maxdepth 1 -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
 }

testRename_File_Parentesis() {
    var='parentesys()(0)space'
    expect='parentesys_0_space'
    
    list='find . -maxdepth 1 -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Espace() {
    var='file   space'
    expect='file_space'
    
    list='find . -maxdepth 1 -type f '
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -f $testDir/$expect ]"
    }

testRename_Folder() {
    var='percent_plus%++'
    expect='percent_plus'
    
    list='find . -maxdepth 1 -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRenameUnderline_Folder() {

    var='underln_dir'
    expect='underln_dir'
    
    list='find . -maxdepth 1 -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRenameHashtag_Folder() {

    var='hashtag_dir#'
    expect='hashtag_dir'

    list='find . -maxdepth 1 -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}We not found correct name for $var was wrong.$($list)\n" \
        "[ -d $testDir/$expect ]"
   }


oneTimeSetUp() {
    # Load include to test.
    local=$(pwd)
    if [ "$local" = "$HOME" ];then
	exit 1
    fi
    mkdir -p "$testDir"
}
oneTimeTearDown() {
    cd ..
    rm -rf "$testDir"
}

# Load and run shUnit2.
. shunit2
