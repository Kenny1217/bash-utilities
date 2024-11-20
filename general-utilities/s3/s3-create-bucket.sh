#!/bin/bash

if ! command -v s3cmd &> /dev/null; then
      echo "Error: s3cmd is required but is not installed. Please install s3cmd to continue."
      exit 1
fi

if [[ $# -ne 1 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

S3_BUCKET="$1"

S3_FULL_PATH="s3://$S3_BUCKET"



      
      
      s3cmd mb "$S3_FULL_PATH"


