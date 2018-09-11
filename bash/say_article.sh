#!/bin/bash

ART=$1
SAY="say -v sam -r 75"

sleep .1
$SAY "Up next: $ART"
sleep .1
cat $ART | $SAY
sleep 5
