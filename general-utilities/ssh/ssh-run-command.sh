#!/bin/bash

if [[ $# -ne 3 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

SSH_USER="$1"
SSH_HOST="$2"
SSH_COMMAND="$3"

SSH_CONNECTION="$SSH_USER@$SSH_HOST"

ssh "$SSH_CONNECTION $SSH_COMMAND"

SSH_RETURN_CODE=$?

if [ $SSH_RETURN_CODE -eq 0 ]; then
    echo "Command executed successfully"
else
    echo "Command failed with exit code $SSH_RETURN_CODE"
fi
