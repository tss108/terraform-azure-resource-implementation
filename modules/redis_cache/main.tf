resource "azurerm_redis_cache" "redis_cache" {
  for_each            = var.redis_cache_instances
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  capacity            = each.value.capacity
  family              = each.value.family
  sku_name            = each.value.sku_name
  redis_configuration {}
}

resource "azurerm_redis_firewall_rule" "example" {
  for_each            = var.firewall_rule_instances
  name                = each.value.name
  redis_cache_name    = each.value.redis_cache_name
  resource_group_name = each.value.resource_group_name
  start_ip            = each.value.start_ip
  end_ip              = each.value.end_ip
}
