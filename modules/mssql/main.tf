resource "azurerm_mssql_server" "mssql_server" {
  for_each                     = var.server_instances
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}

resource "azurerm_mssql_firewall_rule" "mssql_firewall_rule" {
  for_each         = var.server_instances
  name             = each.value.firewall_name
  server_id        = (azurerm_mssql_server.mssql_server[each.key]).id
  start_ip_address = each.value.firewall_start_ip_address
  end_ip_address   = each.value.firewall_end_ip_address
  depends_on = [
    azurerm_mssql_server.mssql_server
  ]
}

resource "azurerm_mssql_database" "mssql_database" {
  for_each       = { for k, v in var.database_instances : k => v if !v.prevent_destroy }
  name           = each.value.name
  server_id      = each.value.server_id
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant
  enclave_type   = each.value.enclave_type
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_mssql_database" "mssql_database_prevent_destroy" {
  for_each       = { for k, v in var.database_instances : k => v if v.prevent_destroy }
  name           = each.value.name
  server_id      = each.value.server_id
  sku_name       = each.value.sku_name
  zone_redundant = each.value.zone_redundant
  enclave_type   = each.value.enclave_type
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_mssql_firewall_rule" "example" {
  for_each         = var.firewall_rule_instances
  name             = each.value.name
  server_id        = each.value.server_id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}


