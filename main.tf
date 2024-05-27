// Retrieve details of the current Azure service principal
data "azurerm_client_config" "service_principal" {}

// Local variables to hold the configuration for various network security group (NSG) rules
locals {
  nsg_rule_rdp = {
    name                       = var.nsg_rule_rdp_name
    priority                   = var.nsg_rule_rdp_priority
    direction                  = var.nsg_rule_rdp_direction
    access                     = var.nsg_rule_rdp_access
    protocol                   = var.nsg_rule_rdp_protocol
    source_port_range          = var.nsg_rule_rdp_source_port_range
    destination_port_range     = var.nsg_rule_rdp_destination_port_range
    source_address_prefix      = var.nsg_rule_rdp_source_address_prefix
    destination_address_prefix = var.nsg_rule_rdp_destination_address_prefix
  }
  nsg_rule_ssh = {
    name                       = var.nsg_rule_ssh_name
    priority                   = var.nsg_rule_ssh_priority
    direction                  = var.nsg_rule_ssh_direction
    access                     = var.nsg_rule_ssh_access
    protocol                   = var.nsg_rule_ssh_protocol
    source_port_range          = var.nsg_rule_ssh_source_port_range
    destination_port_range     = var.nsg_rule_ssh_destination_port_range
    source_address_prefix      = var.nsg_rule_ssh_source_address_prefix
    destination_address_prefix = var.nsg_rule_ssh_destination_address_prefix
  }
  nsg_rule_http = {
    name                       = var.nsg_rule_http_name
    priority                   = var.nsg_rule_http_priority
    direction                  = var.nsg_rule_http_direction
    access                     = var.nsg_rule_http_access
    protocol                   = var.nsg_rule_http_protocol
    source_port_range          = var.nsg_rule_http_source_port_range
    destination_port_range     = var.nsg_rule_http_destination_port_range
    source_address_prefix      = var.nsg_rule_http_source_address_prefix
    destination_address_prefix = var.nsg_rule_http_destination_address_prefix
  }
  nsg_rule_https = {
    name                       = var.nsg_rule_https_name
    priority                   = var.nsg_rule_https_priority
    direction                  = var.nsg_rule_https_direction
    access                     = var.nsg_rule_https_access
    protocol                   = var.nsg_rule_https_protocol
    source_port_range          = var.nsg_rule_https_source_port_range
    destination_port_range     = var.nsg_rule_https_destination_port_range
    source_address_prefix      = var.nsg_rule_https_source_address_prefix
    destination_address_prefix = var.nsg_rule_https_destination_address_prefix
  }
  nsg_rule_deny_all_outbound = {
    name                       = var.nsg_rule_deny_all_outbound_name
    priority                   = var.nsg_rule_deny_all_outbound_priority
    direction                  = var.nsg_rule_deny_all_outbound_direction
    access                     = var.nsg_rule_deny_all_outbound_access
    protocol                   = var.nsg_rule_deny_all_outbound_protocol
    source_port_range          = var.nsg_rule_deny_all_outbound_source_port_range
    destination_port_range     = var.nsg_rule_deny_all_outbound_destination_port_range
    source_address_prefix      = var.nsg_rule_deny_all_outbound_source_address_prefix
    destination_address_prefix = var.nsg_rule_deny_all_outbound_destination_address_prefix
  }
}

// Create resource groups
module "resource_group" {
  source = "./modules/resource_group"
  instances = {
    rg1 = {
      name     = var.resource_group_1_name
      location = var.resource_group_1_location
    },
    rg2 = {
      name     = var.resource_group_2_name
      location = var.resource_group_2_location
    }
  }
}

// Create network profile including virtual networks and subnets
module "network_profile" {
  source = "./modules/network_profile"
  vnet_instances = {
    vnet1 = {
      name                = var.virtual_network_1_name
      address_space       = [var.virtual_network_1_address_space]
      location            = module.resource_group.resource_groups[var.resource_group_1_name].location
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
    },
  }

  subnet_instances = {
    subnet1 = {
      name                 = var.subnet_1_name
      virtual_network_name = module.network_profile.virtual_network[var.virtual_network_1_name].name
      address_prefixes     = [var.subnet_1_address_prefixes]
      resource_group_name  = module.resource_group.resource_groups[var.resource_group_1_name].name
    },
    subnet2 = {
      name                 = var.subnet_2_name
      virtual_network_name = module.network_profile.virtual_network[var.virtual_network_1_name].name
      address_prefixes     = [var.subnet_2_address_prefixes]
      resource_group_name  = module.resource_group.resource_groups[var.resource_group_1_name].name
    },
    firewall_subnet1 = {
      name                 = var.firewall_subnet_1_name
      virtual_network_name = module.network_profile.virtual_network[var.virtual_network_1_name].name
      address_prefixes     = [var.firewall_subnet_1_address_prefixes]
      resource_group_name  = module.resource_group.resource_groups[var.resource_group_1_name].name
    }
  }

