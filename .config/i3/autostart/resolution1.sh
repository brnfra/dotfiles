#!/bin/bash
#Autostart monitor settings for lxrandr-config-monitor
SCR="$(xrandr -q 2>/dev/null | grep -w connected | cut -d " " -f1 | cut -d "-" -f1)"

xrandr --newmode "1360x768_60.00" 84.75  1360 1432 1568 1776  768 771 781 798 -hsync +vsync
 
xrandr --addmode $SCR "1360x768_60.00" 

xrandr --output $SCR --mode "1360x768_60.00" 

#Name=lxqt-config-monitor-autostart
#OnlyShowIn=LXQt
#OnlyShowIn=i3
#Type=Application
#Name=LXRandR autostart
#Version=1.0

