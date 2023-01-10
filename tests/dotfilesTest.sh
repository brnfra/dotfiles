#! /bin/sh

testExecutionMain() {

    cd ..
    cat ./bin/install 1> /dev/null
    assertTrue 'Error found' $?
}


testInstallBranchMain() {

    local=$(pwd)

    git checkout main &> /dev/null
    localBranchTest="$(cat $local/bin/install | grep "git clone" | awk '{print $4}')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    
    assertEquals \
	"[FAIL]The result of ${localBranchTest} was wrong\n\n" \
	"${localBranchTest}" \
	"${result}"

    }

testPullConfigBranchMain() {

    local=$(pwd)

    git checkout main &> /dev/null
    localBranchTest="$(cat $local/bin/pull_config | grep "config pull" | awk '{print $4}' | sed '1d')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    
    assertEquals \
	"[FAIL]The result of ${localBranchTest} was wrong\n\n" \
	"${localBranchTest}" \
	"${result}"

    }

testInstallBranchNotebook() {

    local=$(pwd)

    git checkout notebook-cfg 1>/dev/null
    localBranchTest="$(cat $local/bin/install | grep "git clone" | awk '{print $4}')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    
    assertEquals \
	"[FAIL]The result of ${localBranchTest} was wrong\n\n" \
	"${localBranchTest}" \
	"${result}"

    }

#oneTimeSetUp() {
#    # Load include to test.
#    #mkdir -p ./tests/
#}
oneTimeTearDown() {
#    #cd ..
    git checkout main
}

# Load and run shUnit2.
. shunit2

