







provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}








resource "aws_instance" "developer_vm" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  
  tags = {
    Name = "Developer-VM"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}
