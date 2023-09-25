module "rg" {
  source = "./resourcegroup"
  rgname = var.rgname
  rglocation = var.rglocation
}

module "storageaccount" {
  source = "./storageaccount"
  rgname = module.rg.rgname
  rglocation = module.rg.rglocation
  storageaccount_name = var.storage_account_name
  container_name = var.container_name
}

module "eventhub" {
  source = "./eventhub"
  rgname = module.rg.rgname
  rglocation = module.rg.rglocation
  namespace_name = var.namespace_name
  eventhub_name = var.eventhub_name
  partition_count = var.partition_count
}

module "stream_analytics" {
  source = "./streamanalytics"
  rgname = module.rg.rgname
  rglocation = module.rg.rglocation
  eventhub_name = module.eventhub.eventhub_name
  namespace_name = module.eventhub.eventhub_namespace
  default_primary_key = module.eventhub.eventhub_default_primary_key
  storage_account_name = module.storageaccount.storage_account_name
  storage_account_key = module.storageaccount.storage_account_key
  output_container_name = module.storageaccount.container_name
  job_name = var.stream_analytics_job_name
}