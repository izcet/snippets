#!/bin/bash

# update these with your specific values
USER=""
HOST=""
PORT=""
DEST=""

# if no parameters are provided, this will be empty
FILE="$1"

# check the number of parameters for sanity
if [ "$#" -ne "1" ] ; then
    echo -e "Usage: $0 <file>"
    exit
fi

# where the magic happens
scp $FILE -P $PORT $USER@$HOST:$DEST


#tar zcf - $FILE | ssh $USER@$HOST -p $PORT "cd $DEST ; tar zxf -"
# use this command instead if you:
#   - don't have `scp` (for whatever reason)
#   - are copying a really large file and want to avoid timeout (i'm talking gigs)

echo -e "Done!"
