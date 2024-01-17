#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=" Standarize names script --> "
SHUNIT_COLOR="always"
testDir="/tmp/tests/test_dir"
fail_msg=" We expect : "
testExecution() {
    cd "$testDir"
    namestd 1> /dev/null 
    assertTrue "${red}${bold}[FAIL]${reset}${LINENO}:Error found\n\n" $?
}

testRenameSpaceAndSymbols_File() {
    var='@file4123<@#> !~`´¨";:<>,?\|= ()  ++  ??@#%symbols_#'
    expect='file4123_symbols'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd  1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
 }

testRenameDollarSymbols_File() {
    var='file $ symbol'
    expect='file_symbol'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
 }

testRenameIFS_File() {
    var='file  
    next line'
    expect='file_n_next_line'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
 }


testRenameLatinSigns_File() {
    var='123%(\)´¨"!^&~`?|#%456'
    expect='123_456'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_DotFile() {
    var='dot.file'
    expect='dot.file'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
   }

testRename_File_DotDotFile() {
    var='name.dot.file'
    expect='name.dot.file'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_DotFile_DotDotFile() {
    var='.name.dot.file2'
    expect='.name.dot.file2'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Bars() {
    var='name_+_-[]@#%symbols'
    expect='name_symbols'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Symbols() {
    var='name4123<>??@#%symbols2'
    expect='name4123_symbols2'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
 }

testRename_File_Parentesis() {
    var='parentesys()(0)space'
    expect='parentesys_0_space'
    
    list='find . -type f'
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
}

testRename_File_Espace() {
    var='file   space1'
    expect='file_space1'
    
    list='find . -type f '
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -f $testDir/$expect ]"
    }

testRename_File_EspaceDot() {
    var='file   space.pdf'
    expect='file_space.pdf'
    
    list='find . -type f '
    touch "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
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
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}./$pathTo/$expect${reset}\n$($list)\n" \
        "[ -f $expect ]"
    cd .. || return
   }

testRename_Folder() {
    var='percent !~`´¨";:<>,?\|= ()[%^]plus%++'
    expect='percent_plus'
    
    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd  1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRenameIFS_Folder() {
    var='folder  
    next line'
    expect='folder_n_next_line'
    
    list='find . -type d'
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -d $testDir/$expect ]"
 }

testRename_BeginDotFolder() {
    var='. n(am3'
    expect='._n_am3'
    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd  1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRename_DotsInFolder() {
    var='. n(am3. folder'
    expect='._n_am3._folder'
    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd  1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRenameUnderline_Folder() {

    var='underln_dir'
    expect='underln_dir'
    
    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -d $testDir/$expect ]"
    }

testRenameHashtag_Folder() {

    var='hashtag_dir#'
    expect='hashtag_dir'

    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -d $testDir/$expect ]"
   }

testRenameSpaceInName_Folder() {

    var='space   in   dir'
    expect='space_in_dir'

    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
        "[ -d $testDir/$expect ]"
   }

testDollarInName_Folder() {

    var='dollar$dir'
    expect='dollar_dir'

    list='find . -type d '
    mkdir -p "$testDir/$var"
    namestd 1> /dev/null 
    assertTrue \
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}$expect${reset}\n$($list)\n" \
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
	"${red}${bold}[FAIL]${reset}${LINENO}:${fail_msg}${green}./$pathTo/$expect${reset}\n$($list)\n" \
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
