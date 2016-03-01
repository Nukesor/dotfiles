#!/bin/bash
for file in * ;do
    convert $file -crop 1440x1080+240+0 $file
done
