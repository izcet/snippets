#!/bin/sh

read x

var=0
sum=0
while ((var < x )) ; do
	read y
	sum=$(( $sum + $y))
	var=$(( $var + 1))
done
echo $(printf %.3f $(echo "scale = 4; $sum / $x" | bc))
