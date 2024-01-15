#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Check if exists and valid --> '
SHUNIT_COLOR="always"


testLocalGitConfigFiles() {
    cInfo "Checking git config files"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .gitconfig not found.		    " "[ -f $HOME/.gitconfig ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .git-completion.bash not found.	    " "[ -f $HOME/.git-completion.bash ]"

}

testLocalComptonConfigFile() {
    cInfo "Checking compton config file"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .config/compton/compton.conf not found." "[ -f $HOME/.config/compton/compton.conf ]"

}

testLocalWgetCurlConfigFiles() {
    cInfo "Checking config files: " "wget and curl"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .wgetrc not found." "[ -f $HOME/.wgetrc ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .curlrc not found." "[ -f $HOME/.curlrc ]"

    }

testLocalExistBashDir() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash [folder] not found." "[ -d $HOME/.bash ]"

}

testLocalExistBashFiles() {
    cInfo "Checking config files" ".bash"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash aliases not found.	"   "[ -f $HOME/.bash/aliases ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash exports not found.	"   "[ -f $HOME/.bash/exports ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash extras not found.	"   "[ -f $HOME/.bash/extras ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash functions not found."   "[ -f $HOME/.bash/functions ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash input not found.	"   "[ -f $HOME/.bash/input ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash logout not found.	"   "[ -f $HOME/.bash/logout ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash profile not found.	"   "[ -f $HOME/.bash/profile ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash prompt not found.	"   "[ -f $HOME/.bash/prompt ]"

}

testLocalExistVimConfig() {
    cInfo "Checking config files: " ".vimrc"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .vimrc not found." "[ -f $HOME/.vimrc ]"
}

testLocalExistVifmConfigFiles() {
    cInfo "Checking config files: " ".vifm"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} vifmrc not found.			" "[ -f $HOME/.config/vifm/vifmrc ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} vifm/scripts[folder] not found.   " "[ -d $HOME/.config/vifm/scripts ]"

}

testLocalExistGsimplecalConfigFile() {
    cInfo "Checking config files: " "gsimplecal"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Gsimplecal config  not found.		    " "[ -f $HOME/.config/gsimplecal/config ]"
}

testLocalExistXfce4TerminalConfigFile() {
    cInfo "Checking config files: " "xfce4 terminal"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} terminalrc not found." "[ -f $HOME/.config/xfce4/terminal/terminalrc ]"

}

testLocalExistI3ConfigFiles() {
    cInfo "Checking config files: " "I3wm"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3-get-window-criteria not found.		    "	"[ -f $HOME/.i3/i3-get-window-criteria ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/config[i3wm]  not found.			    "	"[ -f $HOME/.i3/config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3blocks.conf not found.			    "	"[ -f $HOME/.i3/i3blocks.conf ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3blocks_v.conf not found.			    "	"[ -f $HOME/.i3/i3blocks_v.conf ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3-manjaro-default-config-backup not found.	    "	"[ -f $HOME/.i3/i3-manjaro-default-config-backup ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/autostart/i3config[script] not found.		    "	"[ -f $HOME/.i3/autostart/i3config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/autostart/wallpapers[script] not found.	    "	"[ -f $HOME/.i3/autostart/wallpapers ]"
}

testLocalExistI3ConfigDir() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} ..i3/blocks [folder]  not found.	" "[ -d $HOME/.i3/i3blocks ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .i3 [folder] not found.		" "[ -d $HOME/.i3 ]"

}

testLocalExistNeoVimConfigFiles() {
    cInfo "Checking config files: " "nvim"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} init.vim[neovim] not found.	" "[ -f $HOME/.config/nvim/init.vim ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} coc-settings[coc] not found.	" "[ -f $HOME/.config/nvim/coc-settings.json ]"

}

testRepoExistRofiConfig() {
    cInfo "Checking config files: " "$HOME/.config/rofi"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/config.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/dmenu-top.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/dark-center.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/dark-center-rounded.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/arc-dark-top.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/arc-dark-right.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/arc-dark-left.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/arc-dark-fullscreen.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/arc-dark-center.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/arc-dark-center-rounded.rasi ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -f $HOME/.config/rofi/themes/arc-dark-bottom.rasi ]"
}


testLocalExistBkpDir() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bkpdir[folder] not found." "[ -d $HOME/.config-bkp ]"
}

testLocalExistBinDir() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -d $HOME/bin ]"
}

testLocalExistBinFiles() {
    cInfo "Checking config files: " "/bin/scripts"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bare repo pull not found.		    " "[ -f $HOME/bin/bare_repo_pull ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bare merge not found.		    " "[ -f $HOME/bin/bare_merge ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bkp_cfg_files not found.		    " "[ -f $HOME/bin/bkp_cfg_files ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} config check not found.		    " "[ -f $HOME/bin/config_check ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} connection not found.		    " "[ -f $HOME/bin/connection ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} dirs_config  not found.		    " "[ -f $HOME/bin/dirs_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} dotfiles_env not found.		    " "[ -f $HOME/bin/dotfiles_env ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} enviroment_config not found.	    " "[ -f $HOME/bin/enviroment_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} extract not found.		    " "[ -f $HOME/bin/extract ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} foldering files by type not found.    " "[ -f $HOME/bin/type_fold ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} foldering media by date not found.    " "[ -f $HOME/bin/date_fold ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} get fonts not found.		    " "[ -f $HOME/bin/get_fonts ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} get_packs_env not found.		    " "[ -f $HOME/bin/get_packs_enviroment ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} get_packs_virtmanager not found.	    " "[ -f $HOME/bin/get_packs_virtmanager ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} git_config  not found.		    " "[ -f $HOME/bin/git_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3-scrot not found.		    " "[ -f $HOME/bin/i3-scrot ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3_config not found.		    " "[ -f $HOME/bin/i3_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} install not found.		    " "[ -f $HOME/bin/install ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} item_size not found.		    " "[ -f $HOME/bin/item_size ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} local repo pull not found.	    " "[ -f $HOME/bin/local_repo_pull ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} namestd not found.		    " "[ -f $HOME/bin/namestd ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} pdfstd not found.			    " "[ -f $HOME/bin/pdfstd ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} pull_config not found.		    " "[ -f $HOME/bin/pull_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} push_config not found.		    " "[ -f $HOME/bin/push_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} rm_lineup not found.		    " "[ -f $HOME/bin/rm_linedup ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} ssh_config  not found.		    " "[ -f $HOME/bin/ssh_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} stage_config not found.		    " "[ -f $HOME/bin/stage_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} targz not found.			    " "[ -f $HOME/bin/targz ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} uninstall_bare_cfg not found.	    " "[ -f $HOME/bin/uninstall_bare_cfg ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} videostd not found.		    " "[ -f $HOME/bin/videostd ]"

}

# Load and run shUnit2.
. shunit2


