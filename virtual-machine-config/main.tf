





provider "aws" {
  region  = "us-east-1"
  access_key = "REPLACE_WITH_VALID_ACCESS_KEY"
  secret_key = "REPLACE_WITH_VALID_SECRET_KEY"
}






resource "aws_instance" "developer_vm" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  
  tags = {
    Name = "developer-vm"
  }
}

variable "aws_region" {
  description = "AWS region for the VM"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the AWS instance"
  type        = string
}

variable "aws_access_key_id" {
  description = "AWS access key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  type        = string
}
