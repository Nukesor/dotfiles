#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

~/.scripts/changeLanguage english
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3

