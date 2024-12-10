#!/bin/bash

#Arg vars
arg=$1

#Vars
basePath="/home/mh"
downloadPath="${basePath}/Hentet"

if [[ arg == "-help" ]]; then
	printf "Sletter alt i \"$downloadPath\""
	exit 1
fi

read -p "Sikker? (J/n): " confirm && [[ $confirm == [jJ] || $confirm == [jJ][aA] ]] || exit 1

# Check and handle if folder is empty
count=$(ls "$downloadPath"/ | wc -l)
if [[ $count -eq 0 ]]; then
	echo "Mappen er allerede tom."
	exit 1
fi

if [[ $count -gt 1 ]]; then
	countText="elementer"
else
	countText="element"
fi

echo "Mappen indeholder $count $countText"

# Empty download folder
rm -rf "${downloadPath}/"*
echo "Mappen er tømt"