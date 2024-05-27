output "firewall" {
  description = "A map of the firewalls with their names and other details"
  value = { 
    for firewall in azurerm_firewall.firewall : 
    firewall.name => {
      name             = firewall.name,
      id               = firewall.id,
      ip_configuration = firewall.ip_configuration,
      dns_servers      = firewall.dns_servers
    } 
  }
}

output "firewall_nat_rule_collections" {
  description = "A map of the firewall NAT rule collections with their names and other details"
  value = { 
    for collection in azurerm_firewall_nat_rule_collection.firewall_nat_rule_collection : 
    collection.name => {
      name     = collection.name,
      id       = collection.id,
      rules    = collection.rule
    } 
  }
}

output "firewall_network_rule_collections" {
  description = "A map of the firewall network rule collections with their names and other details"
  value = { 
    for collection in azurerm_firewall_network_rule_collection.firewall_network_rule_collection : 
    collection.name => {
      name     = collection.name,
      id       = collection.id,
      rules    = collection.rule
    } 
  }
}
