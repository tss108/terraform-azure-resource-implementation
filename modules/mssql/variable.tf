variable "server_instances" {
  description = "Map of MSSQL Server instances to create"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    firewall_name                = string
    firewall_start_ip_address    = string
    firewall_end_ip_address      = string
  }))
  default = {

  }
}

variable "database_instances" {
  description = "Map of MSSQL Database instances to create"
  type = map(object({
    name            = string
    server_id       = string
    sku_name        = string
    zone_redundant  = bool
    enclave_type    = string
    prevent_destroy = bool
  }))
  default = {

  }
}

variable "firewall_rule_instances" {
  description = "Map of MSSQL firewall rule instances with their configurations"
  type = map(object({
    name             = string
    server_id        = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {

  }
}
