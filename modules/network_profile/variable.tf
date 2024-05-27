variable "vnet_instances" {
  description = "Map of virtual network instances to create"
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
  }))
  default = {
  }
}

variable "subnet_instances" {
  description = "Map of subnet instances to create"
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
  default = {
  }
}

variable "subnet_nsg_association_instances" {
  description = "A map of subnet to NSG associations."
  type = map(object({
    subnet_id                 = string
    network_security_group_id = string
  }))
  default = {

  }
}
