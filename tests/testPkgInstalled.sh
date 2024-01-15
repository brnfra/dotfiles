#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

osys=$(cat /etc/os-release | sed -n -r '/^ID=/p' | cut -d "=" -f 2)
if [ "$osys" = "manjaro" ]; then
    SHUNIT_TEST_PREFIX=' Packages Instaled Test for Manjaro --> '

elif [ "$osys" = "ubuntu" ] || [ "$osys" = "debian" ]; then
    SHUNIT_TEST_PREFIX=' Packages Instaled Test for Debian or Ubuntu --> '

fi
SHUNIT_COLOR="always"
testPkgsInstalledCheck() {
    #debian ubuntu manjaro etc

    pkges+=" acpi " 
    pkges+=" blueman "      
    pkges+=" bzip2 "
    pkges+=" curl "         
    if [ "$osys" = "manjaro" ]; then
        pkges+=" fd "      
        pkges+=" picom " 
        pkges+=" xautolock " 
        pkges+=" i3-wm "           
    else
        pkges+=" fd-find "      
        pkges+=" exa "
        pkges+=" compton" 
        pkges+=" i3 "           
        pkges+=" i3lock-fancy " 
        pkges+=" x11-utils "    
        pkges+=" network-manager-gnome "
        pkges+=" rar "
        pkges+=" netcat-openbsd "
        pkges+=" openssh-client "          
    fi
    pkges+=" ffmpeg "       
    pkges+=" fzf "          
    pkges+=" ghostscript "  
    pkges+=" git "          
    pkges+=" gsimplecal" 
    pkges+=" gzip "
    pkges+=" i3blocks "     
    pkges+=" imagemagick "  
    pkges+=" jq "           
    pkges+=" neovim "       
    pkges+=" nitrogen "     
    pkges+=" openssl "      
    pkges+=" pcmanfm " 
    pkges+=" ranger "
    pkges+=" rofi "
    pkges+=" rsync "        
    pkges+=" scrot "        
    pkges+=" shunit2 "      
    pkges+=" sysstat "      
    pkges+=" tar "
    pkges+=" unzip "        
    pkges+=" vifm "         
    pkges+=" vim  "         
    pkges+=" xfce4-power-manager " 
    pkges+=" xfce4-terminal " 
    pkges+=" zip "
    if [ "$osys" = "ubuntu" ]
    then
        pkges+=" pulseaudio"
    else
        pkges+=" alsa-utils"
    fi

    for pkg in $pkges 
    do
        if [ "$osys" = "ubuntu" ]
        then
            dpkg -s "$pkg"  1> /dev/null 
            assertTrue "${red}${bold}[FAIL]${reset}${LINENO}:$pkg not installed\n\n" $?
        elif [ "$osys" = "debian" ]
        then
            dpkg -s "$pkg"  1> /dev/null 
            assertTrue "${red}${bold}[FAIL]${reset}${LINENO}:$pkg not installed\n\n" $?
        elif [ "$osys" = "manjaro" ]
        then
            pacman -Qi "$pkg" 1> /dev/null
            assertTrue "${red}${bold}[FAIL]${reset}${LINENO}:$pkg not installed\n\n" $?
        fi


    done
}

. shunit2
