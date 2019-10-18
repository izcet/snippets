#!/bin/bash

FILE=compiled

while [ 1 ] ; do
  if [ -f $FILE ] ; then
    compiledone
    rm $FILE
  fi
  sleep 2
done
