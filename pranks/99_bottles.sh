#!/bin/sh

VAR=99
PAUSE=.01

function output () {
echo "$1"
say -v Alex -r 200 "$1"
sleep $PAUSE
}

function lyrics1 () {
LINE="$1 errors and bugs in the code,"
output "$LINE"
LINE="$1 errors and bugs."
output "$LINE"
LINE="Take one down, patch it around,"
output "$LINE"
}

function collatz () {
sleep $PAUSE
if [ $(expr $1 % 2) -eq 0 ] ; then
	echo $(($1 / 2))
else
	echo $(($(($1 * 3)) + 1))
fi
}

function lyrics2 () {
if [ $1 -gt 1 ] ; then
	LINE="$1 errors and bugs in the code."
	output "$LINE"
	echo ""
	sleep 1
fi
}


while [ $VAR -gt 1 ] ; do
	lyrics1 $VAR
	VAR=$(collatz $VAR)
	lyrics2 $VAR
done

LINE="Only 1 error left in the code."
output "$LINE"
echo ""
sleep 1

LINE="Only 1 error left in the code,"
output "$LINE"
LINE="Only 1 error or bug."
output "$LINE"
LINE="Take it down, squash it around,"
output "$LINE"
LINE="No more errors or bugs in the code."
output "$LINE"
echo ""
sleep 1

LINE="No more errors or bugs in the code,"
output "$LINE"
LINE="No more errors or bugs."
output "$LINE"
LINE="Curl a new Git, try and compile it,"
output "$LINE"
LINE="99 errors and bugs in the code."
output "$LINE"

exit
