# logseq-backup-scripts

Shell scripts for backing up logseq files

## Usage

### Backup a folder

Create a `.tar.gz` file into the `tmp` directory

```bash
./backup.sh <source-folder>
```

Create a `.tar.gz` file into the a specified directory

```bash
./backup.sh <source-folder> <dest-folder>

# example
./backup.sh ~/test-folder ~/backups
```

### Restore a folder

Unzip a `.tar.gz` file into a specified directory

```bash
`./restore.sh <backup-file> <dest-path>
```

### Backup to a remote location

```bash
./backup-remote <source-folder> <user> <host> <ssh-key> <remote folder>

# example
./backup-remote ./source trey backup-server ~/.ssh/id_rsa /var/backups
```
