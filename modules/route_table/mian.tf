resource "azurerm_route_table" "route_table" {
  for_each            = var.route_table_instances
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_route" "route" {
  for_each               = var.route_instances
  name                   = each.value.name
  resource_group_name    = each.value.resource_group_name
  route_table_name       = each.value.route_table_name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = each.value.next_hop_in_ip_address
}

/*ensures that all traffic from these subnets is routed accoding to the route table.*/
resource "azurerm_subnet_route_table_association" "route_table_association" {
  for_each       = var.route_table_association
  subnet_id      = each.value.subnet_id
  route_table_id = each.value.route_table_id
}
