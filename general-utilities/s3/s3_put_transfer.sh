#!/bin/bash

if ! command -v s3cmd &> /dev/null; then
    echo "Error: s3cmd is required but is not installed. Please install s3cmd to continue"
    exit 1
fi

if [[ $# -ne 4 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

S3_BUCKET="$1"
S3_PREFIX="$2"
LOCAL_DIRECTORY="$3"
LOCAL_FILE="$4"

S3_FULL_PATH="s3://$S3_BUCKET/$S3_PREFIX"
LOCAL_FULL_PATH="$LOCAL_DIRECTORY/$LOCAL_FILE"

if ! s3cmd put "$LOCAL_FULL_PATH $S3_FULL_PATH"; then
    echo "Failed to upload object $S3_OBJECT"
    exit 1
else
    echo "Object $S3_OBJECT uploaded"
fi