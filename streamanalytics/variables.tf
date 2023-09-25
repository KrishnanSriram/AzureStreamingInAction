variable "job_name" {
  type = string
}

variable "sku" {
  type = string
  default = "Standard"
}

variable "rgname" {
  type = string
}

variable "rglocation" {
  type = string
}

variable "namespace_name" {
  type = string
}

variable "eventhub_name" {
  type = string
}

variable "consumer_group" {
  type = string
  default = "$Default"
}

variable "default_primary_key" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_key" {
  type = string
}

variable "output_container_name" {
  type = string
}

variable "path_prefix" {
  type = string
  default = "output-path/"
}

variable "date_format" {
  type = string
  default = "yyyy-MM-dd"
}

variable "time_format" {
  type = string
  default = "HH"
}

variable "serialization" {
  type = object({
    type            = string
    encoding        = string
    field_delimiter = string
  })
  default = {
    type            = "Csv"
    encoding        = "UTF8"
    field_delimiter = ","
  }
}

variable "transformation_query" {
  type = string
  default = <<QUERY
    SELECT *
    INTO [YourOutputAlias]
    FROM [YourInputAlias]
QUERY
}

variable "shared_access_policy_name" {
  type = string
  default = "RootManageSharedAccessKey"
}