resource "aws_s3_bucket" "s3_bucket_day3" {
  bucket = "s3-cloudtrail-bucket-with-terraform-code"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
{
   "Sid": "AWSCloudTrailAclCheck",
   "Effect": "Allow",
   "Principal": {
      "Service": "cloudtrail.amazonaws.com"
},
"Action": "s3:GetBucketAcl",
 "Resource": "arn:aws:s3:::s3-cloudtrail-bucket-with-terraform-code"
},
{
"Sid": "AWSCloudTrailWrite",
"Effect": "Allow",
"Principal": {
  "Service": "cloudtrail.amazonaws.com"
},
"Action": "s3:PutObject",
"Resource": "arn:aws:s3:::s3-cloudtrail-bucket-with-terraform-code/*",
"Condition": {
  "StringEquals": {
     "s3:x-amz-acl": "bucket-owner-full-control"
  }
}
  }
  ]
  }
  POLICY
}