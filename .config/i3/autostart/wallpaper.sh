#!/bin/bash
delay1=1200

cd "$HOME/.wallpapers/" || return

FILES1=$(find . -maxdepth 1 -type f -name '*' | sed 's|\.\/||gi' | shuf)

nitrogen --restore --head=0;

#monitor1
while :
do
    for I in $FILES1; do
        nitrogen --set-scaled --head=0  "$I"
        sleep $delay1
	wait $!
    done
done
