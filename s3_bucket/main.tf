

resource "aws_s3_bucket" "dev_bucket" {
  bucket        = "aws-s3-dev-bucket-86ghrt-clgeni"
  force_destroy = false
  
  versioning {
    enabled = true
  }
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  
  acl = "private"
}


provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
}
