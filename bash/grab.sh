#!/bin/bash

if [ "$#" -ne "1" ] ; then
	echo "Usage: $0 <file to grab>"
	exit
fi

cat $1 | pbcopy
