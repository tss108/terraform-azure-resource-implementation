output "network_security_group" {
  description = "A map of the NSG's with their names and other details"
  value = { 
    for nsg in azurerm_network_security_group.network_security_group: 
    nsg.name => {
      name     = nsg.name,
      id       = nsg.id
    }
  }
}

