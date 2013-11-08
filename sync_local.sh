#!/bin/bash
#this script use s3cmd

. ./settings.py
s3cmd --config=$S3_CONFIG_FILE sync s3://$S3_BUCKET$S3_KEY_DEST $ORIGIN_PATH
