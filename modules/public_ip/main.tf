resource "azurerm_public_ip" "ip" {
  for_each            = var.ip_instances
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  domain_name_label   = each.value.domain_name_label
  sku                 = each.value.sku
  sku_tier            = each.value.sku_tier

  tags = {
    environment = each.value.environment_tag
  }
}
