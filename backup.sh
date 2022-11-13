#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: ./backup.sh <folder-to-archive> <destination-folder>"
    exit 2
fi

source="${1%/}"
dest="${2%/}"

mkdir -p "$dest"

current_timestamp=$(date +"%Y_%m_%d-%H_%M_%S")
file_name="vault-$current_timestamp.tar.gz"
output="$dest/$file_name"

# c - Create an archive
# z - gzip
# f - write to file
# C - change the output path
tar -czf "$output" -C "$source" ./

echo "$output"