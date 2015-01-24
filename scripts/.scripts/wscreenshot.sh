#!/bin/sh

while true; do
    i3-msg -t "get_outputs" > temp
    string='"current_workspace":"'$2'"'
    grep -r -I -q $string
    if [[ $? -eq 0 ]] ; then
        scrot -q 100
    else
        echo "Not on specified Workspace"
    fi
    sleep $1
    rm temp
done
