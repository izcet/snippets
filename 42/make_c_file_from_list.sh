#!/bin/sh

VIM=":Stdheader\ndd\n:wq"
VIM_FILE="/tmp/vim_$(date | base64)"
echo "$VIM" > $VIM_FILE

function finish {
	rm -f $VIM_FILE
}
trap finish EXIT

INC="#include \"ft_printf.h\"\n"
RET="int\t\t"
ARG="(int *len, va_list ap, t_data *data)"
BOD="{\n\t(void)len;\n\t(void)ap;\n\t(void)data;\n}"

if [ -z "$1" ] ; then
	echo "bad file"
	exit
fi

while read LINE ; do 
	echo "$LINE"
	if [ ! -f "$LINE.c" ] ; then
		echo "$VIM" > $VIM_FILE
		vim -s $VIM_FILE $LINE.c
		echo "$INC" >> $LINE.c
		echo "$RET$LINE$ARG" >> $LINE.c
		echo "$BOD" >> $LINE.c
	fi
done < $1
