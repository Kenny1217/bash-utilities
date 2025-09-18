#!/bin/bash

set -euo pipefail

SFTP_USER="$1"
SFTP_HOST="$2"
LOCAL_DIRECTORY="$3"
LOCAL_FILE="$4"
REMOTE_DIRECTORY="$5"
REMOTE_FILE="$6"

if [[ $# -ne 6 ]]; then
    echo "Wrong number of arguments. Exiting..."
    exit 1
fi

SFTP_CONNECTION="$SFTP_USER@$SFTP_HOST"
LOCAL_FULL_PATH="$LOCAL_DIRECTORY/$LOCAL_FILE"
REMOTE_FULL_PATH="$REMOTE_DIRECTORY/$REMOTE_FILE"

echo "Connecting $SFTP_CONNECTION"
echo "Moving $LOCAL_FULL_PATH to $REMOTE_FULL_PATH"

sftp "$SFTP_CONNECTION" << EOF
    put "$LOCAL_FULL_PATH" "$REMOTE_FULL_PATH" 
EOF

SFTP_RETURN_CODE=$?

if [ $SFTP_RETURN_CODE -eq 0 ]; then
    echo "SFTP transfer completed"
else
    echo "SFTP transfer failed with exit code $SFTP_RETURN_CODE"
    exit 1
fi
