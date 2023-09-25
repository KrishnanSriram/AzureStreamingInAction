resource "random_string" "random_suffix" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_stream_analytics_job" "ktstream" {
  name                                     = "asa_eus_${random_string.random_suffix.result}_${var.job_name}"
  resource_group_name                      = var.rgname
  location                                 = var.rglocation
  # compatibility_level                      = "1.2"
  # data_locale                              = "en-US"
  # events_late_arrival_max_delay_in_seconds = 60
  # events_out_of_order_max_delay_in_seconds = 50
  # events_out_of_order_policy               = "Adjust"
  # output_error_policy                      = "Drop"
  streaming_units                          = 3
  transformation_query = var.transformation_query

}

resource "azurerm_stream_analytics_stream_input_eventhub" "ktstream" {
  name                         = "inputeh"
  stream_analytics_job_name    = azurerm_stream_analytics_job.ktstream.name
  resource_group_name          = azurerm_stream_analytics_job.ktstream.resource_group_name
  eventhub_consumer_group_name = var.consumer_group
  eventhub_name                = var.eventhub_name
  servicebus_namespace         = var.namespace_name
  shared_access_policy_key     = var.default_primary_key
  shared_access_policy_name    = var.shared_access_policy_name

  serialization {
    type     = "Json"
    encoding = var.serialization.encoding
  }
}

resource "azurerm_stream_analytics_output_blob" "ktstream" {
  name                      = "outputblob"
  stream_analytics_job_name = azurerm_stream_analytics_job.ktstream.name
  resource_group_name       = azurerm_stream_analytics_job.ktstream.resource_group_name
  storage_account_name      = var.storage_account_name
  storage_account_key       = var.storage_account_key
  storage_container_name    = var.output_container_name
  # path_pattern              = "some-pattern"
  path_pattern = var.path_prefix
  date_format               = var.date_format
  time_format               = var.time_format

  serialization {
    type            = var.serialization.type
    encoding        = var.serialization.encoding
    field_delimiter = var.serialization.field_delimiter
  }
}