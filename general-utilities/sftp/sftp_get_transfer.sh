#!/bin/bash

if [[ $# -ne 6 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

SFTP_USER="$1"
SFTP_HOST="$2"
REMOTE_DIRECTORY="$3"
REMOTE_FILENAME="$4"
LOCAL_DIRECTORY="$5"
LOCAL_FILENAME="$6"

SFTP_CONNECTION="$SFTP_USER@$SFTP_HOST"
REMOTE_FULL_PATH="$REMOTE_DIRECTORY/$REMOTE_FILENAME"
LOCAL_FULL_PATH="$LOCAL_DIRECTORY/$LOCAL_FILENAME"

sftp "$SFTP_CONNECTION" <<EOF
    get "$REMOTE_FULL_PATH $LOCAL_FULL_PATH"
EOF

SFTP_RETURN_CODE=$?

if [ $SFTP_RETURN_CODE -eq 0 ]; then
    echo "SFTP transfer complete"
else 
    echo "SFTP transfer failed with exit code $SFTP_RETURN_CODE"
fi