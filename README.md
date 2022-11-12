# logseq-backup-scripts

Shell scripts for backing up logseq files

## Usage

### Backup a folder

Create a `.tar.gz` file into the `tmp` directory

```bash
# Usage
./backup.sh <source-folder>
```

```bash
# Example
./backup.sh ~/test-folder
```

Create a `.tar.gz` file into the a specified directory

```bash
# Usage
./backup.sh <source-folder> <dest-folder>
```

```bash
# Example
./backup.sh ~/test-folder ~/backups
```

### Restore a folder

Unzip a `.tar.gz` archive into a specified directory

```bash
# Usage
`./restore.sh <backup-archive> <dest-folder>
```

```bash
# Example
`./restore.sh /users/trey/backups/backup.tar.gz /users/trey/restores/`
```

### Backup to a remote location

Create a `.tar.gz` archive if the source folder file content has changed. Save the archive in a folder on a remote server.

```bash
# Usage
./backup-remote <source-folder> <user> <host> <ssh-key> <remote folder>
```

```bash
# Example
./backup-remote.sh ./source trey backup-server ~/.ssh/id_rsa /var/backups
```
