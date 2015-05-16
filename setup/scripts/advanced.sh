#!/bin/bash

# Downloading zsh and setting it as default shell
pacman -Sy base-devel zsh sudo --needed --noconfirm
chsh -s /usr/bin/zsh
# Copying etc
cp -rf etc/* /etc/
# Adding and signing Haskell repository for pacman
pacman -Syy
pacman -S yaourt --noconfirm

