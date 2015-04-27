#!/bin/bash

if [ -n "$1" ]; then
    echo "Renaming all Files in Directory"
    echo ""
    echo "New Name:" $1
    var=1

    for file in *
    do
        #Creating new file name, number smaller 10 become 01-09
        if [ $var -lt 10 ]; then
            name="${1}0$var"
        else
            name=$1$var
        fi

        #Getting current file extension
        extension="${file##*.}"
        if [ -z "$2" ] ; then
            echo "moving $file to ${name}.$extension"
        elif [ "dry" = "$2" ] ; then
            echo "moving $file to ${name}.$extension"
        else
            echo "moving $file to $name$2"
        fi
        # If third parameter exists this script will perform a dry run
        # Second parameter becomes file ending
        if [ -z "$2" ] ; then
            mv $file ${name}.$extension
        elif [ "dry" != "$2" ] ; then
                name=$name$2
                mv $file $name
        fi
        #Incrementing var
        ((var++))
    done
else
    echo "Please enter a name for those files"
fi

