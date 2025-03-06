#!/bin/bash

if ! command -v s3cmd &> /dev/null; then
    echo "Error: s3cmd is required but it is not installed. Please install s3cmd to continue"
    exit 1
fi

if [[ $# -ne 4 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

S3_BUCKET="$1"
S3_PREFIX="$2"
LOCAL_DIRECTORY="$3"
LOCAL_FILENAME="$4"

S3_FULL_PATH="s3://$S3_BUCKET/$S3_PREFIX"

if ! s3cmd put "$LOCAL_DIRECTORY/$LOCAL_FILENAME" "$S3_FULL_PATH"; then
    echo "Failed to transfer $S3_FULL_PATH"
    exit 1
else
    echo "Transfer $S3_FULL_PATH completed"
fi