#!/bin/bash
find ./ -print0 | xargs -0 perl-rename 's{[\\:*?"<>|]}{_}g'
find ./ -print0 | xargs -0 perl-rename 's{&}{+}g'
