# S3 Command Scripts

This folder contains a bunch of bash scripts that work with an S3 instance.

## Scripts

### 1. `s3-create-bucket.sh`

This script creates a bucket in an S3 instance.

#### Usage:
```
bash ./s3-create-bucket.sh <S3_BUCKET>
```

### 2. `s3-delete-bucket.sh`

This script deletes a bucket in an S3 instance.

#### Usage:
```
bash ./s3-delete-bucket.sh <S3_BUCKET>
```

### 3. `s3-delete-object.sh`

This script deletes a file in an S3 bucket.

#### Usage:
```
bash ./s3-delete-object.sh <S3_BUCKET> <S3_PREFIX> <S3_OBJECT>
```

### 4. `s3-get-transfer.sh`

This script is used to get a file from an S3 bucket.

#### Usage:
```
bash ./s3-get-transfer.sh <S3_BUCKET> <S3_PREFIX> <S3_OBJECT> <LOCAL_DIRECTORY> <LOCAL_FILENAME>
```

### 5. `s3-put-transfer.sh`

This script is used to put a file up in an S3 bucket.

#### Usage:
```
bash ./s3-put-transfer.sh <S3_BUCKET> <S3_PREFIX> <LOCAL_DIRECTORY> <LOCAL_FILENAME>
```