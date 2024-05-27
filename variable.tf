// Variables for Service Principal
variable "client_id" {
  description = "azure service principal id"
  sensitive   = true
}
variable "client_secret" {
  description = "azure service principal secret"
  sensitive   = true
}
variable "tenant_id" {
  description = "azure subscription tenant id"
  sensitive   = true
}
variable "subscription_id" {
  description = "azure subscription id"
  sensitive   = true
}


// Local Block Variables
// Variables for NSG rules
variable "nsg_rule_rdp_name" {
  description = "Name of the RDP rule for the NSG."
  type        = string
}
variable "nsg_rule_rdp_priority" {
  description = "Priority of the RDP rule for the NSG."
  type        = number
}
variable "nsg_rule_rdp_direction" {
  description = "Direction of the RDP rule for the NSG."
  type        = string
}
variable "nsg_rule_rdp_access" {
  description = "Access type of the RDP rule for the NSG."
  type        = string
}
variable "nsg_rule_rdp_protocol" {
  description = "Protocol of the RDP rule for the NSG."
  type        = string
}
variable "nsg_rule_rdp_source_port_range" {
  description = "Source port range of the RDP rule for the NSG."
  type        = string
}
variable "nsg_rule_rdp_destination_port_range" {
  description = "Destination port range of the RDP rule for the NSG."
  type        = string
}
variable "nsg_rule_rdp_source_address_prefix" {
  description = "Source address prefix of the RDP rule for the NSG."
  type        = string
}
variable "nsg_rule_rdp_destination_address_prefix" {
  description = "Destination address prefix of the RDP rule for the NSG."
  type        = string
}

variable "nsg_rule_ssh_name" {
  description = "Name of the SSH rule for the NSG."
  type        = string
}
variable "nsg_rule_ssh_priority" {
  description = "Priority of the SSH rule for the NSG."
  type        = number
}
variable "nsg_rule_ssh_direction" {
  description = "Direction of the SSH rule for the NSG."
  type        = string
}
variable "nsg_rule_ssh_access" {
  description = "Access type of the SSH rule for the NSG."
  type        = string
}
variable "nsg_rule_ssh_protocol" {
  description = "Protocol of the SSH rule for the NSG."
  type        = string
}
variable "nsg_rule_ssh_source_port_range" {
  description = "Source port range of the SSH rule for the NSG."
  type        = string
}
variable "nsg_rule_ssh_destination_port_range" {
  description = "Destination port range of the SSH rule for the NSG."
  type        = string
}
variable "nsg_rule_ssh_source_address_prefix" {
  description = "Source address prefix of the SSH rule for the NSG."
  type        = string
}
variable "nsg_rule_ssh_destination_address_prefix" {
  description = "Destination address prefix of the SSH rule for the NSG."
  type        = string
}

variable "nsg_rule_http_name" {
  description = "Name of the HTTP rule for the NSG."
  type        = string
}
variable "nsg_rule_http_priority" {
  description = "Priority of the HTTP rule for the NSG."
  type        = number
}
variable "nsg_rule_http_direction" {
  description = "Direction of the HTTP rule for the NSG."
  type        = string
}
variable "nsg_rule_http_access" {
  description = "Access type of the HTTP rule for the NSG."
  type        = string
}
variable "nsg_rule_http_protocol" {
  description = "Protocol of the HTTP rule for the NSG."
  type        = string
}
variable "nsg_rule_http_source_port_range" {
  description = "Source port range of the HTTP rule for the NSG."
  type        = string
}
variable "nsg_rule_http_destination_port_range" {
  description = "Destination port range of the HTTP rule for the NSG."
  type        = string
}
variable "nsg_rule_http_source_address_prefix" {
  description = "Source address prefix of the HTTP rule for the NSG."
  type        = string
}
variable "nsg_rule_http_destination_address_prefix" {
  description = "Destination address prefix of the HTTP rule for the NSG."
  type        = string
}

variable "nsg_rule_https_name" {
  description = "Name of the HTTPS rule for the NSG."
  type        = string
}
variable "nsg_rule_https_priority" {
  description = "Priority of the HTTPS rule for the NSG."
  type        = number
}
variable "nsg_rule_https_direction" {
  description = "Direction of the HTTPS rule for the NSG."
  type        = string
}
variable "nsg_rule_https_access" {
  description = "Access type of the HTTPS rule for the NSG."
  type        = string
}
variable "nsg_rule_https_protocol" {
  description = "Protocol of the HTTPS rule for the NSG."
  type        = string
}
variable "nsg_rule_https_source_port_range" {
  description = "Source port range of the HTTPS rule for the NSG."
  type        = string
}
variable "nsg_rule_https_destination_port_range" {
  description = "Destination port range of the HTTPS rule for the NSG."
  type        = string
}
variable "nsg_rule_https_source_address_prefix" {
  description = "Source address prefix of the HTTPS rule for the NSG."
  type        = string
}
variable "nsg_rule_https_destination_address_prefix" {
  description = "Destination address prefix of the HTTPS rule for the NSG."
  type        = string
}

