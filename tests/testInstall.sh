#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Install Script Test --> '
SHUNIT_COLOR="always"

testInstallParamsRepoCheck() {
    BranchGetFromTest="$(cat $dotfiles_dir/bin/install | awk /curl/'{print $6}' | sed -E 's~https://(raw\.githubusercontent\.com/'$user_name'/dotfiles/)?([^:]+).*~\2~; s/"//g' | cut -d '/' -f 3)"
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    assertEquals \
	"${LINENO}: The result of ${BranchGetFromTest} was wrong" \
	"${BranchGetFromTest}" \
	"${result}"
    }

testInstallParamsHomeCheck() {
    BranchGetFromTest="$(cat $HOME/bin/install | awk /curl/'{print $6}' | sed -E 's~https://(raw\.githubusercontent\.com/'$user_name'/dotfiles/)?([^:]+).*~\2~;s/"//g' | cut -d '/' -f 3)"
    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${LINENO}: The result of ${BranchGetFromTest} was wrong" \
	"${BranchGetFromTest}" \
	"${result}"
    }


. shunit2
