#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Chk [if exists] --> '
SHUNIT_COLOR="always"

testRepoGitConfigFiles() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .gitconfig not found.		    " "[ -f $dotfiles_dir/.gitconfig ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .git-completion.bash not found.	    " "[ -f $dotfiles_dir/.git-completion.bash ]"
}

testRepoComptonConfigFile() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .config/compton/compton.conf not found." "[ -f $dotfiles_dir/.config/compton/compton.conf ]"
}

testRepoWgetCurlConfigFiles() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .wgetrc not found." "[ -f $dotfiles_dir/.wgetrc ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .curlrc not found." "[ -f $dotfiles_dir/.curlrc ]"
}

testRepoExistBashDir() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash [folder] not found." "[ -d $dotfiles_dir/.bash ]"
}

testRepoExistBashFiles() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash aliases not found.	"   "[ -f $dotfiles_dir/.bash/aliases ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash exports not found.	"   "[ -f $dotfiles_dir/.bash/exports ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash extras not found.	"   "[ -f $dotfiles_dir/.bash/extras ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash functions not found."   "[ -f $dotfiles_dir/.bash/functions ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash input not found.	"   "[ -f $dotfiles_dir/.bash/input ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash logout not found.	"   "[ -f $dotfiles_dir/.bash/logout ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash profile not found.	"   "[ -f $dotfiles_dir/.bash/profile ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .bash prompt not found.	"   "[ -f $dotfiles_dir/.bash/prompt ]"
}

testRepoExistVimConfig() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .vimrc not found." "[ -f $dotfiles_dir/.vimrc ]"
}

testRepoExistGsimplecalConfigFile() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} Gsimplecal config  not found.		    " "[ -f $dotfiles_dir/.config/gsimplecal/config ]"
}

testRepoExistVifmConfigFiles() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} vifmrc not found.			" "[ -f $dotfiles_dir/.config/vifm/vifmrc ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} vifm/scripts[folder] not found.	" "[ -d $dotfiles_dir/.config/vifm/scripts ]"
}

testRepoExistXfce4TerminalConfigFile() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} terminalrc not found." "[ -f $dotfiles_dir/.config/xfce4/terminal/terminalrc ]"
}

testRepoExistI3ConfigFiles() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3-get-window-criteria not found.		    "	"[ -f $dotfiles_dir/.i3/i3-get-window-criteria ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/config[i3wm]  not found.			    "	"[ -f $dotfiles_dir/.i3/config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3blocks.conf not found.			    "	"[ -f $dotfiles_dir/.i3/i3blocks.conf ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3blocks_v.conf not found.			    "	"[ -f $dotfiles_dir/.i3/i3blocks_v.conf ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/i3-manjaro-default-config-backup not found.	    "	"[ -f $dotfiles_dir/.i3/i3-manjaro-default-config-backup ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/autostart/i3config[script] not found.		    "	"[ -f $dotfiles_dir/.i3/autostart/i3config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3/autostart/wallpapers[script] not found.	    "	"[ -f $dotfiles_dir/.i3/autostart/wallpapers ]"
}

testRepoExistI3ConfigDir() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} ..i3/blocks [folder]  not found.  " "[ -d $dotfiles_dir/.i3/i3blocks ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} .i3 [folder] not found.		" "[ -d $dotfiles_dir/.i3 ]"
}

testRepoExistNeoVimConfigFiles() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} init.vim[neovim] not found.	" "[ -f $dotfiles_dir/.config/nvim/init.vim ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} coc-settings[coc] not found.	" "[ -f $dotfiles_dir/.config/nvim/coc-settings.json ]"
}


testRepoExistBinDir() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -d $dotfiles_dir/bin/ ]"
}

testRepoExistBinFiles() {
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} install not found.		    " "[ -f $dotfiles_dir/bin/install ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} rm_lineup not found.		    " "[ -f $dotfiles_dir/bin/rm_linedup ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} item_size not found.		    " "[ -f $dotfiles_dir/bin/item_size ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} push_config not found.		    " "[ -f $dotfiles_dir/bin/push_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} pull_config not found.		    " "[ -f $dotfiles_dir/bin/pull_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} pdfstd not found.			    " "[ -f $dotfiles_dir/bin/pdfstd ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} extract not found.		    " "[ -f $dotfiles_dir/bin/extract ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} targz not found.			    " "[ -f $dotfiles_dir/bin/targz ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} namestd not found.		    " "[ -f $dotfiles_dir/bin/namestd ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} connection not found.		    " "[ -f $dotfiles_dir/bin/connection ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} videostd not found.		    " "[ -f $dotfiles_dir/bin/videostd ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3-scrot not found.		    " "[ -f $dotfiles_dir/bin/i3-scrot ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} get fonts not found.		    " "[ -f $dotfiles_dir/bin/get_fonts ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} stage_config not found.		    " "[ -f $dotfiles_dir/bin/stage_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} foldering media by date not found.    " "[ -f $dotfiles_dir/bin/filesByDate ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} foldering files by type not found.    " "[ -f $dotfiles_dir/bin/filesByType ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} enviroment_config not found.	    " "[ -f $dotfiles_dir/bin/enviroment_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} get_packs_env not found.		    " "[ -f $dotfiles_dir/bin/get_packs_enviroment ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} get_packs_virtmanager not found.	    " "[ -f $dotfiles_dir/bin/get_packs_virtmanager ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} i3_config not found.		    " "[ -f $dotfiles_dir/bin/i3_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} push_config not found.		    " "[ -f $dotfiles_dir/bin/push_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bare repo pull not found.		    " "[ -f $dotfiles_dir/bin/bare_repo_pull ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} local repo pull not found.	    " "[ -f $dotfiles_dir/bin/local_repo_pull ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} bkp_cfg_files not found.		    " "[ -f $dotfiles_dir/bin/bkp_cfg_files ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} uninstall_bare_cfg not found.	    " "[ -f $dotfiles_dir/bin/uninstall_bare_cfg ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} config check not found.		    " "[ -f $dotfiles_dir/bin/config_check ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} dotfiles_env not found.		    " "[ -f $dotfiles_dir/bin/dotfiles_env ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} dirs_config  not found.		    " "[ -f $dotfiles_dir/bin/dirs_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} git_config  not found.		    " "[ -f $dotfiles_dir/bin/git_config ]"
    assertTrue "${LINENO}:${red}${bold}[FAIL]${reset} ssh_config  not found.		    " "[ -f $dotfiles_dir/bin/ssh_config ]"

}
# Load and run shUnit2.
. shunit2


