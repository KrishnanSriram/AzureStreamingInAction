variable "rgname" {
  type = string
}

variable "namespace_name" {
  type = string
}

variable "eventhub_name" {
  type = string
}

variable "rglocation" {
  type = string
}

variable "partition_count" {
  type = number
}

variable "sku" {
  type = string
  default = "standard"
}

variable "eventhub_message_retention" {
  type = number
  default = 7
}