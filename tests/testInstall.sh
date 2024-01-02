#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Install Script Test --> '
SHUNIT_COLOR="always"

testInstallParamsRepoCheck() {
    BranchGetFromTest="$(cat $dotfiles_dir/bin/install | sed '/curl/!d;s|https://raw.githubusercontent.com/brnfra/dotfiles/||g;s|/bin/dotfiles_env||g' | cut -d "\"" -f 2)"
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    assertEquals \
	"${LINENO}: The result of ${BranchGetFromTest} was wrong" \
	"${BranchGetFromTest}" \
	"${result}"
    }

testInstallParamsHomeCheck() {
    BranchGetFromTest="$(cat $HOME/bin/install | sed '/curl/!d;s|https://raw.githubusercontent.com/brnfra/dotfiles/||g;s|/bin/dotfiles_env||g' | cut -d "\"" -f 2)"

    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${LINENO}: The result of ${BranchGetFromTest} was wrong" \
	"${BranchGetFromTest}" \
	"${result}"
    }


. shunit2
