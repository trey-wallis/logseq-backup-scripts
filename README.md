# logseq-backup-scripts

Shell scripts for backing up logseq files

## Usage

### Backup a folder

Create a `.tar.gz` archive into a specified directory

```bash
# Usage
./backup.sh <source-folder> <destination-folder>
```

```bash
# Example
./backup.sh ~/test-folder ~/backups
```

### Restore a folder

Unzip a `.tar.gz` archive into a specified directory

```bash
# Usage
./restore.sh <source-archive> <destination-folder>
```

```bash
# Example
./restore.sh /users/trey/backups/logseq_backup.tar.gz /users/trey
```

### Backup to a remote location

Create a `.tar.gz` archive only if the source folder file content has changed. Save the archive in a folder on a remote server.

```bash
# Usage
./backup-remote <source-folder> <user> <host> <ssh-key> <remote folder>
```

```bash
# Example
./backup-remote.sh ./source trey backup-server ~/.ssh/id_rsa /var/backups
```
