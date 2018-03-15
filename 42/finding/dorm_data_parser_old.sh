#!/bin/sh

FILE=dormroom.data

sed -i '.old' -E -e 's/[</ ]+div[ >]//g' -e "s/arrived_at[\D\d: ='\w]{20,40}roomsuser' //g" $FILE 