  depends_on = [
    module.resource_group
  ]
}

// Module to create public IP addresses
module "public_ip" {
  source = "./modules/public_ip"
  ip_instances = {
    ip1 = {
      name                = var.public_ip1_name
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
      location            = module.resource_group.resource_groups[var.resource_group_1_name].location
      allocation_method   = var.public_ip1_allocation_method
      domain_name_label   = var.public_ip1_domain_name_label
      sku                 = var.public_ip1_sku
      sku_tier            = var.public_ip1_sku_tier
      environment_tag     = var.public_ip1_environment_tag
    },
    ip2 = {
      name                = var.public_ip2_name
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
      location            = module.resource_group.resource_groups[var.resource_group_1_name].location
      allocation_method   = var.public_ip2_allocation_method
      domain_name_label   = var.public_ip2_domain_name_label
      sku                 = var.public_ip2_sku
      sku_tier            = var.public_ip2_sku_tier
      environment_tag     = var.public_ip2_environment_tag
    },
    ip3 = {
      name                = var.public_ip3_name
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
      location            = module.resource_group.resource_groups[var.resource_group_1_name].location
      allocation_method   = var.public_ip3_allocation_method
      domain_name_label   = var.public_ip3_domain_name_label
      sku                 = var.public_ip3_sku
      sku_tier            = var.public_ip3_sku_tier
      environment_tag     = var.public_ip3_environment_tag
    }
  }
  depends_on = [
    module.resource_group
  ]
}

// Module to create network security groups (NSG)
module "network_security_group" {
  source = "./modules/network_security_group"
  nsg_instances = {
    windows_vm_nsg_1 = {
      name                = var.windows_vm_nsg_1_name
      location            = module.resource_group.resource_groups[var.resource_group_1_name].location
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
      security_rules = [
        local.nsg_rule_rdp,
        local.nsg_rule_ssh,
        local.nsg_rule_http,
        local.nsg_rule_https,
        local.nsg_rule_deny_all_outbound
      ]
    },
    linux_vm_nsg_1 = {
      name                = var.linux_vm_nsg_1_name
      location            = module.resource_group.resource_groups[var.resource_group_1_name].location
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
      security_rules = [
        local.nsg_rule_ssh,
        local.nsg_rule_http,
        local.nsg_rule_https,
        local.nsg_rule_deny_all_outbound
      ]
    }
  }
  depends_on = [
    module.resource_group,
  ]
}

// Module to create network interface cards (NIC)
module "network_interface_card" {
  source = "./modules/network_interface_card"
  nic_instances = {
    nic1 = {
      name                  = var.nic_1_name
      location              = module.resource_group.resource_groups[var.resource_group_1_name].location
      resource_group_name   = module.resource_group.resource_groups[var.resource_group_1_name].name
      ip_configuration_name = var.nic_1_ip_configuration_name
      subnet_id             = module.network_profile.subnet[var.subnet_1_name].id
      ip_allocation_method  = var.nic_1_ip_allocation_method
      ip_address_id         = module.public_ip.ip[var.public_ip1_name].id
    },
    nic2 = {
      name                  = var.nic_2_name
      location              = module.resource_group.resource_groups[var.resource_group_1_name].location
      resource_group_name   = module.resource_group.resource_groups[var.resource_group_1_name].name
      ip_configuration_name = var.nic_2_ip_configuration_name
      subnet_id             = module.network_profile.subnet[var.subnet_2_name].id
      ip_allocation_method  = var.nic_2_ip_allocation_method
      ip_address_id         = module.public_ip.ip[var.public_ip2_name].id
    }
  }
  nic_nsg_association_instances = {
    nic1_association = {
      network_interface_id      = module.network_interface_card.network_interface_card[var.nic_1_name].id
      network_security_group_id = module.network_security_group.network_security_group[var.windows_vm_nsg_1_name].id
    },
    nic2_association = {
      network_interface_id      = module.network_interface_card.network_interface_card[var.nic_2_name].id
      network_security_group_id = module.network_security_group.network_security_group[var.linux_vm_nsg_1_name].id
    }
  }
  depends_on = [
    module.resource_group,
    module.network_profile,
    module.public_ip,
    module.network_security_group
  ]
}

