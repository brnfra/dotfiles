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
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
 }

testRename_File() {
    var='123%@#%456'
    expect='123_456'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_DotFile() {
    var='dot.file'
    expect='dot.file'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
   }

testRename_File_DotDotFile() {
    var='name.dot.file'
    expect='name.dot.file'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Bars() {
    var='name_+_-@#%symbols'
    expect='name_symbols'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Symbols() {
    var='name4123<>??@#%symbols2'
    expect='name4123_symbols2'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
 }

testRename_File_Parentesis() {
    var='parentesys()(0)space'
    expect='parentesys_0_space'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Espace() {
    var='file   space1'
    expect='file_space1'
    
    list='find . -type f '
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
    }

testRename_File_EspaceDot() {
    var='file   space.pdf'
    expect='file_space.pdf'
    
    list='find . -type f '
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $testDir/$expect ]"
    }
testRename_WithSpaceInPath_File() {
    pathTo='space  in path'
    var='space   in   file'
    expect='space_in_file'
    list='find . -type f'
    mkdir -p "$testDir/$pathTo"
    touch "$testDir/$pathTo/$var"
    cd "$pathTo" || return
    namestd  1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}./$pathTo/$expect${reset}]. File list:\n$($list)\n" \
        "[ -f $expect ]"
    cd .. || return
   }

testRename_Folder() {
    var='percent_plus%++'
    expect='percent_plus'
    
    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRenameUnderline_Folder() {

    var='underln_dir'
    expect='underln_dir'
    
    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRenameHashtag_Folder() {

    var='hashtag_dir#'
    expect='hashtag_dir'

    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -d $testDir/$expect ]"
   }

testRenameSpaceInName_Folder() {

    var='space   in   dir'
    expect='space_in_dir'

    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}$expect${reset}]. File list:\n$($list)\n" \
        "[ -d $testDir/$expect ]"
   }


testRename_WithSpaceInFolderName() {

    pathTo='space  dirpath'
    var='space      dir'
    expect='space_dir'
    list='find . -type d '

    mkdir -p "$testDir/$pathTo/$var"
    cd "$pathTo" || return

    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}The results was not expected. We expected [${green}./$pathTo/$expect${reset}]. File list:\n$($list)\n" \
        "[ -d $expect ]"

    cd .. || return
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
