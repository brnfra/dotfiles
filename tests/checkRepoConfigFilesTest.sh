#! /bin/sh

#colors
reset=$(tput sgr0);
bold=$(tput bold);
italic=$(tput sitm);
green=$(tput setaf 34);
red=$(tput setaf 124);
SHUNIT_TEST_PREFIX=' Chk [if exists] --> '
SHUNIT_COLOR="always"
dotfilesDir="$HOME/Documents/Projects/git/dotfiles"

testRepoGitConfigFiles() {
    assertTrue ": 14 :${red}${bold}[FAIL]${reset} .gitconfig not found.		    " "[ -f $dotfilesDir/.gitconfig ]"
    assertTrue ": 15 :${red}${bold}[FAIL]${reset} .git-completion.bash not found.   " "[ -f $dotfilesDir/.git-completion.bash ]"
}

testRepoComptonConfigFile() {
    assertTrue ": 19 :${red}${bold}[FAIL]${reset} .config/compton/compton.conf not found." "[ -f $dotfilesDir/.config/compton/compton.conf ]"
}

testRepoWgetCurlConfigFiles() {
    assertTrue ": 23 :${red}${bold}[FAIL]${reset} .wgetrc not found." "[ -f $dotfilesDir/.wgetrc ]"
    assertTrue ": 24 :${red}${bold}[FAIL]${reset} .curlrc not found." "[ -f $dotfilesDir/.curlrc ]"
}

testRepoExistBashDir() {
    assertTrue ": 28 :${red}${bold}[FAIL]${reset} .bash [folder] not found." "[ -d $dotfilesDir/.bash ]"
}

testRepoExistBashFiles() {
    assertTrue ": 32 :${red}${bold}[FAIL]${reset} .bash aliases not found.	"   "[ -f $dotfilesDir/.bash/aliases ]"
    assertTrue ": 33 :${red}${bold}[FAIL]${reset} .bash exports not found.	"   "[ -f $dotfilesDir/.bash/exports ]"
    assertTrue ": 34 :${red}${bold}[FAIL]${reset} .bash extras not found.	"   "[ -f $dotfilesDir/.bash/extras ]"
    assertTrue ": 35 :${red}${bold}[FAIL]${reset} .bash functions not found.	"   "[ -f $dotfilesDir/.bash/functions ]"
    assertTrue ": 36 :${red}${bold}[FAIL]${reset} .bash input not found.	"   "[ -f $dotfilesDir/.bash/input ]"
    assertTrue ": 37 :${red}${bold}[FAIL]${reset} .bash logout not found.	"   "[ -f $dotfilesDir/.bash/logout ]"
    assertTrue ": 38 :${red}${bold}[FAIL]${reset} .bash profile not found.	"   "[ -f $dotfilesDir/.bash/profile ]"
    assertTrue ": 39 :${red}${bold}[FAIL]${reset} .bash prompt not found.	"   "[ -f $dotfilesDir/.bash/prompt ]"
}

testRepoExistVimConfig() {
    assertTrue ": 43 :${red}${bold}[FAIL]${reset} .vimrc not found." "[ -f $dotfilesDir/.vimrc ]"
}

testRepoExistGsimplecalConfigFile() {
    assertTrue ": 60 :${red}${bold}[FAIL]${reset} Gsimplecal config  not found.		    " "[ -f $dotfilesDir/.config/gsimplecal/config ]"
}

testRepoExistVifmConfigFiles() {
    assertTrue ": 48 :${red}${bold}[FAIL]${reset} vifmrc not found.		    " "[ -f $dotfilesDir/.config/vifm/vifmrc ]"
    assertTrue ": 49 :${red}${bold}[FAIL]${reset} vifm/scripts[folder] not found. " "[ -d $dotfilesDir/.config/vifm/scripts ]"
}

testRepoExistXfce4TerminalConfigFile() {
    assertTrue ": 53 :${red}${bold}[FAIL]${reset} terminalrc not found." "[ -f $dotfilesDir/.config/xfce4/terminal/terminalrc ]"
}

testRepoExistI3ConfigFiles() {
    assertTrue ": 57 :${red}${bold}[FAIL]${reset} i3/i3-get-window-criteria not found.		    "	"[ -f $dotfilesDir/.i3/i3-get-window-criteria ]"
    assertTrue ": 58 :${red}${bold}[FAIL]${reset} i3/config[i3wm]  not found.			    "	"[ -f $dotfilesDir/.i3/config ]"
    assertTrue ": 59 :${red}${bold}[FAIL]${reset} i3/i3blocks.conf not found.			    "	"[ -f $dotfilesDir/.i3/i3blocks.conf ]"
    assertTrue ": 60 :${red}${bold}[FAIL]${reset} i3/i3blocks_v.conf not found.			    "	"[ -f $dotfilesDir/.i3/i3blocks_v.conf ]"
    assertTrue ": 61 :${red}${bold}[FAIL]${reset} i3/i3-manjaro-default-config-backup not found.    "	"[ -f $dotfilesDir/.i3/i3-manjaro-default-config-backup ]"
    assertTrue ": 62 :${red}${bold}[FAIL]${reset} i3/autostart/i3config[script] not found.	    "	"[ -f $dotfilesDir/.i3/autostart/i3config ]"
    assertTrue ": 63 :${red}${bold}[FAIL]${reset} i3/autostart/wallpapers[script] not found.	    "	"[ -f $dotfilesDir/.i3/autostart/wallpapers ]"
}

