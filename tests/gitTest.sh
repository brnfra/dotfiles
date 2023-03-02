#! /bin/sh
#colors
reset=$(tput sgr0);
bold=$(tput bold);
italic=$(tput sitm);
green=$(tput setaf 34);
red=$(tput setaf 124);
SHUNIT_TEST_PREFIX=' Git Test --> '
SHUNIT_COLOR="always"
dotfilesDir="$HOME/Documents/Projects/git/dotfiles"
testInstallRepoBranchCheck() {
    cd $dotfilesDir
    git checkout main &> /dev/null
    BranchTest="$(cat $dotfilesDir/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";
    assertEquals \
	": 30 : ${red}${bold}[FAIL]${reset} The result of ${BranchTest} was wrong\n\n" \
	"${BranchTest}" \
	"${result}"
    }
testPullConfigRepoBranchCheck() {
    cd $dotfilesDir
    git checkout main &> /dev/null
    BranchTest="$(cat $dotfilesDir/bin/pull_config | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
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
