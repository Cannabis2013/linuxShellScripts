#!/bin/bash
file=$1
binary_name=program
cleanup=0

str="${file}"
binaryName=()

length=${#str}
for (( i = 0; i < length; i++ )); do
    char="${str:$i:1}"
    if [ $char == "." ];then
        break
    fi
    binaryName+=$char
done

cleanUp(){
    rm $binaryName.o
    rm program
}

for arg in $@; do
    if [ $arg == "--d" ]; then
        cleanup=1
    elif [[ $arg == "--D" || $arg == "--clean" ]]; then
        cleanUp
        exit
    fi
done

if [ -z "$file" ]; then
    echo "You have to provide an asm file to compile"
    exit
fi

nasm -gdwarf -f elf $file

if [ ! -s $binaryName.o ]; then
    exit
fi

ld -m elf_i386 -s -o $binary_name *.o
./"$binary_name"

if [ $cleanup -gt 0 ]; then
    cleanUp
fi