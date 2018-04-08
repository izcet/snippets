#!/bin/bash

if [ "$#" -ne "2" ] ; then
	echo "Usage: $0 <songs_to_remove> <list_to_modify>"
	exit
fi

grep -v -f $1 $2 > $2_stripped

cat $2_stripped | pbcopy
