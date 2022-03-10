#!/bin/bash
#Autostart monitor settings for lxrandr-config-monitor
SCR="$(xrandr -q 2>/dev/null | grep -w connected | cut -d " " -f1)"
xrandr --newmode "1080x1920_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
 
xrandr --addmode "$SCR" "1080x1920_60.00"

xrandr --output "$SCR" --mode "1080_1920_60.00" 

