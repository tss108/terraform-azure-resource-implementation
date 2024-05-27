variable "linux_instances" {
  description = "Map of Linux Virtual Machine instances to create"
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    size                 = string
    admin_username       = string
    admin_password       = string
    public_key           = string
    network_interface_id = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    have_storage         = bool
    storage_account_name = optional(string)
    account_key          = optional(string)
    container_name       = optional(string)
  }))
  default = {
  }
}

variable "windows_instances" {
  description = "Map of Windows Virtual Machine instances to create"
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    size                 = string
    admin_username       = string
    admin_password       = string
    network_interface_id = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    have_storage         = bool
    storage_account_name = optional(string)
    ACCOUNT_KEY          = optional(string)
    container_name       = optional(string)
  }))
  default = {
  }
}
