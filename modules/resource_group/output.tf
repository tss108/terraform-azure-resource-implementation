output "resource_groups" {
  description = "A map of the resource groups with their names and locations"
  value = { 
    for rg in azurerm_resource_group.resource_group : 
    rg.name => {
      name     = rg.name,
      location = rg.location
    }
  }
}