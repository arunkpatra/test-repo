

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}



resource "azurerm_storage_account" "storage" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  
  # Security settings
  allow_nested_items_to_be_public = false
  min_tls_version                = "TLS1_2"
  
  blob_properties {
    # Disable anonymous access at the container level
    container_delete_retention_policy {
      days = 7
    }
  }
  
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}



terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

