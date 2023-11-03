#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Git Test --> '
SHUNIT_COLOR="always"
testInstallRepoBranchCheck() {
    cd $dotfiles_dir
    BranchTest="$(cat $dotfiles_dir/bin/dotfiles_env | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${LINENO}: The result of ${BranchTest} was wrong" \
	"${BranchTest}" \
	"${result}"
    }
testInstallHomeBranchCheck() {
    cd $HOME
    BranchTest="$(cat $HOME/bin/dotfiles_env | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${LINENO}: The result of ${BranchTest} was wrong" \
	"${BranchTest}" \
	"${result}"
    }
testSyncHomeRepoBranchCheck() {
    cd $HOME
    BranchTest="$(cat $HOME/bin/dotfiles_env | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    BranchHome="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    cd "$dotfiles_dir"
    RepoBranch="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${LINENO}: The result of ${BranchTest}(Home dotfiles) was wrong" \
	"${BranchHome}" \
	"${RepoBranch}"
    }

. shunit2
