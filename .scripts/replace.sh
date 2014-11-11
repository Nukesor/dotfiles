#!/bin/sh

SEDCOMMAND='s/'$1'/'$2'/g'
PLACES=$(grep -rl $1)
echo 'Replacing '$1' by '$2 'in the following Files: '
echo $PLACES
sed -i $SEDCOMMAND $PLACES
