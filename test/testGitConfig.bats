#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    source $HOME/bin/dotfiles_env
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "InstallRepoBranchCheck" {
    cInfo "Checking if Branch in Repository branch var in dotfiles_env  are the same"
    BranchTest="$(cat $dotfiles_dir/bin/dotfiles_env | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    [ "${BranchTest}" = "${result}" ]
}

@test "InstallHomeBranchCheck" {
    cInfo "Checking if Branch in Home and branch var in dotfiles_env  are the same"
    BranchTest="$(cat $HOME/bin/dotfiles_env | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    [ "${BranchTest}" =	"${result}" ]
}

@test "SyncHomeRepoBranchCheck" {
    cInfo "Checking if Branch in Home and RepoBranch are the same"
    BranchHome="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    RepoBranch="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    [ "${BranchHome}" =	"${RepoBranch}" ]
}

