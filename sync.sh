#!/bin/bash
#this script use s3cmd
S3_BUCKET="s3.laprensa.com.ni"
S3_KEY_DEST="/home/juancarlos/laprensa/afp/"
S3_CONFIG_FILE="/home/alvarezjuan/.s3cfg"
ORIGIN_PATH="/home/alvarezjuan/www/lp_python_apps/afp-laprensa/AFP/espanol/periodico/mundoya/"


for file in $ORIGIN_PATH*.jpg
do
s3cmd --skip-existing --config=$S3_CONFIG_FILE -P put $file s3://$S3_BUCKET$S3_KEY_DEST
done
