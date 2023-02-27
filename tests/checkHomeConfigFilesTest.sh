#! /bin/sh
#colors
reset=$(tput sgr0);
bold=$(tput bold);
#italic=$(tput sitm);
#green=$(tput setaf 34);
red=$(tput setaf 124);
SHUNIT_TEST_PREFIX=' Check Local --> '
SHUNIT_COLOR="always"
testExecutionMain() {
    cd ..
    cat $HOME/bin/install 1> /dev/null
    assertTrue ": 16 :${red}${bold}[FAIL]${reset} Error found\n\n" $?
}
testGitConfigFiles() {
    assertTrue ": 21 :${red}${bold}[FAIL]${reset} .gitconfig not found.	    " "[ -f $HOME/.gitconfig ]"
    assertTrue ": 22 :${red}${bold}[FAIL]${reset} .git-completion.bash not found. " "[ -f $HOME/.git-completion.bash ]"
}
testComptonConfigFile() {
    assertTrue ": 27 :${red}${bold}[FAIL]${reset} .config/compton/compton.conf not found." "[ -f $HOME/.config/compton/compton.conf ]"
}
testWgetCurlConfigFiles() {
    assertTrue ": 32 :${red}${bold}[FAIL]${reset} .wgetrc not found." "[ -f $HOME/.wgetrc ]"
    assertTrue ": 33 :${red}${bold}[FAIL]${reset} .curlrc not found." "[ -f $HOME/.curlrc ]"
    }
