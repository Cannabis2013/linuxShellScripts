FILENAME=$1

if [ -z $FILENAME ]; then
    echo "No file provided"
    return
elif [ -s $FILENAME ];then
    echo "File not found"
    return
fi

str="${FILENAME}"
binaryName=()

length=${#str}
for (( i = 0; i < length; i++ )); do
    char="${str:$i:1}"
    if [ $char == "." ];then
        break
    fi
    binaryName+=$char
done

OUTPUT=$binaryName.o

avr-gcc -c *.c -o $OUTPUT

objcopy --change-address 0xE0000 -O ihex $OUTPUT $FILENAME.hex

rm $OUTPUT
