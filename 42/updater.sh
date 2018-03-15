#!/bin/sh

COLOR_GREEN='\033[0;32m'
COLOR_BLUE='\033[0;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_RED='\033[0;31m'
COLOR_TEAL='\033[0;36m'
COLOR_NOCOLOR='\033[0m'

G=$COLOR_GREEN
B=$COLOR_BLUE
P=$COLOR_PURPLE
R=$COLOR_RED
T=$COLOR_TEAL
N=$COLOR_NOCOLOR

DIR=$1
while [ -z "$DIR" ] ; do
	echo "${N}${G}What is the working directory?$N"
	read DIR
done

SRC=~/backups/projects/des/$DIR
DST=$DIR

if [ ! -d $SRC ] ; then
	echo "$R$DIR does not exist.$N"
	exit 1
fi

LIST=($(ls -1 $SRC)) # store the list of old files in an array

# while the array length is greater than zero
# more literally, while the number of all elements is greater than zero
while [ ${#LIST[*]} -gt 0 ] ; do

	# get the first element
	FILE=${LIST[0]}

	echo "$P$FILE$N"

	# compatibility, in case the target machine doesn't have colordiff installed
	if [ ! -f $DST/$FILE ] ; then
		RESPONSE=""
		while [ -z "$RESPONSE" ] ; do
			echo "${T}Do you want to copy ${P}$FILE$T?"
			echo "\t$T[ ${R}1 $T] ${R}yes$N"
			echo "\t$T[ ${R}2 $T] ${R}no$N"
			echo "\t$T[ ${R}4 $T] ${R}exit$G this script$N"
			read RESPONSE
			if [ "$RESPONSE" == "1" -o "$RESPONSE" == "yes" ] ; then
				cp -rf $SRC/$FILE $DST/$FILE
			elif [ "$RESPONSE" == "2" -o "$RESPONSE" == "no" ] ; then
				echo "${B}Skipping $P$FILE$N"
			elif [ "$RESPONSE" == "4" -o "$RESPONSE" == "exit" ] ; then
				exit
			else
				RESPONSE=""
			fi
		done
	else

		(which colordiff &> /dev/null)
		if [ $? -eq 1 ] ; then
			echo "${T}(You may want to install ${P}colordiff$T)$N"
			diff $SRC/$FILE $DST/$FILE
		else
			colordiff $SRC/$FILE $DST/$FILE
		fi

		if [ -n "$(diff $SRC/$FILE $DST/$FILE)" ] ; then
			RESPONSE=""
			while [ -z "$RESPONSE" ] ; do
				echo "${T}What would you like to do with ${P}$FILE$T?$N"
				echo "\t$T[ ${R}1 $T] ${R}copy$G the file over$N"
				echo "\t$T[ ${R}2 $T] ${R}open$G both files for editing$N"
				echo "\t$T[ ${R}3 $T] ${R}skip$G this file$N"
				echo "\t$T[ ${R}4 $T] ${R}exit$G this script$N"
				read RESPONSE
				if [ "$RESPONSE" == "1" -o "$RESPONSE" == "copy" ] ; then
					cp -rf $SRC/$FILE $DST/$FILE
				elif [ "$RESPONSE" == "2" -o "$RESPONSE" == "open" ] ; then
					vim -O $SRC/$FILE $DST/$FILE
				elif [ "$RESPONSE" == "3" -o "$RESPONSE" == "skip" ] ; then
					echo "${B}Skipping $P$FILE$N"
				elif [ "$RESPONSE" == "4" -o "$RESPONSE" == "exit" ] ; then
					exit
				else
					RESPONSE=""
				fi
			done
		fi
	fi

	# increment the array
	# or more literally, delete the first element
	
	# declare the array to be the array minus the file (sed s/file//)
	#declare -a LIST=( ${LIST[*]/$FILE/} ) # (${LIST[*]/${LIST[0]}/})

	# declare the array to be a slice of the original
	declare -a LIST=( ${LIST[*]:1:${#LIST[*]}} )

done

