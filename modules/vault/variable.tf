variable "keyvault_instances" {
  description = "Map of Key Vault instances to create"
  type = map(object({
    name                        = string
    resource_group_name         = string
    location                    = string
    enabled_for_disk_encryption = bool
    tenant_id                   = string
    sku_name                    = string
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    object_id                   = string
    key_permissions             = list(string)
    secret_permissions          = list(string)
    storage_permissions         = list(string)
  }))
  default = {
  }
}

variable "secret_instances" {
  description = "Map of Key Vault secrets to create"
  type = map(object({
    name         = string
    value        = string
    key_vault_id = string
  }))
  default = {
  }
}
