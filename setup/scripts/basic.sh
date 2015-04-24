#!/bin/bash

# Setzen der Lokalzeit
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Setzen des encodings
echo "en_US.UTF.8 UTF-8" > /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen

# Setzen der Keymap
echo "KEYMAP=us" > /etc/vconsole.conf
echo "FONT=ter-112n" >> /etc/vconsole.conf

mkinitcpio -p linux

