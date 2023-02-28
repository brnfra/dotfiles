#! /bin/sh
#colors
reset=$(tput sgr0);
bold=$(tput bold);
#italic=$(tput sitm);
#green=$(tput setaf 34);
red=$(tput setaf 124);
SHUNIT_TEST_PREFIX=" Bin Scripts --> "
SHUNIT_COLOR="always"
testDir="./test_dir"
testExecution() {
    cd "$testDir"
    namestd 1> /dev/null 
    assertTrue "${red}${bold}[FAIL]${reset} Error found\n\n" $?
}
testRename_File() {
    touch "123@#%456"
    namestd 1> /dev/null 
    result=$(find 123_456 -maxdepth 1 -type f)
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of 123@#%456' was wrong\n\n" \
	"123_456" \
	"${result}"
    }
testRename_FileAlreadyRenamed() {
    touch "123@#%456"
    touch "123@+%456"
    touch "123@!%456"
    namestd 1> /dev/null 
    result=$(find 123_456 -maxdepth 1 -type f)
    result2=$(find 123_456_2 -maxdepth 1 -type f)
    result3=$(find 123_456_3 -maxdepth 1 -type f)
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of 123@#%456' was wrong\n\n" \
	"123_456" \
	"${result}"
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of 123@+%456' was wrong\n\n" \
	"123_456_2" \
	"${result2}"
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of 123@!%456' was wrong\n\n" \
	"123_456_3" \
	"${result3}"
    }
testRename_File_DotFile() {
    touch "123.@#%456"
    namestd 1> /dev/null 
    result=$(find 123.456 -maxdepth 1 -type f)
    assertEquals \
	"${_ASSERT_EQUALS_} ${red}${bold}[FAIL]${reset}The result of 123.@#%456' was wrong\n\n" \
	"123.456" \
	"${result}"
    }
testRename_File_DotDotFile() {
    touch "brn.123.@#%456"
    namestd 1> /dev/null 
    result=$(find "brn.123.456" -maxdepth 1 -type f)
    assertEquals \
	"${_ASSERT_EQUALS_} ${red}${bold}[FAIL]${reset}The result of brn.123.@#%456' was wrong\n\n" \
	"brn.123.456" \
	"${result}"
    }
testRename_File_Bars() {
    touch "5123_+_-@#%456"
    namestd 1> /dev/null 
    result=$(find 5123_456 -maxdepth 1 -type f)
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result5 of 5123_+_-@#%456'' was wrong\n\n" \
	"5123_456" \
	"${result}"
    }
testRename_File_Symbols() {
    touch "4123<>??@#%456"
    namestd 1> /dev/null 
    result=$(find 4123_456 -maxdepth 1 -type f)
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result4 of 4123<>??@#%45 was wrong\n\n" \
	"4123_456" \
	"${result}"
    }
testRename_File_Parentesis() {
    touch "3123()())456"
    namestd 1> /dev/null 
    result=$(find 3123_456 -maxdepth 1 -type f)
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result3 of 3123()())456 was wrong\n\n" \
	"3123_456" \
	"${result}"
    }
testRename_File_Espace() {
    touch '2123   456'
    namestd 1> /dev/null 
    result=$(find 2123_456 -maxdepth 1 -type f)
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result2 of '2123   456' was wrong\n\n" \
	"2123_456" \
	"${result}"
    }
testRename_Folder() {
    mkdir -p ./'456%++'
    namestd 1> /dev/null 
    result=$(find 456 -maxdepth 1 -type d |  sed 's|\.\/||gi')
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of '456%++' was wrong\n\n" \
	"456" \
	"${result}"
    }
testRename_DotFolder() {
    mkdir -p ./'.456%++'
    namestd 1> /dev/null 
    result=$(find '.456' -maxdepth 1 -type d |  sed 's|\.\/||gi')
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of '456%++' was wrong\n\n" \
	".456" \
	"${result}"
    }
testRename_DotSlashFolder() {
    mkdir -p ./'.456%++-dez-23'
    namestd 1> /dev/null 
    result=$(find '.456_-dez-23' -maxdepth 1 -type d |  sed 's|\.\/||gi')
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of '456%++-dez-23' was wrong\n\n" \
	".456_-dez-23" \
	"${result}"
    }
testRename_DoubleDotSlashFolder() {
    mkdir  ./'.bril.456%++-dez-23'
    namestd 1> /dev/null 
    result=$(find '.bril.456_-dez-23' -maxdepth 1 -type d |  sed 's|\.\/||gi')
    assertEquals \
	"${red}${bold}[FAIL]${reset}The result of '.bril.456%++-dez-23' was wrong\n\n" \
	'.bril.456_-dez-23' \
	"${result}"
    }
oneTimeSetUp() {
    # Load include to test.
    mkdir -p $testDir
}
oneTimeTearDown() {
    cd ..
    rm -rf $testDir
}
# Load and run shUnit2.
. shunit2
