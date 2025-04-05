
variable "environment" {
  description = "The environment where the resources will be deployed"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "qrun"
}

variable "queue_name" {
  description = "Name of the SQS queue"
  type        = string
  default     = "request-queue"
}

variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}
