#!/usr/bin/env bash
# shellcheck source=~/bin/dotfiles_env
setup() {
    source $HOME/bin/dotfiles_env
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
    osys=$(cat /etc/os-release | sed -n -r '/^ID=/p' | cut -d "=" -f 2)
    if [ "$osys" = "manjaro" ]; then
        SHUNIT_TEST_PREFIX=' Packages Instaled Test for Manjaro --> '

    elif [ "$osys" = "ubuntu" ] || [ "$osys" = "debian" ]; then
        SHUNIT_TEST_PREFIX=' Packages Instaled Test for Debian or Ubuntu --> '

    fi
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

}


@test "Test if minimum required Packages are Installed" {
for pkg in $pkges 
do
    if [ "$osys" = "ubuntu" ]
    then
        run dpkg -s "$pkg"  1> /dev/null 
        [ "$status" -eq 0 ]
    elif [ "$osys" = "debian" ]
    then
        run dpkg -s "$pkg"  1> /dev/null 
        [ "$status" -eq 0 ]
    elif [ "$osys" = "manjaro" ]
    then
        run pacman -Qi "$pkg" 1> /dev/null
        [ "$status" -eq 0 ]
    fi
done
}

