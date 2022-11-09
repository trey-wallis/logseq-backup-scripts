# logseq-backup-scripts

Shell scripts for backing up logseq files

## Backup a folder

Create a `.tar.gz` file into the `tmp` directory

- `./backup.sh <source-folder>`

Create a `.tar.gz` file into the a specified directory

- `./backup.sh <source-folder> <dest-path>`

## Restore a folder

Unzip a `.tar.gz` file into a specified directory

- `./restore.sh <backup-file> <dest-path>`
