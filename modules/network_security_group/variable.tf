variable "nsg_instances" {
  description = "A map of Network Security Groups to create."
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
  default = {

  }
}

variable "nsg_security_rule" {
  description = "A map of Network Security Group security rules."
  type = map(object({
    name                        = string
    priority                    = number
    direction                   = string
    access                      = string
    protocol                    = string
    source_port_range           = string
    destination_port_range      = string
    source_address_prefix       = string
    destination_address_prefix  = string
    resource_group_name         = string
    network_security_group_name = string
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

variable "nic_nsg_association_instances" {
  description = "A map of NIC to NSG associations."
  type = map(object({
    network_interface_id      = string
    network_security_group_id = string
  }))
  default = {

  }
}
