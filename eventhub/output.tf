output "eventhub_name" {
  value = azurerm_eventhub.ktstream.name
}

output "eventhub_namespace" {
  value = azurerm_eventhub_namespace.ktstream.name
}

output "eventhub_default_primary_key" {
  value = azurerm_eventhub_namespace.ktstream.default_primary_key
}