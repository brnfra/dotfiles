#!/bin/bash

delay1=1200
delay2=600
cd $HOME/.wallpapers/
FILES1=$(find . -maxdepth 1 -type f -name '*' | sed 's|\.\/||gi' | shuf)

nitrogen --restore --head=0;
nitrogen --restore --head=1;

sleep 3; compton --config ~/.config/compton.conf &

#monitor1
while :
do
    for I in $FILES1; do
       
        nitrogen --set-scaled --head=0  "$I"
        sleep $delay2        
#monitor2
	FILES2=$(find . -maxdepth 1 -type f -name '*' | sed 's|\.\/||gi' | shuf)
        for J in $FILES2; do
            if [ "$I" == "$J" ]; then
                continue
            else
                nitrogen --set-scaled --head=1  "$J"
              break
            fi
        done
        sleep $delay1
	PROCESS_ID=$!
	wait $PROCESS_ID
    done
done
