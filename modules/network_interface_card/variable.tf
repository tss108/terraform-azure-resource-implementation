variable "nic_instances" {
  description = "Map of network interface instances to create"
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    ip_configuration_name = string
    subnet_id             = string
    ip_allocation_method  = string
    ip_address_id         = string
  }))
  default = {

  }
}

variable "nic_nsg_association_instances" {
  description = "Map of network interface security group associations to create"
  type = map(object({
    network_interface_id      = string
    network_security_group_id = string
  }))
  default = {

  }
}
