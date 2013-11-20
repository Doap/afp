#!/bin/bash
#this script use s3cmd

SRC_DIR=`dirname $0`
. $SRC_DIR/settings.py

if [ "$1" != "" ]; then
    LOCAL_DATA_DIRECTORY=$1
else
    LOCAL_DATA_DIRECTORY=$ORIGIN_PATH
fi
echo $S3_CONFIG_FILE
s3cmd --config=$S3_CONFIG_FILE sync s3://$S3_BUCKET$S3_SYNC_DEST $LOCAL_DATA_DIRECTORY
