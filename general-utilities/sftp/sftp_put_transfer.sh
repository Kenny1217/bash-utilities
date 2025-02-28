#!/bin/bash

if [[ $# -ne 6 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

SFTP_USER="$1"
SFTP_HOST="$2"
LOCAL_DIRECTORY="$3"
LOCAL_FILENAME="$4"
REMOTE_DIRECTORY="$5"
REMOTE_FILENAME="$6"

SFTP_CONNECTION="$SFTP_USER@$SFTP_HOST"
LOCAL_FULL_PATH="$LOCAL_DIRECTORY/$LOCAL_FILENAME"
REMOTE_FULL_PATH="$REMOTE_DIRECTORY/$REMOTE_FILENAME"

sftp "$SFTP_CONNECTION" <<EOF
    put "$LOCAL_FULL_PATH $REMOTE_FULL_PATH"
EOF

SFTP_RETURN_CODE=$?

if [ $SFTP_RETURN_CODE -eq 0 ]; then
    echo "SFTP transfer complete"
else 
    echo "SFTP transfer failed with exit code $SFTP_RETURN_CODE"
fi