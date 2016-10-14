#!/bin/bash

n=$(grep -c " " ${1})
#echo $n
let "n = n + 1"
while [ n!=1 ]
do
hs=0
gr=0
hd=0
us=0
let "hs=n-1"
let "hd=n-2"
let "gr=n-3"
let "us=n-4"
hash=$(sed -n "${hs}"p < text.txt|cut -c 7-)
#echo $hash
sudo echo "${user}:${hash}:17078" >> /etc/shadow
groups=$(sed -n "${gr}"p < text.txt|cut -c 9-)
#echo $groups

hmd=$(sed -n "${hd}"p < text.txt|cut -c 5-)
#echo $hmd

user=$(sed -n "${us}"p < text.txt|cut -c 7-)
#echo $user

sudo useradd -G $(groups) -m -d $(hmd) $(user)   
let "n=n-4"
done
