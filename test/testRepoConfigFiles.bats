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


@test "RepoGitConfigFiles()" {
  [ -f $dotfiles_dir/.gitconfig ]
  [ -f $dotfiles_dir/.git-completion.bash ]
}

@test "RepoComptonConfigFile()" {
  [ -f $dotfiles_dir/.config/compton/compton.conf ]
}

@test "RepoWgetCurlConfigFiles()" {
  [ -f $dotfiles_dir/.wgetrc ]
  [ -f $dotfiles_dir/.curlrc ]
}

@test "RepoExistBashDir()" {
  [ -d $dotfiles_dir/.bash ]
}

@test "RepoExistBashFiles()" {
  [ -f $dotfiles_dir/.bash/aliases ]
  [ -f $dotfiles_dir/.bash/exports ]
  [ -f $dotfiles_dir/.bash/extras ]
  [ -f $dotfiles_dir/.bash/functions ]
  [ -f $dotfiles_dir/.bash/input ]
  [ -f $dotfiles_dir/.bash/logout ]
  [ -f $dotfiles_dir/.bash/profile ]
  [ -f $dotfiles_dir/.bash/prompt ]
}

@test "RepoExistVimConfig()" {
  [ -f $dotfiles_dir/.vimrc ]
}

@test "RepoExistGsimplecalConfigFile()" {
  [ -f $dotfiles_dir/.config/gsimplecal/config ]
}

@test "RepoExistVifmConfigFiles()" {
  [ -f $dotfiles_dir/.config/vifm/vifmrc ]
  [ -d $dotfiles_dir/.config/vifm/scripts ]
}

@test "RepoExistXfce4TerminalConfigFile()" {
  [ -f $dotfiles_dir/.config/xfce4/terminal/terminalrc ]
}

@test "RepoExistI3ConfigFiles()" {
  [ -f $dotfiles_dir/.i3/i3-get-window-criteria ]
  [ -f $dotfiles_dir/.i3/config ]
  [ -f $dotfiles_dir/.i3/i3blocks.conf ]
  [ -f $dotfiles_dir/.i3/i3blocks_v.conf ]
  [ -f $dotfiles_dir/.i3/i3-manjaro-default-config-backup ]
  [ -f $dotfiles_dir/.i3/autostart/i3config ]
  [ -f $dotfiles_dir/.i3/autostart/wallpapers ]
}

@test "RepoExistI3ConfigDir()" {
  [ -d $dotfiles_dir/.i3/i3blocks ]
  [ -d $dotfiles_dir/.i3 ]
}

@test "RepoExistNeoVimConfigFiles()" {
  [ -f $dotfiles_dir/.config/nvim/init.vim ]
  [ -f $dotfiles_dir/.config/nvim/coc-settings.json ]
}

@test "RepoExistBinDir()" {
  [ -d $dotfiles_dir/bin/ ]
}

@test "RepoExistRofiConfig()" {
  [ -f $dotfiles_dir/.config/rofi/config.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/dmenu-top.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/dark-center.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/dark-center-rounded.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/arc-dark-top.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/arc-dark-right.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/arc-dark-left.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/arc-dark-fullscreen.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/arc-dark-center.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/arc-dark-center-rounded.rasi ]
  [ -f $dotfiles_dir/.config/rofi/themes/arc-dark-bottom.rasi ]
}

@test "RepoExistBinFiles()" {
  [ -f $dotfiles_dir/bin/bare_repo_pull ]
  [ -f $dotfiles_dir/bin/bare_merge ]
  [ -f $dotfiles_dir/bin/bkp_cfg_files ]
  [ -f $dotfiles_dir/bin/config_check ]
  [ -f $dotfiles_dir/bin/connection ]
  [ -f $dotfiles_dir/bin/dirs_config ]
  [ -f $dotfiles_dir/bin/dotfiles_env ]
  [ -f $dotfiles_dir/bin/enviroment_config ]
  [ -f $dotfiles_dir/bin/extract ]
  [ -f $dotfiles_dir/bin/type_fold ]
  [ -f $dotfiles_dir/bin/date_fold ]
  [ -f $dotfiles_dir/bin/get_fonts ]
  [ -f $dotfiles_dir/bin/get_packs_enviroment ]
  [ -f $dotfiles_dir/bin/get_packs_virtmanager ]
  [ -f $dotfiles_dir/bin/git_config ]
  [ -f $dotfiles_dir/bin/i3-scrot ]
  [ -f $dotfiles_dir/bin/i3_config ]
  [ -f $dotfiles_dir/bin/install ]
  [ -f $dotfiles_dir/bin/item_size ]
  [ -f $dotfiles_dir/bin/local_repo_pull ]
  [ -f $dotfiles_dir/bin/namestd ]
  [ -f $dotfiles_dir/bin/pdfstd ]
  [ -f $dotfiles_dir/bin/pull_config ]
  [ -f $dotfiles_dir/bin/push_config ]
  [ -f $dotfiles_dir/bin/push_config ]
  [ -f $dotfiles_dir/bin/rm_linedup ]
  [ -f $dotfiles_dir/bin/ssh_config ]
  [ -f $dotfiles_dir/bin/stage_config ]
  [ -f $dotfiles_dir/bin/targz ]
  [ -f $dotfiles_dir/bin/uninstall_bare_cfg ]
  [ -f $dotfiles_dir/bin/videostd ]
}




