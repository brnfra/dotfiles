#! /bin/sh
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Git Test --> '
SHUNIT_COLOR="always"
testInstallRepoBranchCheck() {
    cd $dotfiles_dir
    git checkout main &> /dev/null
    BranchTest="$(cat $dotfiles_dir/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	": 30 : ${red}${bold}[FAIL]${reset} The result of ${BranchTest} was wrong\n\n" \
	"${BranchTest}" \
	"${result}"
    }
testPullConfigRepoBranchCheck() {
    cd $dotfiles_dir
    git checkout main &> /dev/null
    BranchTest="$(cat $dotfiles_dir/bin/pull_config | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${red}${bold}[FAIL]${reset} The result of ${BranchTest} was wrong\n\n" \
	"${BranchTest}" \
	"${result}"
    }
testInstallHomeBranchCheck() {
    cd $HOME
    git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" checkout main &> /dev/null
    BranchTest="$(cat $HOME/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	": 30 : ${red}${bold}[FAIL]${reset} The result of ${BranchTest} was wrong\n\n" \
	"${BranchTest}" \
	"${result}"
    }
testPullConfigHomeBranchCheck() {
    cd $HOME
    git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" checkout main &> /dev/null
    BranchTest="$(cat $HOME/bin/pull_config | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME" describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	"${red}${bold}[FAIL]${reset} The result of ${BranchTest} was wrong\n\n" \
	"${BranchTest}" \
	"${result}"
    }
# Load and run shUnit2.
. shunit2
