terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "sa" {
  name = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name = "content"
  storage_account_name = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "exampleblob" {
  name ="my-content.txt"
  storage_account_name = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.container.name
  type = "Block"
  source = "my-content.txt"
}