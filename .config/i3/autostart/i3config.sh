#!/bin/bash

#Script to adapt the i3config for virtual machines in pre defined resolution
#recieve width screen

#for virtual machines screens
SCR="$(xrandr -q 2>/dev/null | grep -w connected | cut -d " " -f1 | cut -d "-" -f1 | sed s/1//)"
#get primary screeen
SCR1="$(xrandr -q 2>/dev/null | grep -w connected | cut -d " " -f1 | head -n 1)"
#get secondary screen
SCR2="$(xrandr -q 2>/dev/null | grep -w connected | cut -d " " -f1 | tail -n 1)"
#My pathes
PCONF="$HOME"
PCONF+='/.config/i3/autostart'

PGIT="$HOME"
PGIT+='/Documents/Projects/git/dotRepo/Privateconfig'

# KEYBOARD config
KEYB='setxkbmap -model pc104 -layout us_intl'

#Hack to select the config related between virtual machines localization

LOC="$(hostname)"
if [ "$SCR" = "Virtual" ]; then
    echo "entered if Virtual"
#config for virtual machine
            if [ "$LOC" = "cloudebian0" ]; then
                eval "$KEYB"
                eval "$PCONF/resolution.sh 2>/dev/null"
                exit
            else
                eval "$PCONF/resolution1.sh 2>/dev/null"
            fi
else
#config for primary machine
    eval "$KEYB"
#set primary
    #set resolution full_hd
    eval "$PCONF/resolution.sh $SCR1 2>/dev/null"
    eval "$PCONF/vertical.sh $SCR2 2>/dev/null"
    #set position
    eval "xrandr --output $SCR1 --primary"
    #turn left and put right of rotate the screen of your preference here SCR1 e SCR2
    eval "xrandr --output $SCR1 --auto --rotate normal --output $SCR2 --auto --rotate right --right-of $SCR1 2>/dev/null"
    exit
fi
