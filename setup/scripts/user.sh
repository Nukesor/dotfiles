#!/bin/bash

# Kopieren der Home Backup Daten
cp -r --preserve /mnt/home /home/nuke
# Erstellen von user nuke und setzen der Standartshell
groupadd nuke
useradd -d /home/nuke -g nuke nuke
chsh -s /usr/bin/zsh nuke

