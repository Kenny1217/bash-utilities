#!/bin/bash

set -euo pipefail

if [[ $# -ne 3 ]]; then
    echo "Usage: $0 <key_type> <comment> <passphrase>"    
    exit 1
fi

SSH_KEY_TYPE="${1}"
SSH_COMMENT="${2}"
SSH_PASSPHRASE="${3}"

SSH_DIRECTORY="${HOME}/.ssh"
SSH_FILENAME="id_${SSH_KEY_TYPE}_${SSH_COMMENT}"
SSH_FULL_PATH="${SSH_DIRECTORY}/${SSH_FILENAME}"

if [[ ! -d "${SSH_DIRECTORY}" ]]; then
    mkdir -p "${SSH_DIRECTORY}"
    chmod 700 "${SSH_DIRECTORY}"
fi

if [[ -f "${SSH_FULL_PATH}" ]]; then
    echo "Key already exists."
    exit 1
fi

ssh-keygen -t "${SSH_KEY_TYPE}" -C "${SSH_COMMENT}" -f "${SSH_FULL_PATH}" -N "${SSH_PASSPHRASE}"

echo "SSH key created at ${SSH_FULL_PATH}"
