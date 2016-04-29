#!/bin/bash
count=0
total=$(ls -1 | wc -l)
for file in * ;do
    count=$(($count+1))
    echo "Converting $count of $total"
    convert $file -crop 1440x1080+240+0 $file
done
