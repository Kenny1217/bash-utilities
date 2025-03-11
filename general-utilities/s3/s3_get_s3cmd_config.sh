#!/bin/bash

if ! command -v curl &> /dev/null; then
    echo "Error: curl is required but it is not installed. Please install curl to continue"
    exit 1
fi

if ! command -v s3cmd &> /dev/null; then
    echo "Error: s3cmd is required but it is not installed. Please install s3cmd to continue"
    exit 1
fi

if [[ $# -ne 5 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

VAULT_ADDRESS="$1"
VAULT_TOKEN="$2"
SECRET_PATH="$3"
S3CMD_CONFIG_DIRECTORY="$4"
S3CMD_CONFIG_FILENAME="$5"

S3CMD_CONFIG_RESPONSE=$(source ../curl/get_hashicorp_vault_secret.sh "$VAULT_ADDRESS" "$VAULT_TOKEN" "$SECRET_PATH")

echo "$S3CMD_CONFIG_RESPONSE" > "$S3CMD_CONFIG_DIRECTORY$S3CMD_CONFIG_FILENAME"