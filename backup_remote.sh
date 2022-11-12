#!/bin/bash

if [ "$#" -ne 5 ]; then
    echo "Usage: ./backup_sync.sh <source-folder> <user> <host> <ssh-key> <remote-folder>"
    exit 2
fi

source_folder="$1"
user="$2"
host="$3"
ssh_key="$4"
remote_folder="$5"

# MD5 hash all of the files and make a hash out of those hashes
checksum="$(find -s "$source_folder" -type f -exec md5 {} \; | md5)"
checksum_file="/tmp/$checksum"

# If md5 hash hasn't changed, exit.
if [ -f "$checksum_file" ]; then
    echo "No file changes found."
    exit 0
fi

# Create checksum file
touch "$checksum_file"

# Create file name based on timestamp
current_timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
file_name="vault_$current_timestamp.tar.gz"

# Create a file from stdout. Then list all files, delete all but the last 3
command="cat > $remote_folder/$file_name && cd $remote_folder && ls -t | tail -n +4 | xargs --no-run-if-empty rm --"

# Create an gzipped achive of the source folder and send it over stdout
# to our server
# c - Create an archive
# z - gzip
# f - write to file
tar zcf - "$source_folder" | ssh -i "$ssh_key" "$user@$host" "$command"

echo "$remote_folder/$file_name"
exit 0