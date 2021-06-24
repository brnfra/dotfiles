#!/bin/bash
#Autostart monitor settings for lxrandr-config-monitor
SCR="$(xrandr -q 2>/dev/null | grep -w connected | cut -d " " -f1 | cut -d "-")"

xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
 
xrandr --addmode $SCR "1920x1080_60.00"

xrandr --output $SCR --mode "1920x1080_60.00"

#Name=lxqt-config-monitor-autostart
#OnlyShowIn=LXQt
#OnlyShowIn=i3
#Type=Application
#Name=LXRandR autostart
#Version=1.0
