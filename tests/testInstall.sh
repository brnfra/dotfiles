#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
source $HOME/bin/dotfiles_env

SHUNIT_TEST_PREFIX=' Install Script Test --> '
SHUNIT_COLOR="always"

testInstallParamsHomeCheck() {
    
    BranchGetFromTest="$(cat $HOME/bin/install | sed '/curl/!d;s|https://raw.githubusercontent.com/brnfra/dotfiles/||g;s|/bin/dotfiles_env||g' | cut -d "\"" -f 2)"
    result="$(git --git-dir="$install_dir" --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    cInfo "Check install script bare Home branch" "$result"
    assertEquals \
	"${LINENO}: The result of ${BranchGetFromTest} was wrong" \
	"${BranchGetFromTest}" \
	"${result}"
    }

testInstallSiteCheckHome() {
    site="$(cat $HOME/bin/install | sed '/curl/!d' | cut -d "\"" -f 2)"
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $site)
    result="200"
    assertEquals \
	"${LINENO}: The result of ${response} was wrong" \
	"${response}" \
	"${result}"
    }

testInstallParamsRepoCheck() {
    BranchGetFromTest="$(cat $dotfiles_dir/bin/install | sed '/curl/!d;s|https://raw.githubusercontent.com/brnfra/dotfiles/||g;s|/bin/dotfiles_env||g' | cut -d "\"" -f 2)"
    result="$(git --git-dir=$dotfiles_dir/.git describe --all --exact-match HEAD | cut -d "/" -f 2)";
    cInfo "Check install script cloned repository branch" "$result"
    assertEquals \
	"${LINENO}: The result of ${BranchGetFromTest} was wrong" \
	"${BranchGetFromTest}" \
	"${result}"
    }

testInstallSiteCheckRepo() {
    site="$(cat $dotfiles_dir/bin/install | sed '/curl/!d' | cut -d "\"" -f 2)"
    response=$(curl --write-out '%{http_code}' --silent --output /dev/null $site)
    result="200"
    assertEquals \
	"${LINENO}: The result of ${response} was wrong" \
	"${response}" \
	"${result}"
    }


. shunit2
