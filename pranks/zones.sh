#!/bin/sh

z=1
while [ $z -le 4 ] ; do
	r=1
	while [ $r -le 10 ] ; do
		p=1
		while [ $p -le 30 ] ; do
			if [ $(expr $p % $r) -eq $(($z)) ] ; then
				echo "e1z${z}r${r}p${p} | \c"
			fi
			p=$(($p + 1)) # + $r - 1))
		done
		r=$(($r + 1))
	done
	z=$(($z + 1))
done