variable "nsg_rule_deny_all_outbound_name" {
  description = "Name of the deny all outbound rule for the NSG."
  type        = string
}
variable "nsg_rule_deny_all_outbound_priority" {
  description = "Priority of the deny all outbound rule for the NSG."
  type        = number
}
variable "nsg_rule_deny_all_outbound_direction" {
  description = "Direction of the deny all outbound rule for the NSG."
  type        = string
}
variable "nsg_rule_deny_all_outbound_access" {
  description = "Access type of the deny all outbound rule for the NSG."
  type        = string
}
variable "nsg_rule_deny_all_outbound_protocol" {
  description = "Protocol of the deny all outbound rule for the NSG."
  type        = string
}
variable "nsg_rule_deny_all_outbound_source_port_range" {
  description = "Source port range of the deny all outbound rule for the NSG."
  type        = string
}
variable "nsg_rule_deny_all_outbound_destination_port_range" {
  description = "Destination port range of the deny all outbound rule for the NSG."
  type        = string
}
variable "nsg_rule_deny_all_outbound_source_address_prefix" {
  description = "Source address prefix of the deny all outbound rule for the NSG."
  type        = string
}
variable "nsg_rule_deny_all_outbound_destination_address_prefix" {
  description = "Destination address prefix of the deny all outbound rule for the NSG."
  type        = string
}


// Main Block Variable
// Variables for resource groups
variable "resource_group_1_name" {
  description = "Name of the first resource group."
  type        = string
}
variable "resource_group_1_location" {
  description = "Location of the first resource group."
  type        = string
}
variable "resource_group_2_name" {
  description = "Name of the second resource group."
  type        = string
}
variable "resource_group_2_location" {
  description = "Location of the second resource group."
  type        = string
}

// Variables for virtual network
variable "virtual_network_1_name" {
  description = "Name of the first virtual network."
  type        = string
}
variable "virtual_network_1_address_space" {
  description = "Address space of the first virtual network."
  type        = string
}

// Variables for subnets
variable "subnet_1_name" {
  description = "Name of the first subnet."
  type        = string
}
variable "subnet_1_address_prefixes" {
  description = "Address prefixes of the first subnet."
  type        = string
}
variable "subnet_2_name" {
  description = "Name of the second subnet."
  type        = string
}
variable "subnet_2_address_prefixes" {
  description = "Address prefixes of the second subnet."
  type        = string
}
variable "firewall_subnet_1_name" {
  description = "Name of the subnet for the firewall."
  type        = string
}
variable "firewall_subnet_1_address_prefixes" {
  description = "Address prefixes of the subnet for the firewall."
  type        = string
}

// Variables for public IP addresses
variable "public_ip1_name" {
  description = "Name of the first public IP address."
  type        = string
}
variable "public_ip1_allocation_method" {
  description = "Allocation method for the first public IP address."
  type        = string
}
variable "public_ip1_domain_name_label" {
  description = "Domain name label for the first public IP address."
  type        = string
}
variable "public_ip1_sku" {
  description = "SKU for the first public IP address."
  type        = string
}
variable "public_ip1_sku_tier" {
  description = "SKU tier for the first public IP address."
  type        = string
}
variable "public_ip1_environment_tag" {
  description = "Environment tag for the first public IP address."
  type        = string
}
variable "public_ip2_name" {
  description = "Name of the second public IP address."
  type        = string
}
variable "public_ip2_allocation_method" {
  description = "Allocation method for the second public IP address."
  type        = string
}
variable "public_ip2_domain_name_label" {
  description = "Domain name label for the second public IP address."
  type        = string
}
variable "public_ip2_sku" {
  description = "SKU for the second public IP address."
  type        = string
}
variable "public_ip2_sku_tier" {
  description = "SKU tier for the second public IP address."
  type        = string
}
variable "public_ip2_environment_tag" {
  description = "Environment tag for the second public IP address."
  type        = string
}
variable "public_ip3_name" {
  description = "Name of the third public IP address."
  type        = string
}
variable "public_ip3_allocation_method" {
  description = "Allocation method for the third public IP address."
  type        = string
}
variable "public_ip3_domain_name_label" {
  description = "Domain name label for the third public IP address."
  type        = string
}
variable "public_ip3_sku" {
  description = "SKU for the third public IP address."
  type        = string
}
variable "public_ip3_sku_tier" {
  description = "SKU tier for the third public IP address."
  type        = string
}
variable "public_ip3_environment_tag" {
  description = "Environment tag for the third public IP address."
  type        = string
}

