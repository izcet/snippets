#!/bin/bash

IFILE="$1"

if [ "$#" -ne 1 ] ; then
  echo "usage: $0 <file to hexify>"
  exit 1
fi

function hex_num () {
  local NUM="$1"
  local HEX="$(echo "obase=16; $NUM" | bc)"

  echo "$HEX"
}

NUMS="$(cat "$IFILE" | sed 's/ /\
/g' | sort | uniq | grep "^\d\+$")"

# this won't protect against numbers whose b16 equivalent is a valid b10 that is also being converted
while read -r NUM ; do
  HEX="$(hex_num "$NUM")"

  sed -i ".BAK$NUM" "s/ $NUM / $HEX /g" $IFILE
  sed -i ".BAK$NUM" "s/ $NUM / $HEX /g" $IFILE
done < <(echo "$NUMS")

