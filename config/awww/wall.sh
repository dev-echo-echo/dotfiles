#!/usr/bin/bash

walls_directory="$HOME/Pictures/favorites"

#initialize awww-daemon
if ! pgrep -x awww-daemon > /dev/null; then  
    awww-daemon &
	sleep 1
fi

while true; do
	wall=$(find "$walls_directory" | shuf -n 1)   
	if [[ -n "$wall" ]] ; then   
		awww img "$wall" --transition-type grow --transition-duration 2  
		wal -i "$wall"  
	fi	
	sleep 500 
done
