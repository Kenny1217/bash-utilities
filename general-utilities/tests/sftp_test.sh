#!/bin/bash

SFTP_USER=""
SFTP_HOST=""
REMOTE_DIRECTORY=""
REMOTE_FILE="test_file.txt"
LOCAL_DIRECTORY="$HOME"
LOCAL_FILE="test_file.txt"

# Create test file
touch "$LOCAL_DIRECTORY/$LOCAL_FILE"

# Put file on server using sftp put script
sftp_put_transfer.sh "$SFTP_USER" "$SFTP_HOST" "$LOCAL_DIRECTORY" "$LOCAL_FILE" "$REMOTE_DIRECTORY" "$REMOTE_FILE"

# Remove local copy of the test file
rm "$LOCAL_DIRECTORY/$LOCAL_FILE"

# Get file from server using sftp get script
sftp_get_transfer.sh "$SFTP_USER" "$SFTP_HOST" "$REMOTE_DIRECTORY" "$REMOTE_FILE" "$LOCAL_DIRECTORY" "$LOCAL_FILE"

# Check if the file exists locally
if [ -f "$LOCAL_DIRECTORY/$LOCAL_FILE" ]; then
    echo "File '$LOCAL_FILE' exists in '$LOCAL_DIRECTORY'."
else
    echo "File '$LOCAL_FILE' does not exist in '$LOCAL_DIRECTORY'."
    exit 1
fi