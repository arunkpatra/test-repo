
# Configure Azure provider


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}



# Use existing resource group
data "azurerm_resource_group" "rg" {
  name = "rg-amarildo-3329_ai"
}

# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-storage-secure"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-storage"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
}

# Update storage account with network rules
resource "azurerm_storage_account" "storage" {
  name                     = "stamarildo44637494179128"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  
  network_rules {
    default_action = "Deny"
    virtual_network_subnet_ids = [azurerm_subnet.subnet.id]
    bypass = ["AzureServices"]
  }
}
