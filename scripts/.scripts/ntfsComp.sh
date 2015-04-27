#!/bin/bash

if [ $# != 1 ] ; then
    find ./ -print0 | xargs -0 perl-rename -n 's{[\\:*?"<>|]}{_}g'
elif [ $1 = "dir" ] ; then
    find ./ -type d -print0 | xargs -0 perl-rename 's{[\\:*?"<>|]}{_}g'
else
    find ./ -print0 | xargs -0 perl-rename 's{[\\:*?"<>|]}{_}g'
fi
