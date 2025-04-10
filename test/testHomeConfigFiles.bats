<<<<<<< HEAD
#!/usr/bin/env bash

setup() {
    source $HOME/bin/dotfiles_env
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

@test "LocalGitConfigFiles" {
    [ -f $HOME/.gitconfig ]
    [ -f $HOME/.git-completion.bash ]
}

@test "LocalComptonConfigFile" {
    [ -f $HOME/.config/compton/compton.conf ]
}

@test "LocalWgetCurlConfigFiles" {
    [ -f $HOME/.wgetrc ]
    [ -f $HOME/.curlrc ]
}

@test "LocalExistBashDir" {
    [ -d $HOME/.bash ]
}

@test "LocalExistBashFiles" {
    [ -f $HOME/.bash/aliases ]
    [ -f $HOME/.bash/exports ]
    [ -f $HOME/.bash/extras ]
    [ -f $HOME/.bash/functions ]
    [ -f $HOME/.bash/input ]
    [ -f $HOME/.bash/logout ]
    [ -f $HOME/.bash/profile ]
    [ -f $HOME/.bash/prompt ]

}

@test "LocalExistVimConfig" {
    [ -f $HOME/.vimrc ]
}

@test "LocalExistVifmConfigFiles" {
    [ -f $HOME/.config/vifm/vifmrc ]
    [ -d $HOME/.config/vifm/scripts ]

}

@test "LocalExistGsimplecalConfigFile" {
    [ -f $HOME/.config/gsimplecal/config ]
}

@test "LocalExistXfce4TerminalConfigFile" {
    [ -f $HOME/.config/xfce4/terminal/terminalrc ]

}

@test "LocalExistI3ConfigFiles" {
    if ! i3 -v;then
        skip "Pkg i3wm ins't installed."
    fi
    [ -f $HOME/.i3/i3-get-window-criteria ]
    [ -f $HOME/.i3/config ]
    [ -f $HOME/.i3/i3blocks.conf ]
    [ -f $HOME/.i3/i3blocks_v.conf ]
    [ -f $HOME/.i3/i3-manjaro-default-config-backup ]
    [ -f $HOME/.i3/autostart/i3config ]
    [ -f $HOME/.i3/autostart/wallpapers ]
    [ -d $HOME/.i3/i3blocks ]
    [ -d $HOME/.i3 ]
}

@test "LocalExistNeoVimConfigFiles" {
    [ -f $HOME/.config/nvim/init.vim ]
    [ -f $HOME/.config/nvim/coc-settings.json ]

}

@test "RepoExistRofiConfig" {
    if ! [ -d $HOME/.config/rofi ]; then
        skip "No rofi config folder"
    fi
    [ -f $HOME/.config/rofi/config.rasi ]
    [ -f $HOME/.config/rofi/themes/dmenu-top.rasi ]
    [ -f $HOME/.config/rofi/themes/dark-center.rasi ]
    [ -f $HOME/.config/rofi/themes/dark-center-rounded.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-top.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-right.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-left.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-fullscreen.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-center.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-center-rounded.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-bottom.rasi ]
}

@test "LocalExistBkpDir" {
    [ -d $HOME/.config-bkp ]
}

@test "LocalExistBinFiles" {
    if ! [ -d $HOME/bin ]; then
        skip "There's not bin folder!" 
    fi
    [ -f $HOME/bin/bare_repo_pull ]
    [ -f $HOME/bin/bare_merge ]
    [ -f $HOME/bin/bkp_cfg_files ]
    [ -f $HOME/bin/config_check ]
    [ -f $HOME/bin/connection ]
    [ -f $HOME/bin/dirs_config ]
    [ -f $HOME/bin/dotfiles_env ]
    [ -f $HOME/bin/enviroment_config ]
    [ -f $HOME/bin/extract ]
    [ -f $HOME/bin/type_fold ]
    [ -f $HOME/bin/date_fold ]
    [ -f $HOME/bin/get_fonts ]
    [ -f $HOME/bin/get_packs_enviroment ]
    [ -f $HOME/bin/get_packs_virtmanager ]
    [ -f $HOME/bin/git_config ]
    [ -f $HOME/bin/i3-scrot ]
    [ -f $HOME/bin/i3_config ]
    [ -f $HOME/bin/install ]
    [ -f $HOME/bin/item_size ]
    [ -f $HOME/bin/local_repo_pull ]
    [ -f $HOME/bin/namestd ]
    [ -f $HOME/bin/pdfstd ]
    [ -f $HOME/bin/pull_config ]
    [ -f $HOME/bin/push_config ]
    [ -f $HOME/bin/rm_linedup ]
    [ -f $HOME/bin/ssh_config ]
    [ -f $HOME/bin/stage_config ]
    [ -f $HOME/bin/targz ]
    [ -f $HOME/bin/uninstall_bare_cfg ]
    [ -f $HOME/bin/videostd ]
}
||||||| empty tree
=======
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


@test "LocalGitConfigFiles" {
    [ -f $HOME/.gitconfig ]
    [ -f $HOME/.git-completion.bash ]
}

@test "LocalComptonConfigFile" {
    [ -f $HOME/.config/compton/compton.conf ]
}

@test "LocalWgetCurlConfigFiles" {
    [ -f $HOME/.wgetrc ]
    [ -f $HOME/.curlrc ]
}

@test "LocalExistBashDir" {
    [ -d $HOME/.bash ]
}

@test "LocalExistBashFiles" {
    [ -f $HOME/.bash/aliases ]
    [ -f $HOME/.bash/exports ]
    [ -f $HOME/.bash/extras ]
    [ -f $HOME/.bash/functions ]
    [ -f $HOME/.bash/input ]
    [ -f $HOME/.bash/logout ]
    [ -f $HOME/.bash/profile ]
    [ -f $HOME/.bash/prompt ]

}

@test "LocalExistVimConfig" {
    [ -f $HOME/.vimrc ]
}

@test "LocalExistVifmConfigFiles" {
    [ -f $HOME/.config/vifm/vifmrc ]
    [ -d $HOME/.config/vifm/scripts ]

}

@test "LocalExistGsimplecalConfigFile" {
    [ -f $HOME/.config/gsimplecal/config ]
}

@test "LocalExistXfce4TerminalConfigFile" {
    [ -f $HOME/.config/xfce4/terminal/terminalrc ]

}

@test "LocalExistI3ConfigFiles" {
    if ! i3 -v;then
        skip "Pkg i3wm ins't installed."
    fi
    [ -f $HOME/.i3/i3-get-window-criteria ]
    [ -f $HOME/.i3/config ]
    [ -f $HOME/.i3/i3blocks.conf ]
    [ -f $HOME/.i3/i3blocks_v.conf ]
    [ -f $HOME/.i3/i3-manjaro-default-config-backup ]
    [ -f $HOME/.i3/autostart/i3config ]
    [ -f $HOME/.i3/autostart/wallpapers ]
    [ -d $HOME/.i3/i3blocks ]
    [ -d $HOME/.i3 ]
}

@test "LocalExistNeoVimConfigFiles" {
    [ -f $HOME/.config/nvim/init.vim ]
    [ -f $HOME/.config/nvim/coc-settings.json ]

}

@test "RepoExistRofiConfig" {
    if ! [ -d $HOME/.config/rofi ]; then
        skip "No rofi config folder"
    fi
    [ -f $HOME/.config/rofi/config.rasi ]
    [ -f $HOME/.config/rofi/themes/dmenu-top.rasi ]
    [ -f $HOME/.config/rofi/themes/dark-center.rasi ]
    [ -f $HOME/.config/rofi/themes/dark-center-rounded.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-top.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-right.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-left.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-fullscreen.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-center.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-center-rounded.rasi ]
    [ -f $HOME/.config/rofi/themes/arc-dark-bottom.rasi ]
}


@test "LocalExistBkpDir" {
    [ -d $HOME/.config-bkp ]
}

@test "LocalExistBinFiles" {
    if ! [ -d $HOME/bin ]; then
        skip "There's not bin folder!" 
    fi
    [ -f $HOME/bin/bare_repo_pull ]
    [ -f $HOME/bin/bare_merge ]
    [ -f $HOME/bin/bkp_cfg_files ]
    [ -f $HOME/bin/config_check ]
    [ -f $HOME/bin/connection ]
    [ -f $HOME/bin/dirs_config ]
    [ -f $HOME/bin/dotfiles_env ]
    [ -f $HOME/bin/enviroment_config ]
    [ -f $HOME/bin/extract ]
    [ -f $HOME/bin/type_fold ]
    [ -f $HOME/bin/date_fold ]
    [ -f $HOME/bin/get_fonts ]
    [ -f $HOME/bin/get_packs_enviroment ]
    [ -f $HOME/bin/get_packs_virtmanager ]
    [ -f $HOME/bin/git_config ]
    [ -f $HOME/bin/i3-scrot ]
    [ -f $HOME/bin/i3_config ]
    [ -f $HOME/bin/install ]
    [ -f $HOME/bin/item_size ]
    [ -f $HOME/bin/local_repo_pull ]
    [ -f $HOME/bin/namestd ]
    [ -f $HOME/bin/pdfstd ]
    [ -f $HOME/bin/pull_config ]
    [ -f $HOME/bin/push_config ]
    [ -f $HOME/bin/rm_linedup ]
    [ -f $HOME/bin/ssh_config ]
    [ -f $HOME/bin/stage_config ]
    [ -f $HOME/bin/targz ]
    [ -f $HOME/bin/uninstall_bare_cfg ]
    [ -f $HOME/bin/videostd ]
}
>>>>>>> 73aac843cbd85b5133698836c50b29330cbd7794