module "key_vault" {
  source = "./modules/vault"
  keyvault_instances = {
    keyvault1 = {
      name                        = var.keyvault_1_name
      resource_group_name         = (module.resource_group.resource_groups[var.resource_group_1_name]).name
      location                    = (module.resource_group.resource_groups[var.resource_group_1_name]).location
      enabled_for_disk_encryption = var.keyvault_1_enabled_for_disk_encryption
      tenant_id                   = data.azurerm_client_config.service_principal.tenant_id
      sku_name                    = var.keyvault_1_sku_name
      soft_delete_retention_days  = var.keyvault_1_soft_delete_retention_days
      purge_protection_enabled    = var.keyvault_1_purge_protection_enabled
      object_id                   = data.azurerm_client_config.service_principal.object_id
      key_permissions             = var.keyvault_1_key_permissions
      secret_permissions          = var.keyvault_1_secret_permissions
      storage_permissions         = var.keyvault_1_storage_permissions
    }
  }
  secret_instances = {
    secret = {
      name         = var.secret_name
      value        = var.secret_value
      key_vault_id = (module.key_vault.keyvault[var.keyvault_1_name]).id
    },
  }
  depends_on = [
    module.resource_group,
  ]
}



// Module to create storage accounts and containers
module "storage_account" {
  source = "./modules/storage_account"
  storage_account_instances = {
    sa1 = {
      name                     = var.storage_account1_name
      resource_group_name      = module.resource_group.resource_groups[var.resource_group_1_name].name
      location                 = module.resource_group.resource_groups[var.resource_group_1_name].location
      account_tier             = var.storage_account1_tier
      account_replication_type = var.storage_account1_replication_type
    },
    sa2 = {
      name                     = var.storage_account2_name
      resource_group_name      = module.resource_group.resource_groups[var.resource_group_1_name].name
      location                 = module.resource_group.resource_groups[var.resource_group_1_name].location
      account_tier             = var.storage_account2_tier
      account_replication_type = var.storage_account2_replication_type
    }
  }
  storage_container_instances = {
    sc1 = {
      name                  = var.storage_container1_name
      storage_account_name  = module.storage_account.storage_account[var.storage_account1_name].name
      container_access_type = var.storage_container1_access_type
    }
  }
  blob_instances = {
    blob1 = {
      name                   = var.blob1_name
      storage_account_name   = module.storage_account.storage_account[var.storage_account1_name].name
      storage_container_name = module.storage_account.storage_container[var.storage_container1_name].name
      type                   = var.blob1_type
      data_name              = var.blob1_data_name
    }
  }
  depends_on = [
    module.resource_group
  ]
}

// Module to create virtual machines
module "virtual_machine" {
  source = "./modules/virtual_machine"
  windows_instances = {
    win_vm_001 = {
      name                 = var.windows_vm1_name
      resource_group_name  = module.resource_group.resource_groups[var.resource_group_1_name].name
      location             = module.resource_group.resource_groups[var.resource_group_1_name].location
      size                 = var.windows_vm1_size
      admin_username       = var.windows_vm1_admin_username
      admin_password       = module.key_vault.secret[var.secret_name].value
      network_interface_id = module.network_interface_card.network_interface_card[var.nic_1_name].id
      caching              = var.windows_vm1_caching
      storage_account_type = var.windows_vm1_storage_account_type
      publisher            = var.windows_vm1_publisher
      offer                = var.windows_vm1_offer
      sku                  = var.windows_vm1_sku
      version              = var.windows_vm1_version
      have_storage         = var.windows_vm1_have_storage
    },
  }
  linux_instances = {
    lin_vm_001 = {
      name                 = var.linux_vm1_name
      resource_group_name  = module.resource_group.resource_groups[var.resource_group_1_name].name
      location             = module.resource_group.resource_groups[var.resource_group_1_name].location
      size                 = var.linux_vm1_size
      admin_username       = var.linux_vm1_admin_username
      admin_password       = module.key_vault.secret[var.secret_name].value
      public_key           = var.linux_vm1_public_key
      network_interface_id = module.network_interface_card.network_interface_card[var.nic_2_name].id
      caching              = var.linux_vm1_caching
      storage_account_type = var.linux_vm1_storage_account_type
      publisher            = var.linux_vm1_publisher
      offer                = var.linux_vm1_offer
      sku                  = var.linux_vm1_sku
      version              = var.linux_vm1_version
      have_storage         = var.linux_vm1_have_storage
      storage_account_name = module.storage_account.storage_account[var.storage_account1_name].name
      account_key          = module.storage_account.storage_account[var.storage_account1_name].primary_access_key
      container_name       = module.storage_account.storage_container[var.storage_container1_name].name
    },
  }
  depends_on = [
    module.resource_group,
    module.network_profile,
    module.network_interface_card,
    module.key_vault,
    module.storage_account
  ]
}

