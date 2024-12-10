#!/bin/bash
#!/bin/bash

#Vars
basePath="/home/mh"
cachePath="${basePath}/jobCache"

#Check folder existance
if ! [[ -d $cachePath ]]; then
    printf "Ingen mappe med den angivne sti $cachePath\n"
    printf "Afbryder\n"
    exit 1
fi

# Empty cache
rm -rf "${cachePath}/"*

printf "Cache cleared\n"