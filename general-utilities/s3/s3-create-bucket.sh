#!/bin/bash

if ! command -v s3cmd &> /dev/null; then
    echo "Error: s3cmd is required but it is not installed"
    exit 1
fi

if [[ $# -ne 1 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

S3_BUCKET="$1"

S3_FULL_PATH="s3://$S3_BUCKET"

if ! s3cmd mb "$S3_FULL_PATH"; then
    echo "Failed to create S3 bucket $S3_BUCKET"
    exit 1
else
    echo "Bucket $S3_BUCKET created"
fi