// Module to create MSSQL servers and databases
module "mssql" {
  source = "./modules/mssql"
  server_instances = {
    server1 = {
      name                         = var.mssql_server1_name
      resource_group_name          = module.resource_group.resource_groups[var.resource_group_1_name].name
      location                     = module.resource_group.resource_groups[var.resource_group_1_name].location
      version                      = var.mssql_server1_version
      administrator_login          = var.mssql_server1_administrator_login
      administrator_login_password = module.key_vault.secret[var.secret_name].value
      firewall_name                = var.mssql_server1_firewall_name
      firewall_start_ip_address    = var.mssql_server1_firewall_start_ip_address
      firewall_end_ip_address      = var.mssql_server1_firewall_end_ip_address
    }
  }
  database_instances = {
    db1 = {
      name            = var.mssql_db1_name
      server_id       = module.mssql.mssql_server[var.mssql_server1_name].id
      sku_name        = var.mssql_db1_sku_name
      zone_redundant  = var.mssql_db1_zone_redundant
      enclave_type    = var.mssql_db1_enclave_type
      prevent_destroy = var.mssql_db1_prevent_destroy
    }
  }
  depends_on = [
    module.resource_group,
    module.key_vault,
  ]
}

// Module to create firewalls and firewall rules
module "firewall" {
  source = "./modules/firewall"
  firewall_instances = {
    firewall_001 = {
      name                  = var.firewall_001_name
      location              = module.resource_group.resource_groups[var.resource_group_1_name].location
      resource_group_name   = module.resource_group.resource_groups[var.resource_group_1_name].name
      sku_name              = var.firewall_001_sku_name
      sku_tier              = var.firewall_001_sku_tier
      ip_configuration_name = var.firewall_001_ip_configuration_name
      subnet_id             = module.network_profile.subnet[var.firewall_subnet_1_name].id
      public_ip_address_id  = module.public_ip.ip[var.public_ip3_name].id
    }
  }

  firewall_network_rule_instances = {
    network_rule_001 = {
      name                = var.network_rule_001_name
      azure_firewall_name = module.firewall.firewall[var.firewall_001_name].name
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
      priority            = var.network_rule_001_priority
      action              = var.network_rule_001_action
      rules = [
        {
          name              = var.network_rule1_name
          source_addresses  = var.network_rule1_source_addresses
          destination_ports = var.network_rule1_destination_ports
          destination_addresses = [
            module.virtual_machine.linux_virtual_machines[var.linux_vm1_name].public_ip_address,
            module.virtual_machine.linux_virtual_machines[var.linux_vm1_name].private_ip_address,
            var.subnet_1_address_prefixes,
            var.subnet_2_address_prefixes
          ]
          protocols = var.network_rule1_protocols
        }
      ]
    }
  }
  depends_on = [
    module.network_profile,
    module.public_ip,
    module.resource_group,
    module.virtual_machine
  ]
}


// Module to create route table and routes
module "route_table" {
  source = "./modules/route_table"
  route_table_instances = {
    route_table_001 = {
      name                = var.route_table_1_name
      location            = module.resource_group.resource_groups[var.resource_group_1_name].location
      resource_group_name = module.resource_group.resource_groups[var.resource_group_1_name].name
    },
  }
  route_instances = {
    route_1 = {
      name                   = var.route_1_name
      resource_group_name    = module.resource_group.resource_groups[var.resource_group_1_name].name
      route_table_name       = module.route_table.route_table[var.route_table_1_name].name
      address_prefix         = var.route_1_address_prefix
      next_hop_type          = var.route_1_next_hop_type
      next_hop_in_ip_address = module.firewall.firewall[var.firewall_001_name].ip_configuration[0].private_ip_address
    },
  }
  route_table_association = {
    subnet_association_1 = {
      subnet_id      = module.network_profile.subnet[var.subnet_1_name].id
      route_table_id = module.route_table.route_table[var.route_table_1_name].id
    },
    subnet_association_2 = {
      subnet_id      = module.network_profile.subnet[var.subnet_2_name].id
      route_table_id = module.route_table.route_table[var.route_table_1_name].id
    }
  }
  depends_on = [
    module.resource_group,
    module.network_profile,
    module.public_ip,
  ]
}

