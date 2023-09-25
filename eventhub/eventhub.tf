resource "azurerm_eventhub_namespace" "ktstream" {
  name                = var.namespace_name
  location            = var.rglocation
  resource_group_name = var.rgname
  sku                 = var.sku
}

resource "azurerm_eventhub" "ktstream" {
  name                = var.eventhub_name
  namespace_name      = azurerm_eventhub_namespace.ktstream.name
  resource_group_name = var.rgname
  partition_count     = var.partition_count
  message_retention = var.eventhub_message_retention
}