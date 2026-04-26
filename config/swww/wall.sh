#§/usr/bin/bash

unset HOMEBREW_PREFIX
walls_directory="$HOME/Pictures/favorites"

#initialize swww-daemon
if ! pgrep -x awww-daemon > /dev/null; then  # ! means not , pgrep looks for a process if found returns 0 if not returns another number
					# > take the output of commad on left passing it to command on right
					# /dev/null is jsut a trash where you get rid of unwanted data
    awww-daemon &
	sleep 1
fi

while true; do
	wall=$(find $walls_directory | shuf -n 1)   # find commmand returns the absolute path of all pictures in wall directoru
						 # shuf shuflle those path and then it returns only one -n 1
	if [ -n "$wall" ] ; then   # this checks if the variable wall is empty
		awww img "$wall" --transition-type grow --transition-duration 2  # here passing wall as argument to swww 
		wal -i "$wall"   # passing wall to wal
	fi	
	sleep 500 
done
