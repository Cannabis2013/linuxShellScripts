#!/bin/sh
FILE=$1
MODE=$2
FILE2=$3


if [ -z $FILE ];then
    echo "No file provided"
    return
elif [ ! -e $FILE ]; then
    echo "No such file as $FILE in current directory"
    return
fi

if [ $MODE -z ]; then
    MODE=0
fi

if [ $MODE -eq 0 ]; then
    hexdump -xC $FILE | awk '/\|.*\|/ {print}'
elif [ $MODE -eq 1 ]; then
    hexdump -xC $FILE | awk '/\|.*\|/ {print}' | less
elif [ $MODE -eq 2 ]; then
    if [ -z $FILE2 ]; then
        exit
    fi
    if [ ! -e $FILE2 ]; then
        touch $FILE2
    fi
    hexdump -xC $FILE | awk '/\|.*\|/ {print}' > $FILE2
elif [ $MODE -eq 3 ]; then
    hexdump -v $FILE | awk '{print ":"$0}'
elif [ $MODE -eq 4 ]; then
if [ -z $FILE2 ]; then
        exit
    fi
    if [ ! -e $FILE2 ]; then
        touch $FILE2
    fi
    hexdump -v $FILE | awk '{print ":"$0}' > $FILE2
else
    hexdump -xC $FILE | awk '/\|.*\|/ {print}'
fi