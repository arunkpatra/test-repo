
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "mystorageaccount12rt45"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where resources will be created"
  type        = string
}









variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}
