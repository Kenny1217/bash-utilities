#!/bin/bash

if [[ $# -ne 5 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

SFTP_USER="$1"
SFTP_HOST="$2"
REMOTE_DIRECTORY="$3"
REMOTE_FILE="$4"
LOCAL_DIRECTORY="$5"
SFTP_CONNECTION="$SFTP_USER@$SFTP_HOST"

sftp "$SFTP_CONNECTION" <<EOF
    get "$REMOTE_DIRECTORY/$REMOTE_FILE $LOCAL_DIRECTORY"
EOF

SFTP_RETURN_CODE=$?

if [ $SFTP_RETURN_CODE -eq 0 ]; then
    echo "SFTP transfer complete"
else
    echo "SFTP transfer failed with exit code $SFTP_RETURN_CODE"
fi