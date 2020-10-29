#!/bin/bash
S3_Location='s3://waf.logs.mybucket/firehose/2020/'
mkdir s3_waf_logs
FILES='./s3_waf_logs/'
aws s3 cp $S3_Location $FILES --recursive --profile default

for f in $(find $FILES -name 'aws-waf-logs*')
do
        echo "Processing $f file..."
        jq -r '"\(.action), \(.httpRequest.headers[0].value), \(.httpRequest.uri)"' < $f >> waf-logs-all-urls.csv
done
sort ./waf-logs-all-urls.csv | uniq -u > waf-logs-unique-urls.csv
rm ./waf-logs-all-urls.csv
rm -rf $FILES
