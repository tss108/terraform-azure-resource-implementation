output "linux_virtual_machines" {
  description = "A map of the Linux virtual machines with their names and other details"
  value = {
    for vm in azurerm_linux_virtual_machine.linux_virtual_machine :
    vm.name => {
      name                         = vm.name,
      id                           = vm.id,
      resource_group_name          = vm.resource_group_name,
      location                     = vm.location,
      size                         = vm.size,
      admin_username               = vm.admin_username,
      network_interface_ids        = vm.network_interface_ids,
      os_disk_caching              = vm.os_disk.0.caching,
      os_disk_storage_account_type = vm.os_disk.0.storage_account_type,
      image_publisher              = vm.source_image_reference.0.publisher,
      image_offer                  = vm.source_image_reference.0.offer,
      image_sku                    = vm.source_image_reference.0.sku,
      image_version                = vm.source_image_reference.0.version,
      custom_data                  = vm.custom_data,
      private_ip_address           = vm.private_ip_address,
      public_ip_address            = vm.public_ip_address,
      private_ip_addresses         = vm.private_ip_addresses,
      public_ip_addresses          = vm.public_ip_addresses
    }
  }
}

output "windows_virtual_machines" {
  description = "A map of the Windows virtual machines with their names and other details"
  value = {
    for vm in azurerm_windows_virtual_machine.windows_virtual_machine :
    vm.name => {
      name                         = vm.name,
      id                           = vm.id,
      resource_group_name          = vm.resource_group_name,
      location                     = vm.location,
      size                         = vm.size,
      admin_username               = vm.admin_username,
      network_interface_ids        = vm.network_interface_ids,
      os_disk_caching              = vm.os_disk.0.caching,
      os_disk_storage_account_type = vm.os_disk.0.storage_account_type,
      image_publisher              = vm.source_image_reference.0.publisher,
      image_offer                  = vm.source_image_reference.0.offer,
      image_sku                    = vm.source_image_reference.0.sku,
      image_version                = vm.source_image_reference.0.version,
      custom_data                  = vm.custom_data,
      private_ip_address           = vm.private_ip_address,
      public_ip_address            = vm.public_ip_address,
      private_ip_addresses         = vm.private_ip_addresses,
      public_ip_addresses          = vm.public_ip_addresses
    }
  }
}
