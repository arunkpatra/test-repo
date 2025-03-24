
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "The AMI ID for the developer virtual machine."
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "aws_access_key" {
  description = "AWS Access Key ID."
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Access Key."
  type        = string
}
