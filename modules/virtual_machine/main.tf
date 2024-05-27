resource "azurerm_linux_virtual_machine" "linux_virtual_machine" {
  for_each = var.linux_instances

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    each.value.network_interface_id,
  ]

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = file(each.value.public_key)
  }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }

  custom_data = each.value.have_storage == true ? base64encode(templatefile(".//modules//virtual_machine//custom_data.sh", {
    storage_account_name = each.value.storage_account_name
    ACCOUNT_KEY          = each.value.account_key
    container_name       = each.value.container_name
  })) : null
}



resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  for_each = var.windows_instances

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    each.value.network_interface_id,
  ]

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  
  custom_data = each.value.have_storage == true ? base64encode(templatefile(".//modules//virtual_machine//custom_data.sh", {
    storage_account_name = each.value.storage_account_name
    ACCOUNT_KEY          = each.value.ACCOUNT_KEY
    container_name       = each.value.container_name
  })) : null
}


