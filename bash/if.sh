#!/bin/bash

function test_if () {

	echo -e "\n$1"

	if [ "$1" ] ; then
		echo "[ \"$1\" ]"
	fi

	if [[ "$1" ]] ; then
		echo "[ \"$1\" ]"
	fi

	if ( "$1" ) ; then
		echo "( \"$1\" )"
	fi

	if (( "$1" )) ; then
		echo "(( \"$1\" ))"
	fi

}

test_if 0
test_if 1
test_if -1
test_if $1
test_if "$1"
