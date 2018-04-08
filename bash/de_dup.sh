#!/bin/bash

if [ "$#" -ne "1" ] ; then
	echo "Usage: $0 <list to remove duplicates from>"
	exit
fi

TEMP=/tmp/$1_dupes
STRIPPED=$1_stripped

sort $1 | uniq -d > $TEMP

~/spotify/sorting/strip.sh $TEMP $1

cat $TEMP >> $STRIPPED

# TODO leave duplicates in-place insted of putting them at the end of the playlist
# mv $STRIPPED $1
