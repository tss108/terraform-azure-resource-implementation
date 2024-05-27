output "ip" {
  description = "A map of the IP's with their names and other details"
  value = { 
    for ip in azurerm_public_ip.ip : 
    ip.name => {
      name     = ip.name,
      id       = ip.id,
      ip_address = ip.ip_address
      
    }
  }
}