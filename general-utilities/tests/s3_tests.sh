#!/bin/bash


TEST_S3_BUCKET="tstbucket"
TEST_S3_PREFIX="tst_folder"
TEST_S3_OBJECT="tst_file.txt"



TEST_DIRECTORY="$HOME/"
TEST_FILENAME="tst_file.txt"


TEST_S3_PREFIX


s3_get_s3cmd_config.sh "" "" "" "" ""



s3_create_bucket.sh "$TEST_BUCKET"


s3_delete_file.sh "$TEST_BUCKET" "$TEST_S3_PREFIX" "$TEST_S3_OBJECT"


s3_delete_bucket.sh "$TEST_BUCKET"



s3_get_file_transfer.sh "$TEST_S3_BUCKET" "$TEST_S3_PREFIX" "$TEST_S3_OBJECT" "$TEST_DIRECTORY" "$TEST_FILENAME"

s3_put_file_transfer.sh "$TEST_S3_BUCKET" "$TEST_S3_PREFIX" "$S3_OBJECT" "$TEST_DIRECTORY" "$TEST_FILENAME"


