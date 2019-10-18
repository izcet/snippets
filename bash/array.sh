#!/bin/bash

declare -a INDEXED_ARR_VAR

INDEXED_ARR=(foo bar)
INDEXED_ARR[2]=baz
INDEXED_ARR+=(QUZ)

echo "${INDEXED_ARR[*]}"
echo "${#INDEXED_ARR[@]}"

for i in "${INDEXED_ARR[@]}" ; do 
  echo "$i" 
  echo "$i"
done

for i in "${!INDEXED_ARR[@]}" ; do
  echo "$i"
done

