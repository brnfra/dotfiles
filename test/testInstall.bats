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

@test "InstallParams Home Check" {
    
    BranchGetFromTest="$(cat $HOME/bin/install | sed '/curl/!d;s|https://raw.githubusercontent.com/brnfra/dotfiles/||g;s|/bin/dotfiles_env||g' | cut -d "\"" -f 2)"
    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    cInfo "Check install script bare Home branch" "$result"
	 [ "${BranchGetFromTest}" = "${result}" ]
    }

@test "InstallSiteCheckHome" {
    site="$(cat $HOME/bin/install | sed '/curl/!d' | cut -d "\"" -f 2)"
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $site)
    result="200"
	[ "${response}" = "${result}" ]
    }

@test "InstallParamsRepoCheck" {
    BranchGetFromTest="$(cat $dotfiles_dir/bin/install | sed '/curl/!d;s|https://raw.githubusercontent.com/brnfra/dotfiles/||g;s|/bin/dotfiles_env||g' | cut -d "\"" -f 2)"
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    cInfo "Check install script cloned repository branch" "$result"
	[ "${BranchGetFromTest}" = "${result}" ]
    }

@test "InstallSiteCheckRepo" {
    site="$(cat $dotfiles_dir/bin/install | sed '/curl/!d' | cut -d "\"" -f 2)"
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $site)
    result="200"
	[ "${response}" = "${result}" ]
    }


