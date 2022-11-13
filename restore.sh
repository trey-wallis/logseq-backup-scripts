#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: ./restore.sh <source-archive> <destination-folder>"
    exit 2
fi

# Remove any trailing slashes
source="${1%/}"
# Remove any trailing slashes
dest="${2%/}"

filename="$(basename $source)"

output="$dest/$file_name"

# Create a folder if it doesn't exist
mkdir -p "$output"

tar -xzvf "$source" -C "$output"

echo "$output"