output "virtual_network" {
  description = "A map of the virtual networks with their names and other details"
  value = { 
    for vnet in azurerm_virtual_network.virtual_network : 
    vnet.name => {
      name     = vnet.name,
      id       = vnet.id
    }
  }
}

output "subnet" {
  description = "A map of the virtual subnets with their names and other details"
  value = { 
    for subnet in azurerm_subnet.subnet : 
    subnet.name => {
      name     = subnet.name,
      id       = subnet.id
    }
  }
}














# output "vnet_details" {
#     value = azurerm_virtual_network.virtual_network
# }
# output "aks_subnet_details" {
#     value = azurerm_subnet.aks_subnet
# }
# output "firewall_subnet_details" {
#     value = azurerm_subnet.firewall_subnet
# }
# output "podcidr_subnet_details" {
#     value = azurerm_subnet.podcidr_subnet
# }

