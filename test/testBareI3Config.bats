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

@test "Repo i3wm Config test" {
  run i3 -C -c $HOME/.i3/config
  [ "$status" -eq 0 ]
}
@test "Repo I3blocks Config Is Valid" {
    run timeout --preserve-status 2.0s i3blocks -c $HOME/.i3/i3blocks.conf
  [ "$status" -eq 0 ]
}
@test "Repo I3blocks_v Config Is Valid" {
    run timeout --preserve-status 1.0s i3blocks -c $HOME/.i3/i3blocks_v.conf
  [ "$status" -eq 0 ]
}


