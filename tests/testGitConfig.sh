#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
source  $HOME/bin/dotfiles_env

SHUNIT_TEST_PREFIX=' Git Test --> '
SHUNIT_COLOR="always"
testInstallRepoBranchCheck() {
    BranchTest="$(cat $dotfiles_dir/bin/dotfiles_env | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    assertEquals \
	"${LINENO}: The result of ${BranchTest} was wrong" \
	"${BranchTest}" \
	"${result}"
    }
testInstallHomeBranchCheck() {
    BranchTest="$(cat $HOME/bin/dotfiles_env | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${LINENO}: The result of ${BranchTest} was wrong" \
	"${BranchTest}" \
	"${result}"
    }
testSyncHomeRepoBranchCheck() {
    BranchHome="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    RepoBranch="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    assertEquals \
	"${LINENO}: The result of ${BranchHome}(Home dotfiles) wasn't expected(the same)" \
	"${BranchHome}" \
	"${RepoBranch}"
    }

. shunit2