// Variables for network security groups (NSG)
variable "windows_vm_nsg_1_name" {
  description = "Name of the NSG for the first Windows VM."
  type        = string
}
variable "linux_vm_nsg_1_name" {
  description = "Name of the NSG for the first Linux VM."
  type        = string
}

// Variables for network interface cards (NIC)
variable "nic_1_name" {
  description = "Name of the first network interface card."
  type        = string
}
variable "nic_1_ip_configuration_name" {
  description = "IP configuration name for the first NIC."
  type        = string
}
variable "nic_1_ip_allocation_method" {
  description = "IP allocation method for the first NIC."
  type        = string
}
variable "nic_1_ip_address_id" {
  description = "Public IP address ID for the first NIC."
  type        = string
}
variable "nic_2_name" {
  description = "Name of the second network interface card."
  type        = string
}
variable "nic_2_ip_configuration_name" {
  description = "IP configuration name for the second NIC."
  type        = string
}
variable "nic_2_ip_allocation_method" {
  description = "IP allocation method for the second NIC."
  type        = string
}
variable "nic_2_ip_address_id" {
  description = "Public IP address ID for the second NIC."
  type        = string
}

// Variables for Key Vault
variable "keyvault_1_name" {
  description = "Name of the Key Vault."
  type        = string
}
variable "keyvault_1_enabled_for_disk_encryption" {
  description = "Whether the Key Vault is enabled for disk encryption."
  type        = bool
}
variable "keyvault_1_sku_name" {
  description = "SKU name for the Key Vault."
  type        = string
}
variable "keyvault_1_soft_delete_retention_days" {
  description = "Soft delete retention days for the Key Vault."
  type        = number
}
variable "keyvault_1_purge_protection_enabled" {
  description = "Whether purge protection is enabled for the Key Vault."
  type        = bool
}
variable "keyvault_1_key_permissions" {
  description = "Key permissions for the Key Vault."
  type        = list(string)
}
variable "keyvault_1_secret_permissions" {
  description = "Secret permissions for the Key Vault."
  type        = list(string)
}
variable "keyvault_1_storage_permissions" {
  description = "Storage permissions for the Key Vault."
  type        = list(string)
}

// Variables for secrets in Key Vault
variable "secret_name" {
  description = "Name of the secret in the Key Vault."
  type        = string
}
variable "secret_value" {
  description = "Value of the secret in the Key Vault."
  type        = string
  sensitive   = true
}

// Variables for storage accounts
variable "storage_account1_name" {
  description = "Name of the first storage account."
  type        = string
}
variable "storage_account1_tier" {
  description = "Tier of the first storage account."
  type        = string
}
variable "storage_account1_replication_type" {
  description = "Replication type of the first storage account."
  type        = string
}
variable "storage_account2_name" {
  description = "Name of the second storage account."
  type        = string
}
variable "storage_account2_tier" {
  description = "Tier of the second storage account."
  type        = string
}
variable "storage_account2_replication_type" {
  description = "Replication type of the second storage account."
  type        = string
}

// Variables for storage containers
variable "storage_container1_name" {
  description = "Name of the first storage container."
  type        = string
}
variable "storage_container1_access_type" {
  description = "Access type of the first storage container."
  type        = string
}

// Variables for blobs
variable "blob1_name" {
  description = "Name of the first blob."
  type        = string
}
variable "blob1_type" {
  description = "Type of the first blob."
  type        = string
}
variable "blob1_data_name" {
  description = "Data name for the first blob."
  type        = string
}

// Variables for virtual machines
variable "windows_vm1_name" {
  description = "Name of the first Windows VM."
  type        = string
}
variable "windows_vm1_size" {
  description = "Size of the first Windows VM."
  type        = string
}
variable "windows_vm1_admin_username" {
  description = "Admin username for the first Windows VM."
  type        = string
}
variable "windows_vm1_caching" {
  description = "Caching setting for the first Windows VM."
  type        = string
}
variable "windows_vm1_storage_account_type" {
  description = "Storage account type for the first Windows VM."
  type        = string
}
variable "windows_vm1_publisher" {
  description = "Publisher for the first Windows VM image."
  type        = string
}
variable "windows_vm1_offer" {
  description = "Offer for the first Windows VM image."
  type        = string
}
variable "windows_vm1_sku" {
  description = "SKU for the first Windows VM image."
  type        = string
}
variable "windows_vm1_version" {
  description = "Version for the first Windows VM image."
  type        = string
}
variable "windows_vm1_have_storage" {
  description = "Indicates whether the first Windows VM has storage."
  type        = bool
}

