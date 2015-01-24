#!/bin/sh

SEDCOMMAND='s/'
SEDCOMMAND+=$1
SEDCOMMAND+='/'
SEDCOMMAND+=$2
SEDCOMMAND+='/g'
echo 'Replacing '$1' by '$2 'in the following Files: '
echo $(grep --binary-files=without-match -rl $1)
echo $SEDCOMMAND
sed -i $SEDCOMMAND $(grep --binary-files=without-match -rl $1)
