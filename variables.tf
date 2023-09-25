variable "rgname" {
  type = string
}

variable "rglocation" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "namespace_name" {
  type = string
}

variable "stream_analytics_job_name" {
  type = string
}

variable "eventhub_name" {
  type = string
}

variable "partition_count" {
  type = number
  default = 2
}