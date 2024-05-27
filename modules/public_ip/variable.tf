variable "ip_instances" {
  description = "Map of public IP instances to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    domain_name_label   = string
    environment_tag     = string
    sku                 = string
    sku_tier            = string
  }))
  default = {
  }
}
