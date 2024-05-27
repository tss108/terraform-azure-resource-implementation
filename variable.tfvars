# Variables for NSG rules
nsg_rule_rdp_name                       = "AllowRDP"
nsg_rule_rdp_priority                   = 100
nsg_rule_rdp_direction                  = "Inbound"
nsg_rule_rdp_access                     = "Allow"
nsg_rule_rdp_protocol                   = "Tcp"
nsg_rule_rdp_source_port_range          = "*"
nsg_rule_rdp_destination_port_range     = "3389"
nsg_rule_rdp_source_address_prefix      = "*"
nsg_rule_rdp_destination_address_prefix = "*"

nsg_rule_ssh_name                       = "AllowSSH"
nsg_rule_ssh_priority                   = 101
nsg_rule_ssh_direction                  = "Inbound"
nsg_rule_ssh_access                     = "Allow"
nsg_rule_ssh_protocol                   = "Tcp"
nsg_rule_ssh_source_port_range          = "*"
nsg_rule_ssh_destination_port_range     = "22"
nsg_rule_ssh_source_address_prefix      = "*"
nsg_rule_ssh_destination_address_prefix = "*"

nsg_rule_http_name                       = "AllowHTTP"
nsg_rule_http_priority                   = 102
nsg_rule_http_direction                  = "Inbound"
nsg_rule_http_access                     = "Allow"
nsg_rule_http_protocol                   = "Tcp"
nsg_rule_http_source_port_range          = "*"
nsg_rule_http_destination_port_range     = "80"
nsg_rule_http_source_address_prefix      = "*"
nsg_rule_http_destination_address_prefix = "*"

nsg_rule_https_name                       = "AllowHTTPS"
nsg_rule_https_priority                   = 103
nsg_rule_https_direction                  = "Inbound"
nsg_rule_https_access                     = "Allow"
nsg_rule_https_protocol                   = "Tcp"
nsg_rule_https_source_port_range          = "*"
nsg_rule_https_destination_port_range     = "443"
nsg_rule_https_source_address_prefix      = "*"
nsg_rule_https_destination_address_prefix = "*"

nsg_rule_deny_all_outbound_name                       = "DenyAllOutbound"
nsg_rule_deny_all_outbound_priority                   = 200
nsg_rule_deny_all_outbound_direction                  = "Outbound"
nsg_rule_deny_all_outbound_access                     = "Deny"
nsg_rule_deny_all_outbound_protocol                   = "*"
nsg_rule_deny_all_outbound_source_port_range          = "*"
nsg_rule_deny_all_outbound_destination_port_range     = "*"
nsg_rule_deny_all_outbound_source_address_prefix      = "*"
nsg_rule_deny_all_outbound_destination_address_prefix = "*"

# Variables for resource groups
resource_group_1_name     = "rg-test-001"
resource_group_1_location = "EastUS"
resource_group_2_name     = "rg-test-002"
resource_group_2_location = "EastUS"

# Variables for virtual network
virtual_network_1_name          = "vnet1"
virtual_network_1_address_space = "10.0.0.0/16"

# Variables for subnets
subnet_1_name                      = "frontend"
subnet_1_address_prefixes          = "10.0.1.0/24"
subnet_2_name                      = "backend"
subnet_2_address_prefixes          = "10.0.2.0/24"
firewall_subnet_1_name             = "AzureFirewallSubnet"
firewall_subnet_1_address_prefixes = "10.0.3.0/24"

# Variables for public IP addresses
public_ip1_name              = "ip1"
public_ip1_allocation_method = "Static"
public_ip1_domain_name_label = "testfinalproject001"
public_ip1_sku               = "Basic"
public_ip1_sku_tier          = "Regional"
public_ip1_environment_tag   = "test"
public_ip2_name              = "ip2"
public_ip2_allocation_method = "Static"
public_ip2_domain_name_label = "testfinalproject002"
public_ip2_sku               = "Basic"
public_ip2_sku_tier          = "Regional"
public_ip2_environment_tag   = "test"
public_ip3_name              = "ip3"
public_ip3_allocation_method = "Static"
public_ip3_domain_name_label = "testfinalproject003"
public_ip3_sku               = "Standard"
public_ip3_sku_tier          = "Regional"
public_ip3_environment_tag   = "test"

