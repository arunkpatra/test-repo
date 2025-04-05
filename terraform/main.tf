






provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}








resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  
  # Security settings
  shared_access_key_enabled = true
  min_tls_version          = "TLS1_2"
  public_network_access_enabled = false
  
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
}

