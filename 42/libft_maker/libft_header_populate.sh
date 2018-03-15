#!/bin/sh

DIR=~/backups/projects/libft/src/
IF=".header.sh.tmpdata"
OF="libft.h.txt"
TMP=".header.sh.currentcfiledata"

ls -1 $DIR > $IF

while read file
do
	echo "Scanning file $file"
	cp $DIR$file ./$TMP
	while [ "$(tail -1 $TMP)" != "{" ] ; do
		sed -i '' '$d' $TMP
	done
	echo "$(tail -1 $TMP)"
	sed -i '' '$d' $TMP
	echo "$(tail -1 $TMP)"
	echo "$(tail -1 $TMP);" >> $OF
	rm $TMP
done < $IF

rm $IF
