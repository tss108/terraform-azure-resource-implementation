variable "route_table_instances" {
  description = "A map of route table instances"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
  default = {
  }
}

variable "route_instances" {
  description = "A map of route instances"
  type = map(object({
    name                   = string
    resource_group_name    = string
    route_table_name       = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))
  default = {
  }
}

variable "route_table_association" {
  description = "A map of subnet route table associations"
  type = map(object({
    subnet_id      = string
    route_table_id = string
  }))
  default = {
  }
}
