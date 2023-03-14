#! /bin/sh
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Chk [if exists] --> '
SHUNIT_COLOR="always"

testRepoGitConfigFiles() {
    assertTrue ": 14 :${red}${bold}[FAIL]${reset} .gitconfig not found.		    " "[ -f $dotfiles_dir/.gitconfig ]"
    assertTrue ": 15 :${red}${bold}[FAIL]${reset} .git-completion.bash not found.   " "[ -f $dotfiles_dir/.git-completion.bash ]"
}

testRepoComptonConfigFile() {
    assertTrue ": 19 :${red}${bold}[FAIL]${reset} .config/compton/compton.conf not found." "[ -f $dotfiles_dir/.config/compton/compton.conf ]"
}

testRepoWgetCurlConfigFiles() {
    assertTrue ": 23 :${red}${bold}[FAIL]${reset} .wgetrc not found." "[ -f $dotfiles_dir/.wgetrc ]"
    assertTrue ": 24 :${red}${bold}[FAIL]${reset} .curlrc not found." "[ -f $dotfiles_dir/.curlrc ]"
}

testRepoExistBashDir() {
    assertTrue ": 28 :${red}${bold}[FAIL]${reset} .bash [folder] not found." "[ -d $dotfiles_dir/.bash ]"
}

testRepoExistBashFiles() {
    assertTrue ": 32 :${red}${bold}[FAIL]${reset} .bash aliases not found.	"   "[ -f $dotfiles_dir/.bash/aliases ]"
    assertTrue ": 33 :${red}${bold}[FAIL]${reset} .bash exports not found.	"   "[ -f $dotfiles_dir/.bash/exports ]"
    assertTrue ": 34 :${red}${bold}[FAIL]${reset} .bash extras not found.	"   "[ -f $dotfiles_dir/.bash/extras ]"
    assertTrue ": 35 :${red}${bold}[FAIL]${reset} .bash functions not found.	"   "[ -f $dotfiles_dir/.bash/functions ]"
    assertTrue ": 36 :${red}${bold}[FAIL]${reset} .bash input not found.	"   "[ -f $dotfiles_dir/.bash/input ]"
    assertTrue ": 37 :${red}${bold}[FAIL]${reset} .bash logout not found.	"   "[ -f $dotfiles_dir/.bash/logout ]"
    assertTrue ": 38 :${red}${bold}[FAIL]${reset} .bash profile not found.	"   "[ -f $dotfiles_dir/.bash/profile ]"
    assertTrue ": 39 :${red}${bold}[FAIL]${reset} .bash prompt not found.	"   "[ -f $dotfiles_dir/.bash/prompt ]"
}

testRepoExistVimConfig() {
    assertTrue ": 43 :${red}${bold}[FAIL]${reset} .vimrc not found." "[ -f $dotfiles_dir/.vimrc ]"
}

testRepoExistGsimplecalConfigFile() {
    assertTrue ": 60 :${red}${bold}[FAIL]${reset} Gsimplecal config  not found.		    " "[ -f $dotfiles_dir/.config/gsimplecal/config ]"
}

testRepoExistVifmConfigFiles() {
    assertTrue ": 48 :${red}${bold}[FAIL]${reset} vifmrc not found.		    " "[ -f $dotfiles_dir/.config/vifm/vifmrc ]"
    assertTrue ": 49 :${red}${bold}[FAIL]${reset} vifm/scripts[folder] not found. " "[ -d $dotfiles_dir/.config/vifm/scripts ]"
}

testRepoExistXfce4TerminalConfigFile() {
    assertTrue ": 53 :${red}${bold}[FAIL]${reset} terminalrc not found." "[ -f $dotfiles_dir/.config/xfce4/terminal/terminalrc ]"
}

testRepoExistI3ConfigFiles() {
    assertTrue ": 57 :${red}${bold}[FAIL]${reset} i3/i3-get-window-criteria not found.		    "	"[ -f $dotfiles_dir/.i3/i3-get-window-criteria ]"
    assertTrue ": 58 :${red}${bold}[FAIL]${reset} i3/config[i3wm]  not found.			    "	"[ -f $dotfiles_dir/.i3/config ]"
    assertTrue ": 59 :${red}${bold}[FAIL]${reset} i3/i3blocks.conf not found.			    "	"[ -f $dotfiles_dir/.i3/i3blocks.conf ]"
    assertTrue ": 60 :${red}${bold}[FAIL]${reset} i3/i3blocks_v.conf not found.			    "	"[ -f $dotfiles_dir/.i3/i3blocks_v.conf ]"
    assertTrue ": 61 :${red}${bold}[FAIL]${reset} i3/i3-manjaro-default-config-backup not found.    "	"[ -f $dotfiles_dir/.i3/i3-manjaro-default-config-backup ]"
    assertTrue ": 62 :${red}${bold}[FAIL]${reset} i3/autostart/i3config[script] not found.	    "	"[ -f $dotfiles_dir/.i3/autostart/i3config ]"
    assertTrue ": 63 :${red}${bold}[FAIL]${reset} i3/autostart/wallpapers[script] not found.	    "	"[ -f $dotfiles_dir/.i3/autostart/wallpapers ]"
}

testRepoExistI3ConfigDir() {
    assertTrue ": 67 :${red}${bold}[FAIL]${reset} ..i3/blocks [folder]  not found.  " "[ -d $dotfiles_dir/.i3/i3blocks ]"
    assertTrue ": 68 :${red}${bold}[FAIL]${reset} .i3 [folder] not found.	    " "[ -d $dotfiles_dir/.i3 ]"
}

