output "network_interface_card" {
  description = "A map of the NIC's with their names and other details"
  value = {
    for nic in azurerm_network_interface.network_interface_card :
    nic.name => {
      name               = nic.name,
      id                 = nic.id,
      private_ip_address = nic.private_ip_address
      virtual_machine_id = nic.virtual_machine_id
    }
  }
}

