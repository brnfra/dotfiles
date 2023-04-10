#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Packages Test --> '
SHUNIT_COLOR="always"
testPkgsInstalledCheck() {
    #debian ubuntu manjaro etc
    osys=$(cat /etc/os-release | sed -n -r '/^ID=/p' | cut -d "=" -f 2)

    pkges="rar"
    pkges+=" tar"
    pkges+=" bzip2"
    pkges+=" gzip"
    pkges+=" unzip"
    pkges+=" uncompress" 
    pkges+=" tgz"
    pkges+=" zip"
    pkges+=" gunzip"
    pkges+=" 7z"
    pkges+=" jq"
    pkges+=" ip"
    pkges+=" nc"
    pkges+=" openssl"
    pkges+=" mpstat" 
    pkges+=" i3lock-fancy"
    pkges+=" blueman-applet"
    pkges+=" xfce4-terminal" 
    pkges+=" scrot"
    pkges+=" pcmanfm" 
    pkges+=" ranger"
    pkges+=" compton" 
    pkges+=" xrandr" 
    pkges+=" xfce4-power-manager" 
    pkges+=" nitrogen"
    pkges+=" acpi" 
    pkges+=" gsimplecal" 
    pkges+=" vim nvim vifm" 
    pkges+=" shunit2"
    pkges+=" fdfind"
    pkges+=" exa"
    pkges+=" git"
    pkges+=" curl"
    pkges+=" ssh"
    pkges+=" fzf"
    pkges+=" nm-applet"
    pkges+=" rsync"
    if [ "$osys" = "ubuntu" ]
    then
	pkges+=" pactl"
    else
	pkges+=" amixer"
    fi

    for pkg in $pkges 
    do
	command -v "$pkg"  1> /dev/null 
	assertTrue "${red}${bold}[FAIL]${reset}${LINENO}:$pkg not installed\n\n" $?
    done


   
}

. shunit2
