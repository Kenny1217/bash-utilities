#!/bin/bash

if ! command -v curl &> /dev/null; then
    echo "Error: curl is required but it is not installed. Please install curl to continue"
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "Error: s3cmd is required but it is not installed. Please install s3cmd to continue"
    exit 1
fi

if [[ $# -ne 3 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

VAULT_ADDRESS="$1"
VAULT_TOKEN="$2"
SECRET_PATH="$3"

echo "Getting secret $SECRET_PATH from $VAULT_ADDRESS"

if ! curl --header "X-Vault-Token: $VAULT_TOKEN" --request GET "$VAULT_ADDRESS/v1/$SECRET_PATH"; then
    echo "Failed to get secret $SECRET_PATH"
    exit 1
else
    echo "Secret $SECRET_PATH pulled"
fi