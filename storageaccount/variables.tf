
variable "rgname" {
  type = string
}

variable "rglocation" {
  type = string
  default = "useast2"
}

variable "storageaccount_name" {
  type = string
}

variable "account_tier" {
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  type = string
  default = "LRS"
}

variable "container_name" {
  type = string
}

variable "container_access_type" {
  type = string
  default = "private"
}