#!/bin/bash


echo "y
"|mkfs.ext4 /dev/sdc2
echo "y
"|mkfs.ext4 /dev/sdc3
mount /dev/sdc3 /mnt
mkdir /mnt/boot
mount /dev/sdc2 /mnt/boot

