resource "azurerm_storage_account" "ktstream" {
  name                     = var.storageaccount_name
  resource_group_name      = var.rgname
  location                 = var.rglocation
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

# container_names = ["container1", "container2"]
# resource "azurerm_storage_container" "containers" {
#   for_each = { for name in var.container_names : name => name }

#   name                 = each.value
#   storage_account_name = azurerm_storage_account.example.name
#   container_access_type = "private"
# }

resource "azurerm_storage_container" "ktstream" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.ktstream.name
  container_access_type = var.container_access_type
}