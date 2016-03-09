#!/bin/bash

for file in *; do
    filename=$(basename "$file")
    filename="${filename%.*}"
    ffmpeg -i $file -c:v libx264 -crf 19 -preset slow -c:a aac -strict experimental -b:a 192k -ac 2 $filename.mp4
done
