FILENAME=$1

if [ ! -z FILENAME ]; then
    FILENAME="output"
fi

OUTPUT=$FILENAME.o

avr-gcc -c *.c -o $OUTPUT

objcopy --change-address 0xE0000 -O ihex $OUTPUT $FILENAME.hex

rm $OUTPUT
