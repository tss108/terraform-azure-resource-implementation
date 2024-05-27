resource "azurerm_key_vault" "keyvault" {
  for_each                    = var.keyvault_instances
  name                        = each.value.name
  resource_group_name         = each.value.resource_group_name
  location                    = each.value.location
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption #true
  tenant_id                   = each.value.tenant_id
  sku_name                    = each.value.sku_name                   #"standard"
  soft_delete_retention_days  = each.value.soft_delete_retention_days #7
  purge_protection_enabled    = each.value.purge_protection_enabled   #false

  access_policy {
    tenant_id = each.value.tenant_id
    object_id = each.value.object_id

    key_permissions     = each.value.key_permissions
    secret_permissions  = each.value.secret_permissions
    storage_permissions = each.value.storage_permissions
  }
}

resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.secret_instances
  name         = each.value.name
  value        = each.value.value
  key_vault_id = each.value.key_vault_id
}