testRepoExistNeoVimConfigFiles() {
    assertTrue ": 72 :${red}${bold}[FAIL]${reset} init.vim[neovim] not found.	" "[ -f $dotfiles_dir/.config/nvim/init.vim ]"
    assertTrue ": 73 :${red}${bold}[FAIL]${reset} coc-settings[coc] not found.	" "[ -f $dotfiles_dir/.config/nvim/coc-settings.json ]"
}


testRepoExistBinDir() {
    assertTrue ": 78 :${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -d $dotfiles_dir/bin/ ]"
}

testRepoExistBinFiles() {
    assertTrue ": 82 :${red}${bold}[FAIL]${reset} install not found.		    " "[ -f $dotfiles_dir/bin/install ]"
    assertTrue ": 84 :${red}${bold}[FAIL]${reset} make enviroments not found.	    " "[ -f $dotfiles_dir/bin/make_env ]"
    assertTrue ": 100 :${red}${bold}[FAIL]${reset} rm_lineup not found.		    " "[ -f $dotfiles_dir/bin/rm_linedup ]"
    assertTrue ": 99 :${red}${bold}[FAIL]${reset} item_size not found.		    " "[ -f $dotfiles_dir/bin/item_size ]"
    assertTrue ": 88 :${red}${bold}[FAIL]${reset} push_config not found.	    " "[ -f $dotfiles_dir/bin/push_config ]"
    assertTrue ": 89 :${red}${bold}[FAIL]${reset} pull_config not found.	    " "[ -f $dotfiles_dir/bin/pull_config ]"
    assertTrue ": 95 :${red}${bold}[FAIL]${reset} pdfstd not found.		    " "[ -f $dotfiles_dir/bin/pdfstd ]"
    assertTrue ": 97 :${red}${bold}[FAIL]${reset} extract not found.		    " "[ -f $dotfiles_dir/bin/extract ]"
    assertTrue ": 91 :${red}${bold}[FAIL]${reset} targz not found.		    " "[ -f $dotfiles_dir/bin/targz ]"
    assertTrue ": 92 :${red}${bold}[FAIL]${reset} namestd not found.		    " "[ -f $dotfiles_dir/bin/namestd ]"
    assertTrue ": 93 :${red}${bold}[FAIL]${reset} connection not found.		    " "[ -f $dotfiles_dir/bin/connection ]"
    assertTrue ": 94 :${red}${bold}[FAIL]${reset} videostd not found.		    " "[ -f $dotfiles_dir/bin/videostd ]"
    assertTrue ": 96 :${red}${bold}[FAIL]${reset} i3-scrot not found.		    " "[ -f $dotfiles_dir/bin/i3-scrot ]"

    assertTrue ": 102 :${red}${bold}[FAIL]${reset} get fonts not found.			" "[ -f $dotfiles_dir/bin/get_fonts ]"
    assertTrue ": 109 :${red}${bold}[FAIL]${reset} stage_config not found.		" "[ -f $dotfiles_dir/bin/stage_config ]"
    assertTrue ": 117 :${red}${bold}[FAIL]${reset} foldering media by date not found.	" "[ -f $dotfiles_dir/bin/filesByDate ]"
    assertTrue ": 117 :${red}${bold}[FAIL]${reset} foldering files by type not found.   " "[ -f $dotfiles_dir/bin/filesByType ]"
    assertTrue ": 113 :${red}${bold}[FAIL]${reset} enviroment_config not found.		" "[ -f $dotfiles_dir/bin/enviroment_config ]"
    assertTrue ": 114 :${red}${bold}[FAIL]${reset} get_packs_env not found.		" "[ -f $dotfiles_dir/bin/get_packs_enviroment ]"
    assertTrue ": 115 :${red}${bold}[FAIL]${reset} get_packs_virtmanager not found.	" "[ -f $dotfiles_dir/bin/get_packs_virtmanager ]"
    assertTrue ": 116 :${red}${bold}[FAIL]${reset} i3_config not found.			" "[ -f $dotfiles_dir/bin/i3_config ]"
    assertTrue ": 120 :${red}${bold}[FAIL]${reset} push_config not found.		" "[ -f $dotfiles_dir/bin/push_config ]"
    assertTrue ": 121 :${red}${bold}[FAIL]${reset} bare repo pull not found.		" "[ -f $dotfiles_dir/bin/bare_repo_pull ]"
    assertTrue ": 122 :${red}${bold}[FAIL]${reset} local repo pull not found.		" "[ -f $dotfiles_dir/bin/local_repo_pull ]"
    assertTrue ": 123 :${red}${bold}[FAIL]${reset} bkp_cfg_files not found.		" "[ -f $dotfiles_dir/bin/bkp_cfg_files ]"
    assertTrue ": 124 :${red}${bold}[FAIL]${reset} uninstall_bare_cfg not found.	" "[ -f $dotfiles_dir/bin/uninstall_bare_cfg ]"
    assertTrue ": 125 :${red}${bold}[FAIL]${reset} config check not found.		" "[ -f $dotfiles_dir/bin/config_check ]"
    assertTrue ": 126 :${red}${bold}[FAIL]${reset} dotfiles_env not found.		" "[ -f $dotfiles_dir/bin/dotfiles_env ]"
    assertTrue ": 127 :${red}${bold}[FAIL]${reset} dirs_config  not found.		" "[ -f $dotfiles_dir/bin/dirs_config ]"
    assertTrue ": 128 :${red}${bold}[FAIL]${reset} git_config  not found.		" "[ -f $dotfiles_dir/bin/git_config ]"
    assertTrue ": 129 :${red}${bold}[FAIL]${reset} ssh_config  not found.		" "[ -f $dotfiles_dir/bin/ssh_config ]"

}
# Load and run shUnit2.
. shunit2


