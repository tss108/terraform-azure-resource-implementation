variable "redis_cache_instances" {
  description = "Map of Redis Cache instances to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    capacity            = number
    family              = string
    sku_name            = string
  }))
  default = {
  }
}

variable "firewall_rule_instances" {
  description = "Map of MSSQL firewall rule instances with their configurations"
  type = map(object({
    name                = string
    redis_cache_name    = string
    resource_group_name = string
    start_ip            = string
    end_ip              = string
  }))
  default = {

  }
}
