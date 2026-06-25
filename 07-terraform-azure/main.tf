resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
  numeric = true
}

resource "azurerm_resource_group" "lab" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "lab" {
  name                     = "${var.storage_account_prefix}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.lab.name
  location                 = azurerm_resource_group.lab.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  allow_nested_items_to_be_public = false
  min_tls_version                 = "TLS1_2"

  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }
}