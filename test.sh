#!/bin/bash
anu=`date '+%Y%m%d'`
cd /opt/recording
ssh@root192.168.13.230 /root/test
if [ ! -d $anu ]; then
mkdir $anu
fi
find . -mmin +0  -type f -iname "*avi" -exec gzip -f '{}' ';'
cd $anu
ffmpeg -f v4l2 -i /dev/video0 -f alsa -i pulse -c:v libx264 -preset ultrafast -c:a aac output.mp4


