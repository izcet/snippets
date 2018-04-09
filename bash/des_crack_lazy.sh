#!/bin/bash

# files
RAW=raw
HEX=hex
MSG=ana
DIR=out

CIPHER=des-ecb
FLAGS="-a -nopad -d"

declare -a ARR

while read line ; do
    ARR[${#ARR[*]}]=$line
done < hex

while read line ; do
    ARR[${#ARR[*]}]=$(echo -n "$line" | xxd -ps)
done < raw

I=0
LEN=${#ARR[*]}

# while [ "$I" -lt "$LEN" ] ; do
#    echo ${ARR[$I]}
#    I=$(($I + 1))
# done

mkdir -p $DIR

NUM_WORDS=0
while [ "$NUM_WORDS" -lt "3" ] ; do
    NUM_WORDS=$(($NUM_WORDS + 1))
    echo "NUM_WORDS is $NUM_WORDS"

    declare -a IDX
    II=0
    while [ "$II" -lt "$NUM_WORDS" ] ; do
        IDX[$II]=0
        II=$(($II + 1))
    done
    
    GOING=1
    LAST=$(($NUM_WORDS - 1))
    while [ "$GOING" -eq "1" ] ; do
        STR=""
        
        S=0
        while [ "$S" -lt "$NUM_WORDS" ] ; do
            STR="$STR${ARR[${IDX[$S]}]}"
            S=$(($S + 1))
        done
   
        ITER=""
        P=0
        while [ "$P" -le "$LAST" ] ; do
            ITER="$ITER${IDX[$P]}"
            P=$(($P + 1))
        done
        echo "$ITER"

        KEY=$(echo "$STR" | sed -E 's/(.{16}).*/\1/')
        echo "$KEY"
        echo -e "$KEY ($STR) [\n$(openssl "$CIPHER" -K "$KEY" -in "$MSG" $FLAGS)]" >> $DIR/$KEY
    
        II=$LAST
        #echo "II is $II LEN is $LEN"
        IDX[$II]=$((${IDX[$II]} + 1))
        while [ "${IDX[$II]}" -ge "$LEN" ] ; do
            IDX[$II]=0
            II=$(($II - 1))
            if [ "$II" -ge "0" ] ; then
               IDX[$II]=$((${IDX[$II]} + 1))
            fi
        done
        #echo "II is $II"
        if [ "$II" -eq "-1" ] ; then
            GOING=0
        #else
        #    echo "Not going"
        fi
    done
done
