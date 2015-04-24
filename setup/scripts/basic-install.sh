#!/bin/bash

pacstrap /mnt base
genfstab -p /mnt >> /mnt/etc/fstab

