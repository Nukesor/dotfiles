#!/bin/sh
hdd="/dev/sdc"
for i in $hdd;do
echo "o
y
n


+2M
ef02
n


+200M

n




w
y
"|sudo gdisk $i;done 
