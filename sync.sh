#!/bin/bash
#this script use s3cmd

. ./settings.py
for file in $ORIGIN_PATH*.jpg
do
s3cmd --skip-existing --config=$S3_CONFIG_FILE -P put $file s3://$S3_BUCKET$S3_KEY_DEST
done
