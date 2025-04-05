

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  
  # If you are using Terraform Cloud or Enterprise, you can configure a backend here
  # backend "remote" {
    #   organization = "your-org-name"
    #   workspaces {
      #     name = "your-workspace"
      #   }
      # }
    }
    






provider "azurerm" {
  features {}
  
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}






resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                      = "mystorageaccount12rt45"
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  
  # Security settings
  allow_nested_items_to_be_public = false
  min_tls_version               = "TLS1_2"
  enable_https_traffic_only     = true
  
  tags = {
    environment = var.environment
  }
}
