variable "firewall_instances" {
  description = "Map of firewall instances with their configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku_name            = string
    sku_tier            = string
    ip_configuration_name = string
    subnet_id            = string
    public_ip_address_id = string
  }))
  default = {
  }
}

variable "firewall_nat_rule_instances" {
  description = "Map of firewall NAT rule instances with their associated rules"
  type = map(object({
    name                = string
    azure_firewall_name = string
    resource_group_name = string
    priority            = number
    action              = string
    rules = list(object({
      name                  = string
      source_addresses      = list(string)
      destination_ports     = list(string)
      destination_addresses = list(string)
      translated_port       = string
      translated_address    = string
      protocols             = list(string)
    }))
  }))
  default = {
  }
}

variable "firewall_network_rule_instances" {
  description = "Map of firewall network rule instances with their associated rules"
  type = map(object({
    name                = string
    azure_firewall_name = string
    resource_group_name = string
    priority            = number
    action              = string
    rules = list(object({
      name                  = string
      source_addresses      = list(string)
      destination_ports     = list(string)
      destination_addresses = list(string)
      protocols             = list(string)
    }))
  }))
  default = {
  }
}
