#!/bin/bash

anu=$(date '+%Y%m%d')
local_backup_dir="$HOME/$anu"
remote_user="administrator"
remote_host="192.168.13.230"
remote_path="/root/test/"

# Ensure remote path ends with a slash
remote_path="${root/test%/}/"

# Create a directory for the current date
if [ ! -d "$local_backup_dir" ]; then
    mkdir "$local_backup_dir"
fi

# Compress *.avi files older than 1 minute
find . -mmin +1 -type f -iname "*.avi" -exec gzip -f '{}' ';'

# Move to the backup directory
cd "$local_backup_dir"

# Convert video from /dev/video0 to MP4
ffmpeg -i /dev/video0 -c:v libx264 -c:a aac output.mp4

# Copy the compressed files and video to the remote server
rsync -avz --delete "$local_backup_dir" "${remote_user}@${remote_host}:${remote_path}"

# Check rsync exit status
if [ $? -eq 0 ]; then
    echo "Data stored successfully on remote server."
else
    echo "Error: Failed to store data on remote server."
fi
