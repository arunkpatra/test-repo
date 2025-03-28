# Terraform configuration for Azure resource compliance
resource "microsoft.storage/storageaccounts" "example" {
  name                     = "examplestorage"
  resource_group_name      = "example-resources"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  
  # Added security settings for compliance
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  
  # Added network rules for enhanced security
  network_rules {
    default_action = "Deny"
    ip_rules       = ["100.0.0.0/16"]
    bypass         = ["Metrics", "AzureServices"]
  }
  
  # Added compliance tags
  tags = {
    environment = "production"
    compliance  = "azure-security-benchmark"
    remediated  = "true"
  }
}