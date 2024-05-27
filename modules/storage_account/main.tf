
# Defining Storage Acount Configuration
resource "azurerm_storage_account" "storage_account" {
  for_each                 = var.storage_account_instances
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

# Creating Container
resource "azurerm_storage_container" "storage_container" {
  for_each              = var.storage_container_instances 
  name                  = each.value.name
  storage_account_name  = each.value.storage_account_name
  container_access_type = each.value.container_access_type
}
# Creating Blob in Container
resource "azurerm_storage_blob" "blob" {
  for_each               = var.blob_instances 
  name                   = each.value.name
  storage_account_name   = each.value.storage_account_name
  storage_container_name = each.value.storage_container_name
  type                   = each.value.type
  source                 = ".//modules//storage_account//${each.value.data_name}"
}