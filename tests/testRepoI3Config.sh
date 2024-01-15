#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
source $HOME/bin/dotfiles_env

SHUNIT_TEST_PREFIX=' Check if i3 configs is valid(Repository) --> '
SHUNIT_COLOR="always"

testRepoConfigIsValid() {

    cInfo "Check I3 config file, Repository, is a valid config(I3 test)" ":$dotfiles_dir/.i3/config"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} I3 config[Repository] is not valid.                          " "i3 -C -c $dotfiles_dir/.i3/config"
    cInfo "Check scripts to generate I3 config file" ":$dotfiles_dir/bin/i3_config"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Script to generate I3 config[Repository] is not valid.       " "$dotfiles_dir/bin/i3_config"
    cInfo "Check I3blocks config file, Repository, if is a valid config(I3 test)" ":$dotfiles_dir/bin/i3_config"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} I3block status line config[Repository] is not valid.         " "timeout --preserve-status 1.0s i3blocks -c $dotfiles_dir/.i3/i3blocks.conf"
    cInfo "Check I3blocks_v config file, Repository, if is a valid config(I3 test)" ":$dotfiles_dir/.i3/i3blocks_v.conf"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} I3block_v status line config[Repository] is not valid.         " "timeout --preserve-status 1.0s i3blocks -c $dotfiles_dir/.i3/i3blocks_v.conf"
}
# Load and run shUnit2.
. shunit2


