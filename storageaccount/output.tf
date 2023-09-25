output "storage_account_name" {
  value = azurerm_storage_account.ktstream.name
}

output "storage_account_key" {
  value = azurerm_storage_account.ktstream.primary_access_key
}

output "container_name" {
  value = azurerm_storage_container.ktstream.name
}