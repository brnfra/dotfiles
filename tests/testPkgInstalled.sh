#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
. dotfiles_env

<<<<<<< HEAD
SHUNIT_TEST_PREFIX=' Packages Instaled Test for Debian or Ubuntu --> '
||||||| b2cbc42
SHUNIT_TEST_PREFIX=' Packages Test --> '
=======
osys=$(cat /etc/os-release | sed -n -r '/^ID=/p' | cut -d "=" -f 2)
if [ "$osys" = "manjaro" ]; then
    SHUNIT_TEST_PREFIX=' Packages Instaled Test for Manjaro --> '

elif [ "$osys" = "ubuntu" ] || [ "$osys" = "debian" ]; then
    SHUNIT_TEST_PREFIX=' Packages Instaled Test for Debian or Ubuntu --> '

fi
>>>>>>> b6563ead4c2370e597322b81966fb2946c62f678
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
<<<<<<< HEAD
    pkges+=" rar "
    pkges+=" rofi "
||||||| b2cbc42
    pkges+=" rar "
=======
    pkges+=" rofi "
>>>>>>> b6563ead4c2370e597322b81966fb2946c62f678
    pkges+=" rsync "        
    pkges+=" scrot "        
    pkges+=" shunit2 "      
<<<<<<< HEAD
    pkges+=" openssh-client "          
||||||| b2cbc42
    pkges+=" ssh "          
=======
>>>>>>> b6563ead4c2370e597322b81966fb2946c62f678
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
<<<<<<< HEAD
	pkges+=" alsa-utils"
||||||| b2cbc42
	pkges+=" alsautils"
=======
        pkges+=" alsa-utils"
>>>>>>> b6563ead4c2370e597322b81966fb2946c62f678
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
            #ASSERT:[FAIL]71:compton not installed
            # erro: o pacote "exa" não foi encontrado
            # erro: o pacote "fd-find" não foi encontrado
            # erro: o pacote "i3" não foi encontrado
            # erro: o pacote "i3lock-fancy" não foi encontrado
            # erro: o pacote "netcat-openbsd" não foi encontrado
            # erro: o pacote "network-manager-gnome" não foi encontrado
            # erro: o pacote "rar" não foi encontrado
            # erro: o pacote "openssh-client" não foi encontrado
            # erro: o pacote "x11-utils" não foi encontrado
        fi


    done
}

. shunit2
