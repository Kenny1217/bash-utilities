#!/bin/bash

if ! command -v s3cmd &> /dev/null; then
      echo "Error: s3cmd is required but is not installed. Please install s3cmd to continue."
      exit 1
fi

if [[ $# -ne 3 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

S3_BUCKET="$1"
S3_PREFIX="$2"
S3_OBJECT="$3"

S3_FULL_PATH="s3://$S3_BUCKET/$S3_PREFIX/$S3_OBJECT"


      s3cmd del "$S3_FULL_PATH"


