#!/bin/bash

set -euo pipefail

SFTP_USER="$1"
SFTP_HOST="$2"
REMOTE_DIRECTORY="$3"
REMOTE_FILE="$4"
LOCAL_DIRECTORY="$5"
LOCAL_FILE="$6"

if [[ $# -ne 6 ]]; then
    echo "Wrong number of arguments. Exiting..."
    exit 1
fi

SFTP_CONNECTION="$SFTP_USER@$SFTP_HOST"
REMOTE_FULL_PATH="$REMOTE_DIRECTORY/$REMOTE_FILE"
LOCAL_FULL_PATH="$LOCAL_DIRECTORY/$LOCAL_FILE"

echo "Connecting $SFTP_CONNECTION"
echo "Moving $REMOTE_FULL_PATH to $LOCAL_FULL_PATH"

sftp "$SFTP_CONNECTION" << EOF
    get "$REMOTE_FULL_PATH" "$LOCAL_FULL_PATH"
EOF

SFTP_RETURN_CODE=$?

if [ $SFTP_RETURN_CODE -eq 0 ]; then
    echo "SFTP transfer completed"
else
    echo "SFTP transfer failed with exit code $SFTP_RETURN_CODE"
    exit 1
fi
