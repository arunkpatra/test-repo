# Terraform configuration to fix compliance issue
# Resource: arn:aws:s3:::astro-astronuts-org-avatars
# Control: S3.9

resource "awss3bucket" "arn_aws_s3___astro_astronuts_org_avatars" {
  # Fixed configuration to address compliance issue
  name        = "arn:aws:s3:::astro-astronuts-org-avatars"
  location    = "us-east-1"
  encrypted   = true
  versioning_enabled = true
  
  tags = {
    Environment = "Production"
    ManagedBy   = "CloudGeni"
    Compliance  = "Enabled"
  }
}

# Modified by CloudGeni remediation service
