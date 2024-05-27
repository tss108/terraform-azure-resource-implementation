resource "azurerm_firewall" "firewall" {
  for_each            = var.firewall_instances
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = each.value.subnet_id
    public_ip_address_id = each.value.public_ip_address_id
  }
}


resource "azurerm_firewall_nat_rule_collection" "firewall_nat_rule_collection" {
  for_each            = var.firewall_nat_rule_instances
  name                = each.value.name
  azure_firewall_name = each.value.azure_firewall_name
  resource_group_name = each.value.resource_group_name
  priority            = each.value.priority
  action              = each.value.action

   dynamic "rule" {
    for_each = each.value.rules
    content {
      name                  = rule.value.name
      source_addresses      = rule.value.source_addresses
      destination_ports     = rule.value.destination_ports
      destination_addresses = rule.value.destination_addresses
      translated_port       = rule.value.translated_port
      translated_address    = rule.value.translated_address
      protocols             = rule.value.protocols
    }
  }
}

resource "azurerm_firewall_network_rule_collection" "firewall_network_rule_collection" {
  for_each = var.firewall_network_rule_instances
  name                = each.value.name
  azure_firewall_name = each.value.azure_firewall_name
  resource_group_name = each.value.resource_group_name
  priority            = each.value.priority
  action              = each.value.action

  dynamic "rule" {
    for_each = each.value.rules
    content {
      name                  = rule.value.name
      source_addresses      = rule.value.source_addresses
      destination_ports     = rule.value.destination_ports
      destination_addresses = rule.value.destination_addresses
      protocols             = rule.value.protocols
    }
  }
}
