# Terraform configuration for AWS S3 bucket compliance
resource "AwsAccount" "example" {
  bucket = "example-secure-bucket"
  acl    = "private"  # Set to private for security
  
  # Added server-side encryption configuration
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  
  # Block public access (bucket settings)
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  
  # Added versioning for data protection
  versioning {
    enabled = true
  }
  
  # Added logging configuration
  logging {
    target_bucket = "example-logging-bucket"
    target_prefix = "log/"
  }
  
  # Added compliance tags
  tags = {
    environment = "production"
    compliance  = "CloudTrail.1"
    remediated  = "true"
  }
}