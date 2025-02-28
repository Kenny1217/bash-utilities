# SFTP File Transfer Scripts

This folder contains two bash scripts that allow you to easily transfer files between a local system and a remote server via SFTP. One script is for downloading files from the remote server to the local system, and the other is for uploading files from the local system to the remote server.

## Scripts

### 1. `sftp_get_transfer.sh`

This script downloads a file from a remote server to a local directory.

#### Usage:
```
bash ./sftp_get_transfer.sh <SFTP_USER> <SFTP_HOST> <REMOTE_DIRECTORY> <REMOTE_FILENAME> <LOCAL_DIRECTORY> <LOCAL_FILENAME> 
```

### 2. `sftp_put_transfer.sh`

This script uploads a file from a local directory to a remote server.

#### Usage:
```
bash ./sftp_get_transfer.sh <SFTP_USER> <SFTP_HOST> <LOCAL_DIRECTORY> <LOCAL_FILENAME> <REMOTE_DIRECTORY> <REMOTE_FILENAME> 
```