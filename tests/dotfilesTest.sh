#! /bin/sh

testExecutionMain() {

    cd ..
    cat ./bin/install 1> /dev/null
    assertTrue 'Error found' $?
}


testInstallBranchMain() {

    local=$(pwd)

    git checkout main &> /dev/null
    localBranchTest="$(cat $local/bin/install | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";

    assertEquals \
	"[FAIL] The result of ${localBranchTest} was wrong\n\n" \
	"${localBranchTest}" \
	"${result}"

    }

testPullConfigBranchMain() {

    local=$(pwd)

    git checkout main &> /dev/null
    localBranchTest="$(cat $local/bin/pull_config | awk /branch=/'{print $1}' | sed 's/branch="//g;s/"//g')"
    result="$(git describe --all --exact-match HEAD | cut -d "/" -f 2 )";

    assertEquals \
	"[FAIL] The result of ${localBranchTest} was wrong\n\n" \
	"${localBranchTest}" \
	"${result}"

    }

testGitConfigFiles() {
    assertTrue '[FAIL] .gitconfig not found.' "[ -f $HOME/.gitconfig ]"
    assertTrue '[FAIL] .git-completion.bash not found.' "[ -f $HOME/.git-completion.bash ]"
}

testComptonConfigFile() {
    assertTrue '[FAIL] .config/compton/compton.conf not found.' "[ -f $HOME/.config/compton/compton.conf ]"
}

testWgetCurlConfigFiles() {
    assertTrue '[FAIL] .wgetrc not found.' "[ -f $HOME/.wgetrc ]"
    assertTrue '[FAIL] .curlrc not found.' "[ -f $HOME/.curlrc ]"
}

testExistBashDir() {
    assertTrue '[FAIL] .bash [folder] not found.' "[ -d $HOME/.bash ]"
}

testExistBashFiles() {
    assertTrue '[FAIL] .bash aliases not found.' "[ -f $HOME/.bash/aliases ]"
    assertTrue '[FAIL] .bash exports not found.' "[ -f $HOME/.bash/exports ]"
    assertTrue '[FAIL] .bash extras not found.' "[ -f $HOME/.bash/extras ]"
    assertTrue '[FAIL] .bash functions not found.' "[ -f $HOME/.bash/functions ]"
    assertTrue '[FAIL] .bash input not found.' "[ -f $HOME/.bash/input ]"
    assertTrue '[FAIL] .bash logout not found.' "[ -f $HOME/.bash/logout ]"
    assertTrue '[FAIL] .bash profile not found.' "[ -f $HOME/.bash/profile ]"
    assertTrue '[FAIL] .bash prompt not found.' "[ -f $HOME/.bash/prompt ]"
}

testExistVimConfig() {
    assertTrue '[FAIL] .vimrc not found.' "[ -f $HOME/.vimrc ]"
}


testExistVifmConfigFiles() {
    assertTrue '[FAIL] vifmrc not found.' "[ -f $HOME/.config/vifm/vifmrc ]"
    assertTrue '[FAIL] vifm/scripts[folder] not found.' "[ -d $HOME/.config/vifm/scripts ]"
}

testExistXfce4TerminalConfigFile() {
    assertTrue '[FAIL] terminalrc not found.' "[ -f $HOME/.config/xfce4/terminal/terminalrc ]"
}

testExistI3ConfigFiles() {
    assertTrue '[FAIL] i3/i3-get-window-criteria not found.' "[ -f $HOME/.i3/i3-get-window-criteria ]"
    assertTrue '[FAIL] i3/config[i3wm]  not found.' "[ -f $HOME/.i3/config ]"
    assertTrue '[FAIL] i3/i3blocks.conf not found.' "[ -f $HOME/.i3/i3blocks.conf ]"
    assertTrue '[FAIL] i3/i3blocks_v.conf not found.' "[ -f $HOME/.i3/i3blocks_v.conf ]"
    assertTrue '[FAIL] i3/i3-manjaro-default-config-backup not found.' "[ -f $HOME/.i3/i3-manjaro-default-config-backup ]"
    assertTrue '[FAIL] i3/autostart/i3config[script] not found.' "[ -f $HOME/.i3/autostart/i3config ]"
    assertTrue '[FAIL] i3/autostart/wallpapers[script] not found.' "[ -f $HOME/.i3/autostart/wallpapers ]"
}

testExistI3ConfigDir() {
    assertTrue '[FAIL] ..i3/blocks [folder]  not found.' "[ -d $HOME/.i3/i3blocks ]"
    assertTrue '[FAIL] .i3 [folder] not found.' "[ -d $HOME/.i3 ]"
}

testExistNeoVimConfigFiles() {
    assertTrue '[FAIL] init.vim[neovim] not found.' "[ -f $HOME/.config/nvim/init.vim ]"
    assertTrue '[FAIL] coc-settings[coc] not found.' "[ -f $HOME/.config/nvim/coc-settings.json ]"
}

testExistBkpDir() {
    assertTrue '[FAIL] bkpdir[folder] not found.' "[ -d $HOME/.config-bkp ]"
}

testExistBinDir() {
    assertTrue '[FAIL] bin[folder] not found.' "[ -d $HOME/bin ]"
}

testExistBinFiles() {
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/install ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/install_fonts ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/install_enviroment ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/install_pkgs_enviroment ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/install_virtual_manager ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/i3_config_install ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/push_local_config ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/pull_config ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/stage_local_config ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/targz ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/namestd ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/connection ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/videostd ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/pdfstd ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/i3-scrot ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/extract ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/foldering_media_year_month ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/item_size ]"
    assertTrue '[FAIL] bin[folder] not found.' "[ -f $HOME/bin/rm_linedup ]"
}



oneTimeTearDown() {
    cd ./tests
    git checkout main
}

# Load and run shUnit2.
. shunit2

