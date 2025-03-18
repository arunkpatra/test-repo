resource "aws_cloudtrail" "multi_region_trail" {
  name                          = "multi-region-cloudtrail"
  is_multi_region_trail         = true
  enable_logging                = true
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs.id

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type = "AWS::S3::Object"

      values = ["arn:aws:s3:::"]
    }
  }
}
resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = "cloudtrail-logs-${var.unique_id}"
  acl    = "private"

  tags = {
    Name        = "cloudtrail-logs"
    Environment = var.environment
  }
}