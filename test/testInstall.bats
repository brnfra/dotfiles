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

@test "Install Params BARE Home Check" {
    BranchGetFromTest="$(cat $HOME/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')" 
    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    cInfo "Check install script bare Home branch" "$result ; branch = ${BranchGetFromTest} " 
	 [ "${BranchGetFromTest}" = "${result}" ]
    }

@test "Install Site Check BARE Home" {
    get_branch_from_install_file="$(cat $HOME/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    site="https://raw.githubusercontent.com/brnfra/dotfiles/${get_branch_from_install_file}/bin/dotfiles_env"
    
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $site)
    result="200"
	cInfo "response = [$reponse]; branch = ${get_branch_from_install_file} ; site = ${site}" 
	[ "${response}" = "${result}" ]
    }

@test "Install Params CLONED Repo Check" {
    BranchGetFromTest="$(cat $dotfiles_dir/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')" 
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    cInfo "Check install script cloned repository branch" "$result ; branch = ${BranchGetFromTest}" 
	[ "${BranchGetFromTest}" = "${result}" ]
    }

@test "Install Site Check CLONED Repo" {
    get_branch_from_install_file="$(cat $dotfiles_dir/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    site="https://raw.githubusercontent.com/brnfra/dotfiles/${get_branch_from_install_file}/bin/dotfiles_env"
    
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $site)
    result="200"
	cInfo "response = [$reponse]; branch = ${get_branch_from_install_file} ; site = ${site}" 
	[ "${response}" = "${result}" ]
    }


