#!/bin/sh

VIMCOM=":Stdheader\ndd\n:wq"
VIMFILE=".vim.temp"

R='\033[31m' # Red
Y='\033[33m' # Yellow
G='\033[32m' # Green
C='\033[36m' # Cyan
B='\033[34m' # Blue
P='\033[35m' # Purple
W='\033[37m' # White
N='\033[0m'	 # No Color

SRC_DIR="src"
INC_DIR="inc"

INCLUDES=""
RESPONSE=""

error () {
	echo "${R}Error: $1$R.${N}"
}

# vim_create <filename>
vim_create () {
	if [ -z $1 ] ; then
		error "NULL input to ${P}vim_create()"
		return 1
	fi
	vim -s $VIMFILE $1
}

# update_inc <struct name>
update_inc () {
	if [ -z $1 ] ; then
		error "NULL input to ${P}update_inc()"
		return 1
	fi
	
	FILE=$INC_DIR/$INCLUDES.h
	LAST=$(tail -n 1 $FILE)
	MOST=$(sed \$d $FILE)
	#echo "$R$MOST$N"

	STRUCT=$1
	TYPE=t_$STRUCT
	CHAR=${STRUCT:0:1}

	echo "$MOST" > $FILE
	echo "\n$TYPE\t*new_$STRUCT(void /* args */);" >> $FILE
	echo "void\t\tdel_$STRUCT($TYPE *$CHAR);\n" >> $FILE
	echo "$LAST" >> $FILE
}

# make_struct <struct name>
make_struct () {
	if [ -z $1 ] ; then
		error "NULL input to ${P}make_struct()"
		return 1
	fi

	STRUCT=$1
	TYPE=t_$STRUCT
	CHAR=${STRUCT:0:1}

	FILE=$SRC_DIR/$TYPE.c

	vim_create $FILE

	echo "#include \"$INCLUDES.h\"\n" >> $FILE
	echo "void\t\tdel_$STRUCT($TYPE *$CHAR)\n{" >> $FILE
	echo "\tif ($CHAR)\n\t{\n\t\t/* delete data */" >> $FILE
	echo "\t\tfree($CHAR);\n\t}\n}\n" >> $FILE

	echo "$TYPE\t*new_$STRUCT(void /* args */)\n{" >> $FILE
	echo "\t$TYPE\t*$CHAR;\n" >> $FILE
	echo "\t$CHAR = ($TYPE *)malloc(sizeof($TYPE));" >> $FILE
	echo "\tif (!$CHAR)\n\t\treturn (NULL);" >> $FILE
	echo "\t/* args */" >> $FILE
	echo "\treturn ($CHAR);\n}" >> $FILE
}

# Code Execution
echo $VIMCOM > $VIMFILE

echo "${G}What is the ${P}.h$G file?$N"
read INCLUDES

RESPONSE="foo"
while [ ! -z $RESPONSE ] ; do
	echo "${G}What is the name of the struct?$N"
	read RESPONSE
	if [ ! -z $RESPONSE ] ; then
		make_struct $RESPONSE
		update_inc $RESPONSE
	fi
done

rm $VIMFILE