# Variables for network security groups (NSG)
windows_vm_nsg_1_name = "windows-nsg-001"
linux_vm_nsg_1_name   = "linux-nsg-001"

# Variables for network interface cards (NIC)
nic_1_name                  = "nic1"
nic_1_ip_configuration_name = "internal"
nic_1_ip_allocation_method  = "Dynamic"
nic_1_ip_address_id         = ""
nic_2_name                  = "nic2"
nic_2_ip_configuration_name = "internal"
nic_2_ip_allocation_method  = "Dynamic"
nic_2_ip_address_id         = ""

# Variables for Key Vault
keyvault_1_name                        = "kevalulttloshsitvaj"
keyvault_1_enabled_for_disk_encryption = true
keyvault_1_sku_name                    = "standard"
keyvault_1_soft_delete_retention_days  = 7
keyvault_1_purge_protection_enabled    = false
keyvault_1_key_permissions             = ["Create", "Get"]
keyvault_1_secret_permissions          = ["Set", "Get", "Delete", "Purge", "Recover"]
keyvault_1_storage_permissions         = ["Get", "Set"]

# Variables for secrets in Key Vault
secret_name = "allroundersecret"

# Variables for storage accounts
storage_account1_name             = "shivastoragebonjetoten"
storage_account1_tier             = "Standard"
storage_account1_replication_type = "LRS"
storage_account2_name             = "lordshivadanceond"
storage_account2_tier             = "Standard"
storage_account2_replication_type = "LRS"

# Variables for storage containers
storage_container1_name        = "containeronne"
storage_container1_access_type = "container"

# Variables for blobs
blob1_name      = "blobone"
blob1_type      = "Block"
blob1_data_name = "container.txt"

# Variables for virtual machines
windows_vm1_name                 = "win-vm-001"
windows_vm1_size                 = "Standard_F2"
windows_vm1_admin_username       = "adminuser"
windows_vm1_caching              = "ReadWrite"
windows_vm1_storage_account_type = "Standard_LRS"
windows_vm1_publisher            = "MicrosoftWindowsServer"
windows_vm1_offer                = "WindowsServer"
windows_vm1_sku                  = "2016-Datacenter"
windows_vm1_version              = "latest"
windows_vm1_have_storage         = false

linux_vm1_name                 = "lin-vm-001"
linux_vm1_size                 = "Standard_F2"
linux_vm1_admin_username       = "rootadmin"
linux_vm1_public_key           = "~/.ssh/id_rsa.pub"
linux_vm1_caching              = "ReadWrite"
linux_vm1_storage_account_type = "Standard_LRS"
linux_vm1_publisher            = "Canonical"
linux_vm1_offer                = "0001-com-ubuntu-server-jammy"
linux_vm1_sku                  = "22_04-lts"
linux_vm1_version              = "latest"
linux_vm1_have_storage         = true

# Variables for MSSQL servers
mssql_server1_name                      = "server1shivagot"
mssql_server1_version                   = "12.0"
mssql_server1_administrator_login       = "rootadmin"
mssql_server1_firewall_name             = "server1_firewall"
mssql_server1_firewall_start_ip_address = "0.0.0.0"
mssql_server1_firewall_end_ip_address   = "0.0.0.0"

# Variables for MSSQL databases
mssql_db1_name            = "database1"
mssql_db1_sku_name        = "S0"
mssql_db1_zone_redundant  = false
mssql_db1_enclave_type    = "VBS"
mssql_db1_prevent_destroy = false

# Variables for firewalls
firewall_001_name                  = "azurefirewhalkll"
firewall_001_sku_name              = "AZFW_VNet"
firewall_001_sku_tier              = "Standard"
firewall_001_ip_configuration_name = "configuration"

# Variables for firewall network rules
network_rule_001_name           = "NetworkRuleCollection"
network_rule_001_priority       = 100
network_rule_001_action         = "Allow"
network_rule1_name              = "Allow-Incoming-Traffic"
network_rule1_source_addresses  = ["*"]
network_rule1_destination_ports = ["80", "443", "22", "3389"]
network_rule1_protocols         = ["TCP", "UDP"]

# Variable for the route table
route_table_1_name = "route-table-001"

# Variable for the routes 
route_1_name           = "route-to-firewall"
route_1_address_prefix = "0.0.0.0/0"
route_1_next_hop_type  = "VirtualAppliance"
