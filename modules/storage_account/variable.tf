variable "storage_account_instances" {
  description = "Map of storage account instances to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
  default = {
  }
}

variable "storage_container_instances" {
  description = "Map of storage container instances to create"
  type = map(object({
    name                  = string
    storage_account_name  = string
    container_access_type = string
  }))
  default = {
  }
}

variable "blob_instances" {
  description = "Map of blob instances to create in storage containers"
  type = map(object({
    name                   = string
    storage_account_name   = string
    storage_container_name = string
    type                   = string
    data_name              = string
  }))
  default = {
  }
}