variable "linux_vm1_name" {
  description = "Name of the first Linux VM."
  type        = string
}
variable "linux_vm1_size" {
  description = "Size of the first Linux VM."
  type        = string
}
variable "linux_vm1_admin_username" {
  description = "Admin username for the first Linux VM."
  type        = string
}
variable "linux_vm1_public_key" {
  description = "Public key for the first Linux VM."
  type        = string
}
variable "linux_vm1_caching" {
  description = "Caching setting for the first Linux VM."
  type        = string
}
variable "linux_vm1_storage_account_type" {
  description = "Storage account type for the first Linux VM."
  type        = string
}
variable "linux_vm1_publisher" {
  description = "Publisher for the first Linux VM image."
  type        = string
}
variable "linux_vm1_offer" {
  description = "Offer for the first Linux VM image."
  type        = string
}
variable "linux_vm1_sku" {
  description = "SKU for the first Linux VM image."
  type        = string
}
variable "linux_vm1_version" {
  description = "Version for the first Linux VM image."
  type        = string
}
variable "linux_vm1_have_storage" {
  description = "Indicates whether the first Linux VM has storage."
  type        = bool
}

// Variables for MSSQL servers
variable "mssql_server1_name" {
  description = "Name of the first MSSQL server."
  type        = string
}
variable "mssql_server1_version" {
  description = "Version of the first MSSQL server."
  type        = string
}
variable "mssql_server1_administrator_login" {
  description = "Administrator login for the first MSSQL server."
  type        = string
}
variable "mssql_server1_firewall_name" {
  description = "Firewall name for the first MSSQL server."
  type        = string
}
variable "mssql_server1_firewall_start_ip_address" {
  description = "Start IP address for the first MSSQL server firewall."
  type        = string
}
variable "mssql_server1_firewall_end_ip_address" {
  description = "End IP address for the first MSSQL server firewall."
  type        = string
}

// Variables for MSSQL databases
variable "mssql_db1_name" {
  description = "Name of the first MSSQL database."
  type        = string
}
variable "mssql_db1_sku_name" {
  description = "SKU name for the first MSSQL database."
  type        = string
}
variable "mssql_db1_zone_redundant" {
  description = "Indicates if the first MSSQL database is zone redundant."
  type        = bool
}
variable "mssql_db1_enclave_type" {
  description = "Enclave type for the first MSSQL database."
  type        = string
}
variable "mssql_db1_prevent_destroy" {
  description = "Indicates if the first MSSQL database should prevent destroy."
  type        = bool
}

// Variables for firewalls
variable "firewall_001_name" {
  description = "Name of the first firewall."
  type        = string
}
variable "firewall_001_sku_name" {
  description = "SKU name for the first firewall."
  type        = string
}
variable "firewall_001_sku_tier" {
  description = "SKU tier for the first firewall."
  type        = string
}
variable "firewall_001_ip_configuration_name" {
  description = "IP configuration name for the first firewall."
  type        = string
}

// Variables for firewall network rules
variable "network_rule_001_name" {
  description = "Name of the first network rule."
  type        = string
}
variable "network_rule_001_priority" {
  description = "Priority of the first network rule."
  type        = number
}
variable "network_rule_001_action" {
  description = "Action of the first network rule."
  type        = string
}
variable "network_rule1_name" {
  description = "Name of the first rule within the network rule set."
  type        = string
}
variable "network_rule1_source_addresses" {
  description = "Source addresses for the first rule within the network rule set."
  type        = list(string)
}
variable "network_rule1_destination_ports" {
  description = "Destination ports for the first rule within the network rule set."
  type        = list(string)
}
variable "network_rule1_protocols" {
  description = "Protocols for the first rule within the network rule set."
  type        = list(string)
}

// Variables for route table
variable "route_table_1_name" {
  description = "Name of the first Route table."
  type        = string
}

//Variable for the routes
variable "route_1_name" {
  description = "Name of the first Route."
  type        = string
}
variable "route_1_address_prefix" {
  description = "Source address prefix of the route."
  type        = string
}
variable "route_1_next_hop_type" {
  description = "Specifies the type of next hop for the route. Possible values include VirtualNetworkGateway, VpnGateway, Internet, VirtualAppliance, or None."
  type        = string
}
