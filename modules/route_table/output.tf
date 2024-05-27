output "route_table" {
  description = "A map of the route tables with their names and other details"
  value = { 
    for rt in azurerm_route_table.route_table : 
    rt.name => {
      name                = rt.name
      id                  = rt.id
      location            = rt.location
      resource_group_name = rt.resource_group_name
    }
  }
}

output "route" {
  description = "A map of the routes with their names and other details"
  value = { 
    for route in azurerm_route.route : 
    route.name => {
      name                = route.name
      id                  = route.id
      resource_group_name = route.resource_group_name
      route_table_name    = route.route_table_name
      address_prefix      = route.address_prefix
      next_hop_type       = route.next_hop_type
    }
  }
}

output "route_table_association" {
  description = "A map of the route table associations with their details"
  value = { 
    for rta in azurerm_subnet_route_table_association.route_table_association : 
    rta.subnet_id => {
      subnet_id      = rta.subnet_id
      route_table_id = rta.route_table_id
    }
  }
}


