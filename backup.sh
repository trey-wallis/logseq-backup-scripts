#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Usage: ./backup.sh <source-folder> <dest-path>" >&2
    exit 2
fi

source="$1"

current_timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
file_name="logseq_backup_$current_timestamp.tar.gz"

if [ "$#" -lt 2 ]; then
    output="/tmp/$file_name"
else
    dest="$2"
    output="$dest/$file_name"
fi

mkdir -p "$dest"

# The H flag keeps the timestamps
# c - Create a directory
# v - verbose
# z - gzip
# f - write to file
echo "Gzipping folder to: $output"
tar -czf "$output" -C "$source" ./

# echo "Syncing to server..."
# rsync -avt $source "$dest/backups/"