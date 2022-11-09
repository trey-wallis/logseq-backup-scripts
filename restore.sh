#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./restore.sh <backup-file> <dest-path>" >&2
    exit 2
fi

file_name="$1"
dest="$2"

echo "Creating dir: $dest..."
mkdir -p "$dest"

echo "Extracting file: $file_name..."
tar -xzf "$file_name" -C "$dest"