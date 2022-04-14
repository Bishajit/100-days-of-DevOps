data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "day3-cloudtrail" {
  name                          = "my-demo-cloudtrail-terraform"
  s3_bucket_name                = "${aws_s3_bucket.s3_bucket_day3.id}"
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}