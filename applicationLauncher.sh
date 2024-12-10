#!/bin/bash

#Arg variables
type=$1

#Variables
developmentTitle="application-development.docx"
itSupportTitle="application-IT-Support.docx"
itTestTitle="application-IT-Tests.docx"
storageTitle="application-storage.docx"
applicationTitle="application.docx"

basePath="/home/mh"
cacheFolder="${basePath}/jobCache"
templatesPath="${basePath}/WordTemplates"
itApplicationPath="${templatesPath}/$developmentTitle"
itSupApplicationPath="${templatesPath}/$itSupportTitle"
itTestApplicationPath="${templatesPath}/$itTestTitle"
storageApplicationPath="${templatesPath}/$storageTitle"
applicationpath="${templatesPath}/$applicationTitle"

messageIntro="Åbner en frisk kopi af et dokument tilpasset jobs for"

#Global vars
tempRPath=""

#Functions

printOptions(){
    printf "Gyldige inputs:\n\n"
    printf "\tit : $messageIntro softwareudvikling\n"
    printf "\tits: $messageIntro IT Support\n"
    printf "\titt: $messageIntro IT Test\n"
    printf "\tsto: $messageIntro lager og logikstik\n"
    printf "\n"
    printf "Eks.:\n\n"
    printf "\tapplicationLauncher.sh it\n\n"
}

cacheDocument(){
    echo "$1"
    if [[ -a $1 ]]; then
        cachePath="${cacheFolder}/$2"
        cp "$1" "$cachePath"
        tempRPath=$cachePath
    else
        echo "Cache: Intern fejl!\nStien $tempRPath ser ikke til at findes.\n"
    fi

}

openDocument(){
    if [[ -a $1 ]]; then
        xdg-open $1
    else
        printf "Open: Intern fejl!\nStien $1 ser ikke ud til at findes.\n"
    fi
}

if ! [[ -d $templatesPath ]]; then
    printf "Intern fejl!\nDer ser ikke ud til at være en skabelon mappe til stede.\nStien $templatesPath ser ikke til at findes.\n"
    exit 1
fi

if ! [[ -d $cacheFolder ]]; then
    printf "Opretter midlertidig mappe til opbevaring af skabeloner"
    mkdir "$cacheFolder"
fi


#Handle arguments
if [[ -z $type ]]; then
    printOptions
    exit 1
elif [[ $type == "-clear" ]]; then
    # Clean cache
    jobClearCache.sh
    exit 1
fi

if [[ $type == "app" ]]; then
    cacheDocument "$applicationpath" "$applicationTitle"
    openDocument "$tempRPath"
elif [[ $type == "it" ]]; then
    cacheDocument "$itApplicationPath" "$developmentTitle"
    openDocument "$tempRPath"
elif [[ type == "its" ]]; then
    cacheDocument "$itSupApplicationPath" "$itSupportTitle"
    openDocument "$tempRPath"
elif [[ $type == "itt" ]]; then
    cacheDocument "$itTestApplicationPath" "$itTestTitle"
    openDocument "$tempRPath"
elif [[ $type == "sto" ]]; then
    cacheDocument "$storageApplicationPath" "$storageTitle"
    openDocument "$tempRPath"
else
    printf "Fejl 40!\n\nDu har indtastet et ugyldigt input.\n"
    printOptions
fi