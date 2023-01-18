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
PCONF+='/.i3/autostart'

# KEYBOARD config
KEYB='setxkbmap -model pc104 -layout us_intl'
KEYB_ABNT2_BR='setxkbmap -model abnt2 -layout br'

LOC="$(hostname)"

if [ "$LOC" = "debian-tablet" ]; then
    eval "$KEYB_ABNT2_BR"
    eval xrandr --newmode "1360x768_60.00" 84.75  1360 1432 1568 1776  768 771 781 798 -hsync +vsync
    eval xrandr --addmode $SCR "1360x768_60.00"
    eval xrandr --output $SCR --mode "1360x768_60.00"

    exit 0
fi

if [ "$LOC" = "ubuntu-ideapad3" ]; then
    eval "$KEYB_ABNT2_BR"
    eval xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    eval xrandr --addmode $SCR "1920x1080_60.00"
    eval xrandr --output $SCR --mode "1920x1080_60.00"

    exit 0
fi

if [ "$LOC" = "debian-r5-desktop" ]; then
    eval "$KEYB_US"
    #set primary
    #M1-set resolution full_hd
    eval xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    eval xrandr --addmode $SCR1 "1920x1080_60.00"
    eval xrandr --output $SCR1 --mode "1920x1080_60.00"
    #M2
    eval xrandr --newmode "1080x1920_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    eval xrandr --addmode "$SCR2" "1080x1920_60.00"
    eval xrandr --output "$SCR2" --mode "1080_1920_60.00"
    #set position
    eval "xrandr --output $SCR1 --primary"
    #turn left and put right of rotate the screen of your preference here SCR1 e SCR2
    eval "xrandr --output $SCR1 --auto --rotate normal --output $SCR2 --auto --rotate right --right-of $SCR1 2>/dev/null"

    exit 0
fi

if [ "$LOC" = "virtual" ]; then
    eval "$KEYB"
    eval xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    eval xrandr --addmode $SCR "1920x1080_60.00"
    eval xrandr --output $SCR --mode "1920x1080_60.00"

    exit 0
else
    eval xrandr --newmode "1360x768_60.00" 84.75  1360 1432 1568 1776  768 771 781 798 -hsync +vsync
    eval xrandr --addmode $SCR "1360x768_60.00"
    eval xrandr --output $SCR --mode "1360x768_60.00"
    
    exit 0
fi

