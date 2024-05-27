
# Terraform Azure Resource Implementation

This project provides Terraform configurations for deploying various Azure resources. The structure is modular, allowing you to pick and choose the components you need for your infrastructure. Each module corresponds to a different Azure resource, making it easy to manage and scale your infrastructure as code.



## Project Structure

```bash
├── modules
│   ├── firewall
│   ├── mssql
│   ├── network_interface_card
│   ├── network_profile
│   ├── public_ip
│   ├── redis_cache
│   ├── resource_group
│   ├── route_table
│   ├── storage_account
│   ├── vault
│   ├── virtual_machine
├── backend.tf
├── main.tf
├── provider.tf
├── read.md
├── variable.tf
├── variable.tfvars
```


    
## Getting Started

#### Prerequisites: 
Terraform installed on your machine. Follow the official guide to install Terraform.\
An Azure account with sufficient permissions to create resources.
Azure CLI installed and configured. Follow the official guide to install and configure Azure CLI.

#### Setting Up Environment Variables:
Before running the Terraform scripts, you need to set up your Azure service principal credentials as environment variables in your terminal:
```bash
export TF_VAR_client_id=your-client-id
export TF_VAR_client_secret=your-client-secret
export TF_VAR_tenant_id=your-tenant-id
export TF_VAR_subscription_id=your-subscription-id
```

## Running Terraform
- Initialize the Terraform configuration:
```bash
terraform init
```
#
- Plan the deployment to see what resources will be created:
```bash
terraform plan -var-file="variable.tfvars"
```
#
- Apply the configuration to create the resources:
```bash
terraform apply -var-file="variable.tfvars"
```
#
- When you no longer need the resources, you can destroy them using:
```bash
terraform destroy -var-file="variable.tfvars"
```

## Modules
Modules
The project includes the following modules:\
- firewall: Manages Azure Firewall resources.
- mssql: Manages Microsoft SQL Server resources.
- network_interface_card: Manages NIC resources.
- network_profile: Manages network profiles.
- public_ip: Manages public IP addresses.
- redis_cache: Manages Azure Redis Cache resources.
- resource_group: Manages resource groups.
- route_table: Manages route tables.
- storage_account: Manages storage accounts.
- vault: Manages Azure Key Vault resources.
- virtual_machine: Manages virtual machines.








