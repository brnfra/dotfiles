#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
source $HOME/bin/dotfiles_env

SHUNIT_TEST_PREFIX=' Check if i3 configs is valid --> '
SHUNIT_COLOR="always"

testBareConfigIsValid() {
    cInfo "Check I3 config file, Home, is valid config(I3 test): " "$HOME/.i3/config"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} I3 config[HOME] is not valid.                          " "i3 -C -c $HOME/.i3/config"
    cInfo "Check I3 scripts to generate I3 config file, Home, is valid config(I3 test): " "$HOME/bin/i3_config"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Script to generate I3 config[HOME] is not valid.       " "$HOME/bin/i3_config"
    cInfo "Check I3blocks config file, Home, is valid config(I3 test): " "$HOME/.i3/i3blocks.conf"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} I3block status line config[HOME] is not valid.         " "timeout --preserve-status 3.0s i3blocks -c $HOME/.i3/i3blocks.conf"
    cInfo "Check I3blocks_v config file, Home, is valid config(I3 test): " "$HOME/.i3/i3blocks_v.conf"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} I3block status line config[HOME] is not valid.         " "timeout --preserve-status 1.0s i3blocks -c $HOME/.i3/i3blocks_v.conf"
}
# Load and run shUnit2.
. shunit2


