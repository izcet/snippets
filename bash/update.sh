#!/bin/bash

if [ "$#" -ne "1" ] ; then
	echo "Usage: $0 <playlist>"
	exit 0
fi

function get_number_echo () {
	echo "$( echo "$1" | wc -l | sed -E 's/ *([0-9]+).*/\1/' )"
}

function get_number_file () {
	echo "$( wc -l "$1" | sed -E 's/ *([0-9]+).*/\1/' )"
}

function playlist_data () {
	local PLAYLIST="$1"
	local LINE="$( get_number_file "$PLAYLIST" )"
	local UNIQ="$( get_number_echo "$( sort "$PLAYLIST" | uniq )" )"

	echo "$LINE lines, $UNIQ unique"
}

FILE=$1

if [ -f "$FILE" ] ; then
	echo "Old $FILE: $(playlist_data $FILE)"
	rm $FILE
fi

pbpaste > "$FILE"
echo "" >> "$FILE"
echo "New $FILE: $(playlist_data $FILE)"
