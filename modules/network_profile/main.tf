resource "azurerm_virtual_network" "virtual_network" {
  for_each = var.vnet_instances
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.subnet_instances
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_subnet_network_security_group_association" "example" {
  for_each                  = var.subnet_nsg_association_instances
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id
}