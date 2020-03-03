# AWS WAFv2 S3 Logs Reading Script

* The Linux Script is to read AWS WAFv2 logs from S3 bucket.
* Same script can be used to read WAF Classic logs from S3.
* WAFv2 logging should be enabled and logs should be stream to the S3 bucket via AWS Firehose.
* The Script fetch all folders from S3 bucket from the S3 location provided in S3_Location variable.
* Modify the S3_Location variable value to get details of specific date logs.
* Script creates s3_waf_logs folder and download all WAF logs from S3 bucket into it.
* Script searched for three parameters Actions(Allowed & Blocked request), Hosts and URIs in each log file.
* File with name waf-logs-unique-url.csv will be created with the final output.
