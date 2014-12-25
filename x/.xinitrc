#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

setxkbmap us
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3

