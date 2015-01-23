#!/bin/sh

while true; do
    i3-msg -t "get_outputs" > temp
    string='"current_workspace":"'$2'"'
    grep -r $string
    temp=$?
    rm temp
    echo $temp
    echo ""
    echo $2
    echo ""
    if [[ temp -eq 0 ]] ; then
        scrot -q 100
    else
        echo "Not on specified Workspace"
    fi
    sleep $1
done