testRepoExistI3ConfigDir() {
    assertTrue ": 67 :${red}${bold}[FAIL]${reset} ..i3/blocks [folder]  not found.  " "[ -d $dotfilesDir/.i3/i3blocks ]"
    assertTrue ": 68 :${red}${bold}[FAIL]${reset} .i3 [folder] not found.	    " "[ -d $dotfilesDir/.i3 ]"
}

testRepoExistNeoVimConfigFiles() {
    assertTrue ": 72 :${red}${bold}[FAIL]${reset} init.vim[neovim] not found.	" "[ -f $dotfilesDir/.config/nvim/init.vim ]"
    assertTrue ": 73 :${red}${bold}[FAIL]${reset} coc-settings[coc] not found.	" "[ -f $dotfilesDir/.config/nvim/coc-settings.json ]"
}


testRepoExistBinDir() {
    assertTrue ": 78 :${red}${bold}[FAIL]${reset} bin[folder] not found." "[ -d $dotfilesDir/bin/ ]"
}

testRepoExistBinFiles() {
    assertTrue ": 82 :${red}${bold}[FAIL]${reset} install not found.		    " "[ -f $dotfilesDir/bin/install ]"
    assertTrue ": 83 :${red}${bold}[FAIL]${reset} install_fonts not found.	    " "[ -f $dotfilesDir/bin/install_fonts ]"
    assertTrue ": 84 :${red}${bold}[FAIL]${reset} install_enviroments not found.    " "[ -f $dotfilesDir/bin/install_enviroment ]"
    assertTrue ": 85 :${red}${bold}[FAIL]${reset} install_pkgs_env not found.	    " "[ -f $dotfilesDir/bin/install_pkgs_enviroment ]"
    assertTrue ": 86 :${red}${bold}[FAIL]${reset} install_virt_manager not found.   " "[ -f $dotfilesDir/bin/install_virtual_manager ]"
    assertTrue ": 87 :${red}${bold}[FAIL]${reset} i3_config_install not found.	    " "[ -f $dotfilesDir/bin/i3_config_install ]"
    assertTrue ": 88 :${red}${bold}[FAIL]${reset} push_local_config not found.	    " "[ -f $dotfilesDir/bin/push_local_config ]"
    assertTrue ": 89 :${red}${bold}[FAIL]${reset} pull_config not found.	    " "[ -f $dotfilesDir/bin/pull_config ]"
    assertTrue ": 90 :${red}${bold}[FAIL]${reset} stage_local_config not found.	    " "[ -f $dotfilesDir/bin/stage_local_config ]"
    assertTrue ": 91 :${red}${bold}[FAIL]${reset} targz not found.		    " "[ -f $dotfilesDir/bin/targz ]"
    assertTrue ": 92 :${red}${bold}[FAIL]${reset} namestd not found.		    " "[ -f $dotfilesDir/bin/namestd ]"
    assertTrue ": 93 :${red}${bold}[FAIL]${reset} connection not found.		    " "[ -f $dotfilesDir/bin/connection ]"
    assertTrue ": 94 :${red}${bold}[FAIL]${reset} videostd not found.		    " "[ -f $dotfilesDir/bin/videostd ]"
    assertTrue ": 95 :${red}${bold}[FAIL]${reset} pdfstd not found.		    " "[ -f $dotfilesDir/bin/pdfstd ]"
    assertTrue ": 96 :${red}${bold}[FAIL]${reset} i3-scrot not found.		    " "[ -f $dotfilesDir/bin/i3-scrot ]"
    assertTrue ": 97 :${red}${bold}[FAIL]${reset} extract not found.		    " "[ -f $dotfilesDir/bin/extract ]"
    assertTrue ": 117 :${red}${bold}[FAIL]${reset} foldering media by date not found.	" "[ -f $HOME/bin/makeFolderByDate ]"
    assertTrue ": 117 :${red}${bold}[FAIL]${reset} foldering files by type not found.   " "[ -f $HOME/bin/makeFolderByType ]"
    assertTrue ": 99 :${red}${bold}[FAIL]${reset} item_size not found.		    " "[ -f $dotfilesDir/bin/item_size ]"
    assertTrue ": 100 :${red}${bold}[FAIL]${reset} rm_lineup not found.		    " "[ -f $dotfilesDir/bin/rm_linedup ]"

}
# Load and run shUnit2.
. shunit2


