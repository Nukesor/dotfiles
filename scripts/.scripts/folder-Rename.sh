#!/bin/bash

if [ -n "$1" ]; then
    echo "Renaming all Files in Directory"
    echo ""
    echo "New Name:" $1
    var=1

    for file in *
    do
        if [ $var -lt 10 ]; then
            name="${1}0$var"
        else
            name=$1$var
        fi
        if [ -n "$2" ] ; then
            echo "mv $file $name"
        else
            mv $file $name
        fi
        ((var++))
    done
else
    echo "Please enter name for files"
fi

