resource "azurerm_network_security_group" "network_security_group" {
  for_each            = var.nsg_instances
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "security_rule" {
    for_each = each.value.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_network_security_rule" "network_security_group_rule" {
  # This resources is used in case of there is an already existed NSG and have a need of new security rule
  for_each                    = var.nsg_security_rule
  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = each.value.resource_group_name
  network_security_group_name = each.value.network_security_group_name
}

resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  for_each                  = var.subnet_nsg_association_instances
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id
}

resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
  for_each                  = var.nic_nsg_association_instances
  network_interface_id      = each.value.network_interface_id
  network_security_group_id = each.value.network_security_group_id
}
