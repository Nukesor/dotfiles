#!/bin/bash

# Kopieren der Home Backup Daten
cp -r --preserve /mnt/home /home/nuke

# Erstellen von user nuke und setzen der Standartshell
groupadd nuke
useradd -d /home/nuke -g nuke nuke
usermod -a -G tty,wheel,uucp,http,video,audio,nuke,network

# Setting shell
chsh -s /usr/bin/zsh nuke

# Setting home dir permissions
chmod 700 /home/nuke
chown nuke:nuke /home/nuke

