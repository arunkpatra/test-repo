variable "unique_id" {
  description = "A unique identifier for naming resources"
  type        = string
}

variable "environment" {
  description = "The environment for which this infrastructure is deployed (e.g., dev, prod)"
  type        = string
}