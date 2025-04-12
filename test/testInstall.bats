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


@test "CheckResponseFromRepoSite" {
    get_branch_from_install="$(cat $dotfiles_dir/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    site="https://raw.githubusercontent.com/brnfra/dotfiles/${get_branch_from_install}/bin/dotfiles_env"

    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $site)
    result="200"
	[ "${response}" = "${result}" ]
    }

@test "CheckIfBranchClonedIsTheSameFromInstallScript" {
   # BranchGetFromTest="$(cat $dotfiles_dir/bin/install | sed '/githubusercontent/!d;s|https://raw.githubusercontent.com/brnfra/dotfiles/||g;s|/bin/dotfiles_env||g;q' | cut -d "\"" -f 2)"
    BranchGetFromTest="$(cat $dotfiles_dir/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    cInfo "Check install script branch in curl command. Don't match with cloned repository branch" "$result"
	[ "${BranchGetFromTest}" = "${result}" ]
    }

