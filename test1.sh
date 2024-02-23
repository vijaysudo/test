#!/bin/bash
anu=`date '+%Y%m%d'`
cd administrator@192.168.13.230:/root/test

if [ ! -d $anu ]; then
mkdir $anu
fi
find . -mmin +0  -type f -iname "*avi" -exec gzip -f '{}' ';'
cd $anu
 ffmpeg -i /dev/video0 -c:v libx264 -c:a aac output.mp4
