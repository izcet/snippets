#!/bin/bash

PATH=~
EXEC="python script.py"
LOG="ouput.log"

AUTO_FILE="$PATH/persist"

ACTIVE="$PATH/current"


if [ ! -f "$AUTO_FILE" ] ; then
    touch "$AUTO_FILE"
fi
rm -rf $ACTIVE


cd $PATH
echo -e "## >>> Starting \"$EXEC\" from autolaunch script \"$0\" <<< ##" > $LOG

COUNT=0
while [ -f "$AUTO_FILE" ] ; do

    ($EXEC &>> $LOG ; rm -rf "$ACTIVE" ) & echo "$!" > "$ACTIVE"

    PID="$(cat "$ACTIVE")"

    while [ -f "$ACTIVE" ] ; do
        sleep 1
    done

    kill -2 $PID &> /dev/null

    echo -e "## >>> Done with \"$EXEC\"($COUNT) <<< ##" >> $LOG
    
    COUNT=$(($COUNT + 1))
done


echo -e "## >>> Done with autolaunch script \"$0\" <<< ##" >> $LOG
