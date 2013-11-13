#!/bin/bash
#this script use s3cmd

SRC_DIR=`dirname $0`
. $SRC_DIR/settings.py

if [ "$1" != "" ]; then
    LOCAL_DATA_DIRECTORY=$1/
else
    LOCAL_DATA_DIRECTORY=$ORIGIN_PATH
fi

# echo "$LOCAL_DATA_DIRECTORY*.jpg"
for file in $LOCAL_DATA_DIRECTORY*.jpg
do
s3cmd --skip-existing --config=$S3_CONFIG_FILE -P put $file s3://$S3_BUCKET$S3_IMG_DEST
done
