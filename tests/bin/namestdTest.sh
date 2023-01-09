#! /bin/sh


testExecution() {

    cd ./tests
    ../namestd 1> /dev/null 
    assertTrue 'Error found' $?
}

testRename_File() {

    local=$(pwd)
    touch "$local/123@#%456"

    ../namestd 1> /dev/null 

    result=$(find 123_456 -maxdepth 1 -type f)
    assertEquals \
	"[FAIL]The result of 123@#%456' was wrong\n\n" \
	"123_456" \
	"${result}"

    }

testRename_File_Bars() {


    local=$(pwd)
    touch "$local/5123_+_-@#%456"

    ../namestd 1> /dev/null 

    result5=$(find 5123_456 -maxdepth 1 -type f)
    assertEquals \
	"[FAIL]The result5 of 5123_+_-@#%456'' was wrong\n\n" \
	"5123_456" \
	"${result5}"

    }

testRename_File_Symbols() {

    local=$(pwd)
    touch "$local/4123<>??@#%456"

    ../namestd 1> /dev/null 

    result4=$(find 4123_456 -maxdepth 1 -type f)
    assertEquals \
	"[FAIL]The result4 of 4123<>??@#%45 was wrong\n\n" \
	"4123_456" \
	"${result4}"
    }

testRename_File_Parentesis() {

    local=$(pwd)
    touch "$local/3123()())456"

    ../namestd 1> /dev/null 


    result3=$(find 3123_456 -maxdepth 1 -type f)
    assertEquals \
	"[FAIL]The result3 of 3123()())456 was wrong\n\n" \
	"3123_456" \
	"${result3}"

    }

testRename_File_Espace() {

    local=$(pwd)
    touch $local/'2123   456'


    ../namestd 1> /dev/null 

    result2=$(find 2123_456 -maxdepth 1 -type f)
    assertEquals \
	"[FAIL]The result2 of '2123   456' was wrong\n\n" \
	"2123_456" \
	"${result2}"

    }

testRename_Folder() {

    local=$(pwd)
    mkdir -p "$local/456%++"

    ../namestd 1> /dev/null 

    result6=$(find 456 -maxdepth 1 -type d |  sed 's|\.\/||gi')
    assertEquals \
	"[FAIL]The result of '456%++' was wrong\n\n" \
	"456" \
	"${result6}"

    }


oneTimeSetUp() {
    # Load include to test.
    mkdir -p ./tests/
}
oneTimeTearDown() {
    cd ..
    rm -rf ./tests
}

# Load and run shUnit2.
. shunit2
