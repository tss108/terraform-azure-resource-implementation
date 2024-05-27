resource "azurerm_network_interface" "network_interface_card" {
  for_each            = var.nic_instances
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.ip_configuration_name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.ip_allocation_method
    public_ip_address_id          = each.value.ip_address_id
  }
}

resource "azurerm_network_interface_security_group_association" "nic_association" {
  for_each                  = var.nic_nsg_association_instances
  network_interface_id      = each.value.network_interface_id
  network_security_group_id = each.value.network_security_group_id
}
