#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

SHUNIT_TEST_PREFIX=' Packages Instaled Test for Debian or Ubuntu --> '
SHUNIT_COLOR="always"
testPkgsInstalledCheck() {
    #debian ubuntu manjaro etc
    osys=$(cat /etc/os-release | sed -n -r '/^ID=/p' | cut -d "=" -f 2)

    pkges+=" acpi" 
    pkges+=" blueman "      
    pkges+=" bzip2 "
    pkges+=" compton" 
    pkges+=" curl "         
    pkges+=" exa "
    pkges+=" fd-find "      
    pkges+=" ffmpeg "       
    pkges+=" fzf "          
    pkges+=" ghostscript "  
    pkges+=" git "          
    pkges+=" gsimplecal" 
    pkges+=" gzip "
    pkges+=" i3 "           
    pkges+=" i3blocks "     
    pkges+=" i3lock-fancy " 
    pkges+=" imagemagick "  
    pkges+=" jq "           
    pkges+=" neovim "       
    pkges+=" netcat-openbsd "
    pkges+=" network-manager-gnome "
    pkges+=" nitrogen "     
    pkges+=" openssl "      
    pkges+=" pcmanfm" 
    pkges+=" ranger "
    pkges+=" rar "
    pkges+=" rofi "
    pkges+=" rsync "        
    pkges+=" scrot "        
    pkges+=" shunit2 "      
    pkges+=" openssh-client "          
    pkges+=" sysstat "      
    pkges+=" tar "
    pkges+=" unzip "        
    pkges+=" vifm "         
    pkges+=" vim  "         
    pkges+=" x11-utils "    
    pkges+=" xfce4-power-manager" 
    pkges+=" xfce4-terminal" 
    pkges+=" zip "
    if [ "$osys" = "ubuntu" ]
    then
	pkges+=" pulseaudio"
    else
	pkges+=" alsa-utils"
    fi

    for pkg in $pkges 
    do
	dpkg -s "$pkg"  1> /dev/null 
	assertTrue "${red}${bold}[FAIL]${reset}${LINENO}:$pkg not installed\n\n" $?
    done

}

. shunit2
