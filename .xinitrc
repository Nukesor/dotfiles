#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

setxkbmap us
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3

# Disable PC beep
xset -b
# Setting Background
feh --bg-scale ~/.local/lost-aurora-1080p.jpg
