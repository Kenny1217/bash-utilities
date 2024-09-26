#!/bin/bash

REMOTE_USER="$1"
REMOTE_HOST="$2"
REMOTE_COMMAND="$3"
REMOTE_CONNECTION="$REMOTE_USER@$REMOTE_HOST"

ssh "$REMOTE_CONNECTION $REMOTE_COMMAND"

SSH_RETURN_CODE=$?

if [ $SSH_RETURN_CODE -eq 0 ]; then
    echo "Command executed successfully"
else
    echo "Command failed with exit code $SSH_RETURN_CODE"
fi
