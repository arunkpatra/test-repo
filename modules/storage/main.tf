
# Resource Group
resource "azurerm_resource_group" "storage_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "mygoodsoractwe2jkl"
  resource_group_name      = azurerm_resource_group.storage_rg.name
  location                = azurerm_resource_group.storage_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  # Security Settings
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = false
  min_tls_version                = "TLS1_2"
  
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
  
  tags = {
    environment = var.environment
  }
}
