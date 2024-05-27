resource "azurerm_resource_group" "resource_group" {
    for_each = var.instances
    name = each.value.name
    location = each.value.location
}