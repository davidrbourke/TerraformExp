output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_key" {
  value = azurerm_storage_account.sa.primary_access_key
  sensitive = true
}