testExistBashDir() {
    assertTrue ": 38 :${red}${bold}[FAIL]${reset} .bash [folder] not found." "[ -d $HOME/.bash ]"
}
testExistBashFiles() {
    assertTrue ": 43 :${red}${bold}[FAIL]${reset} .bash aliases not found.	"   "[ -f $HOME/.bash/aliases ]"
    assertTrue ": 44 :${red}${bold}[FAIL]${reset} .bash exports not found.	"   "[ -f $HOME/.bash/exports ]"
    assertTrue ": 45 :${red}${bold}[FAIL]${reset} .bash extras not found.	"   "[ -f $HOME/.bash/extras ]"
    assertTrue ": 46 :${red}${bold}[FAIL]${reset} .bash functions not found.	"   "[ -f $HOME/.bash/functions ]"
    assertTrue ": 47 :${red}${bold}[FAIL]${reset} .bash input not found.	"   "[ -f $HOME/.bash/input ]"
    assertTrue ": 48 :${red}${bold}[FAIL]${reset} .bash logout not found.	"   "[ -f $HOME/.bash/logout ]"
    assertTrue ": 49 :${red}${bold}[FAIL]${reset} .bash profile not found.	"   "[ -f $HOME/.bash/profile ]"
    assertTrue ": 50 :${red}${bold}[FAIL]${reset} .bash prompt not found.	"   "[ -f $HOME/.bash/prompt ]"
}
testExistVimConfig() {
    assertTrue ": 55 :${red}${bold}[FAIL]${reset} .vimrc not found." "[ -f $HOME/.vimrc ]"
}
testExistVifmConfigFiles() {
    assertTrue ": 60 :${red}${bold}[FAIL]${reset} vifmrc not found.		    " "[ -f $HOME/.config/vifm/vifmrc ]"
    assertTrue ": 61 :${red}${bold}[FAIL]${reset} vifm/scripts[folder] not found. " "[ -d $HOME/.config/vifm/scripts ]"
}
testExistXfce4TerminalConfigFile() {
    assertTrue ": 66 :${red}${bold}[FAIL]${reset} terminalrc not found." "[ -f $HOME/.config/xfce4/terminal/terminalrc ]"
}
testExistI3ConfigFiles() {
    assertTrue ": 71 :${red}${bold}[FAIL]${reset} i3/i3-get-window-criteria not found.	    "	"[ -f $HOME/.i3/i3-get-window-criteria ]"
    assertTrue ": 72 :${red}${bold}[FAIL]${reset} i3/config[i3wm]  not found.			    "	"[ -f $HOME/.i3/config ]"
    assertTrue ": 73 :${red}${bold}[FAIL]${reset} i3/i3blocks.conf not found.			    "	"[ -f $HOME/.i3/i3blocks.conf ]"
    assertTrue ": 74 :${red}${bold}[FAIL]${reset} i3/i3blocks_v.conf not found.		    "	"[ -f $HOME/.i3/i3blocks_v.conf ]"
    assertTrue ": 75 :${red}${bold}[FAIL]${reset} i3/i3-manjaro-default-config-backup not found.  "	"[ -f $HOME/.i3/i3-manjaro-default-config-backup ]"
    assertTrue ": 76 :${red}${bold}[FAIL]${reset} i3/autostart/i3config[script] not found.	    "	"[ -f $HOME/.i3/autostart/i3config ]"
    assertTrue ": 77 :${red}${bold}[FAIL]${reset} i3/autostart/wallpapers[script] not found.	    "	"[ -f $HOME/.i3/autostart/wallpapers ]"
}
testExistI3ConfigDir() {
    assertTrue ": 81 :${red}${bold}[FAIL]${reset} ..i3/blocks [folder]  not found." "[ -d $HOME/.i3/i3blocks ]"
    assertTrue ": 82 :${red}${bold}[FAIL]${reset} .i3 [folder] not found.	    " "[ -d $HOME/.i3 ]"
}
testExistNeoVimConfigFiles() {
    assertTrue ": 87 :${red}${bold}[FAIL]${reset} init.vim[neovim] not found.	" "[ -f $HOME/.config/nvim/init.vim ]"
    assertTrue ": 88 :${red}${bold}[FAIL]${reset} coc-settings[coc] not found." "[ -f $HOME/.config/nvim/coc-settings.json ]"
}
testExistBkpDir() {
    assertTrue ": 93 :${red}${bold}[FAIL]${reset} bkpdir[folder] not found." "[ -d $HOME/.config-bkp ]"
}
testExistBinDir() {
    assertTrue ": 97 :${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -d $HOME/bin ]"
}
testExistBinFiles() {
    assertTrue ": 101 :${red}${bold}[FAIL]${reset} install not found.		    " "[ -f $HOME/bin/install ]"
    assertTrue ": 102 :${red}${bold}[FAIL]${reset} install_fonts not found.	    " "[ -f $HOME/bin/install_fonts ]"
    assertTrue ": 103 :${red}${bold}[FAIL]${reset} install_enviroments not found.  " "[ -f $HOME/bin/install_enviroment ]"
    assertTrue ": 104 :${red}${bold}[FAIL]${reset} install_pkgs_env not found.	    " "[ -f $HOME/bin/install_pkgs_enviroment ]"
    assertTrue ": 105 :${red}${bold}[FAIL]${reset} install_virt_manager not found. " "[ -f $HOME/bin/install_virtual_manager ]"
    assertTrue ": 106 :${red}${bold}[FAIL]${reset} i3_config_install not found.    " "[ -f $HOME/bin/i3_config_install ]"
    assertTrue ": 107 :${red}${bold}[FAIL]${reset} push_local_config not found.    " "[ -f $HOME/bin/push_local_config ]"
    assertTrue ": 108 :${red}${bold}[FAIL]${reset} pull_config not found.	    " "[ -f $HOME/bin/pull_config ]"
    assertTrue ": 109 :${red}${bold}[FAIL]${reset} stage_local_config not found.   " "[ -f $HOME/bin/stage_local_config ]"
    assertTrue ": 110 :${red}${bold}[FAIL]${reset} targz not found.		    " "[ -f $HOME/bin/targz ]"
    assertTrue ": 111 :${red}${bold}[FAIL]${reset} namestd not found.		    " "[ -f $HOME/bin/namestd ]"
    assertTrue ": 112 :${red}${bold}[FAIL]${reset} connection not found.	    " "[ -f $HOME/bin/connection ]"
    assertTrue ": 113 :${red}${bold}[FAIL]${reset} videostd not found.		    " "[ -f $HOME/bin/videostd ]"
    assertTrue ": 114 :${red}${bold}[FAIL]${reset} pdfstd not found.		    " "[ -f $HOME/bin/pdfstd ]"
    assertTrue ": 115 :${red}${bold}[FAIL]${reset} i3-scrot not found.		    " "[ -f $HOME/bin/i3-scrot ]"
    assertTrue ": 116 :${red}${bold}[FAIL]${reset} extract not found.		    " "[ -f $HOME/bin/extract ]"
    assertTrue ": 117 :${red}${bold}[FAIL]${reset} foldering_media... not found.   " "[ -f $HOME/bin/foldering_media_year_month ]"
    assertTrue ": 118 :${red}${bold}[FAIL]${reset} item_size not found.	    " "[ -f $HOME/bin/item_size ]"
    assertTrue ": 119 :${red}${bold}[FAIL]${reset} rm_lineup not found.	    " "[ -f $HOME/bin/rm_linedup ]"
}
# Load and run shUnit2.
. shunit2
