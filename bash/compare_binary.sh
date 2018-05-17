#!/bin/bash

STRING_1=$1
STRING_2=$2

HASH_1="$(echo -n "$STRING_1" | md5 -q)"
HASH_2="$(echo -n "$STRING_2" | md5 -q)"

BIN_1="$(echo -n "$HASH_1" | xxd -b | cut -d' ' -f2-7 )"
BIN_2="$(echo -n "$HASH_2" | xxd -b | cut -d' ' -f2-7 )"

LEN_1="$(echo -n "$BIN_1" | wc -c)"
LEN_2="$(echo -n "$BIN_2" | wc -c)"

MAX=0

if [ "$LEN_1" -gt "$LEN_2" ] ; then
	MAX=$LEN_1
else
	MAX=$LEN_2
fi

IDX=1
NUM=0
while [ "$IDX" -le "$MAX" ] ; do
	CHAR_1="$(echo -n "$BIN_1" | head -c $IDX | tail -c 1)"
	CHAR_2="$(echo -n "$BIN_2" | head -c $IDX | tail -c 1)"

	if [ ! "$CHAR_1" == "$CHAR_2" ] ; then
		NUM=$(($NUM + 1))
	fi
	IDX=$(($IDX + 1))
done

echo "$NUM bits differ"
