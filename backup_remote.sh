#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: ./backup_sync.sh <source-folder> <user@remote> <ssh-key>" >&2
    exit 2
fi

source="$1"
remote="$2"
ssh_key="$3"

current_timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
file_name="second_brain_$current_timestamp.tar.gz"

output="/tmp/$file_name"

# c - Create an archive
# z - gzip
# f - write to file
# C - change the output path
tar zcf - "$source" | ssh -i "$ssh_key" "$remote" "cat > ~/second_brain/$file_name"

echo "$file_name"