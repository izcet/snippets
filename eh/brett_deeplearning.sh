#!/bin/sh

DIR="."

if [ ! -d $DIR ] ; then
	echo "Directory \"$DIR\" not found."
	exit 1
fi

COUNT=0
MAX=10

while [ "$COUNT" -lt "$MAX" ] ; do
	
	# For Debugging
	echo "iteration $COUNT"

	# i++;
	COUNT=$(($COUNT + 1))

	# Last file or directory by name
	LAST=$(ls -1 $DIR | tail -1)
	
	# Replace this with the script you want to run
	cp "$LAST" "$LAST$COUNT"
	
	# For Debugging
	echo "$LAST -> $LAST$COUNT"
done
