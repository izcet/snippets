#!/bin/bash

OUTFILE=""

if [ "$#" -eq "1" ] ; then
	OUTFILE="$1"
fi

while read LINE ; do
	TIME="$( date )"
	
	if [ -z "$OUTFILE" ] ; then
		echo -e "$TIME\t$LINE"
	else
		echo -e "$TIME\t$LINE" >> $OUTFILE
	fi

done

